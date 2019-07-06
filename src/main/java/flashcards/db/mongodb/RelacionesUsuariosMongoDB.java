package main.java.flashcards.db.mongodb;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import main.java.flashcards.auxiliares.PropertiesConfig;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.dto.RelacionesUsuariosDTO;

public class RelacionesUsuariosMongoDB implements InterfaceDAORelacionesUsuarios {
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionRelaciones;
    Document doc;
    RelacionesUsuariosDTO relacionesUser;
    Bson criteriosBusqueda;
    MongoCursor<Document>iterador;
    RelacionesUsuariosDTO user;
    List<String> listaUser;
    int indice;
    
    //Logger
  	private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.RelacionesUsuariosMongoDB");
	
	public RelacionesUsuariosMongoDB() {
		connection();
	}
	
	private void connection() {
		try {
			uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionRelaciones = db.getCollection(PropertiesConfig.getProperties("colRelaciones"));
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
	}
	
	public boolean creaRelaciones(RelacionesUsuariosDTO relaciones) {
		try {
				doc = new Document().append("usuario", relaciones.getUsername())
									.append("pdaEnviadas", relaciones.getPeticionesAmistadEnviadas())
									.append("pdaRecibidas", relaciones.getPeticionesAmistadRecibidas())
									.append("amigos", relaciones.getAmigos())
									.append("bloqueados", relaciones.getBloqueados())
									.append("bloqueadores", relaciones.getBloqueadores());
				coleccionRelaciones.insertOne(doc);
				return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public RelacionesUsuariosDTO leerRelaciones(String username) {
		criteriosBusqueda = new BsonDocument().append("usuario", new BsonString(username));
		iterador = coleccionRelaciones.find(criteriosBusqueda).iterator();
		if(iterador.hasNext()) {
			doc = iterador.next();
			relacionesUser = new RelacionesUsuariosDTO(doc.getString("usuario"),
													   (List<String>)doc.get("pdaEnviadas"),
													   (List<String>)doc.get("pdaRecibidas"),
													   (List<String>)doc.get("amigos"),
													   (List<String>)doc.get("bloqueados"),
													   (List<String>)doc.get("bloqueadores"));
			return relacionesUser;
		}else {
			return null;
		}
	}
	
	public boolean actualizaRelaciones(RelacionesUsuariosDTO relaciones) {
		return (eliminaRelaciones(relaciones.getUsername()) && 
				creaRelaciones(relaciones));
	}
	
	public boolean eliminaRelaciones (String username) {
		try {
			criteriosBusqueda = new BsonDocument().append("usuario", new BsonString(username));
			coleccionRelaciones.deleteOne(criteriosBusqueda);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	public boolean enviarPeticionAmistad(String envia, String recibe) {
		try {
			user = leerRelaciones(envia);
			listaUser = user.getPeticionesAmistadEnviadas();
			listaUser.add(recibe);
			user.setPeticionesAmistadEnviadas(listaUser);
			actualizaRelaciones(user);
			
			user = leerRelaciones(recibe);
			listaUser = user.getPeticionesAmistadRecibidas();
			listaUser.add(envia);
			user.setPeticionesAmistadRecibidas(listaUser);
			actualizaRelaciones(user);
			
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	public List<String> getPeticionesAmistadEnviadas(String username) {
		user = leerRelaciones(username);
		if(user!=null) {
			return user.getPeticionesAmistadEnviadas();
		}else {
			return null;
		}
	}

	public List<String> getPeticionesRecibidas(String username) {
		user = leerRelaciones(username);
		if(user!=null) {
			return user.getPeticionesAmistadRecibidas();
		}else {
			return null;
		}
	}

	public boolean aceptarInvitacion(String acepta, String amigoNuevo) {
		try {
			user = leerRelaciones(acepta);
			listaUser = user.getAmigos();
			listaUser.add(amigoNuevo);
			user.setAmigos(listaUser);
			listaUser = user.getPeticionesAmistadRecibidas();
			listaUser = eliminarUsuarioLista(listaUser, amigoNuevo);
			user.setPeticionesAmistadRecibidas(listaUser);			
			actualizaRelaciones(user);
			
			user = leerRelaciones(amigoNuevo);
			listaUser = user.getAmigos();
			listaUser.add(acepta);
			user.setAmigos(listaUser);
			listaUser = user.getPeticionesAmistadEnviadas();
			listaUser = eliminarUsuarioLista(listaUser, acepta);
			user.setPeticionesAmistadEnviadas(listaUser);			
			actualizaRelaciones(user);
			
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	public boolean rechazarInvitacion(String rechaza, String usuarioRechazado) {
		try {
			user = leerRelaciones(rechaza);
			listaUser = user.getPeticionesAmistadRecibidas();
			listaUser = eliminarUsuarioLista(listaUser, usuarioRechazado);
			user.setPeticionesAmistadRecibidas(listaUser);			
			actualizaRelaciones(user);
			
			user = leerRelaciones(usuarioRechazado);
			listaUser = user.getPeticionesAmistadEnviadas();
			listaUser = eliminarUsuarioLista(listaUser, rechaza);
			user.setPeticionesAmistadEnviadas(listaUser);			
			actualizaRelaciones(user);
			
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	public List<String> getAmigos(String username) {
		user = leerRelaciones(username);
		if(user!=null) {
			return user.getAmigos();
		}else {
			return null;
		}
	}
	
	public boolean eliminarAmigo(String amigo1, String amigo2) {
		try {
			user = leerRelaciones(amigo1);
			listaUser = user.getAmigos();
			listaUser = eliminarUsuarioLista(listaUser, amigo2);
			user.setAmigos(listaUser);
			actualizaRelaciones(user);
			
			user = leerRelaciones(amigo2);
			listaUser = user.getAmigos();
			listaUser = eliminarUsuarioLista(listaUser, amigo1);
			user.setAmigos(listaUser);
			actualizaRelaciones(user);
			
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	public boolean bloquearUsuario(String bloqueador, String bloqueado) {
		try {
			user = leerRelaciones(bloqueador);
			
			listaUser = user.getAmigos();
			listaUser = eliminarUsuarioLista(listaUser, bloqueado);
			user.setAmigos(listaUser);
			listaUser = user.getPeticionesAmistadEnviadas();
			listaUser = eliminarUsuarioLista(listaUser, bloqueado);
			user.setPeticionesAmistadEnviadas(listaUser);
			listaUser = user.getPeticionesAmistadRecibidas();
			listaUser = eliminarUsuarioLista(listaUser, bloqueado);
			user.setPeticionesAmistadRecibidas(listaUser);
			
			listaUser = user.getBloqueados();
			listaUser.add(bloqueado);
			user.setBloqueados(listaUser);			
			actualizaRelaciones(user);
			
			user = leerRelaciones(bloqueado);
			
			listaUser = user.getAmigos();
			listaUser = eliminarUsuarioLista(listaUser, bloqueador);
			user.setAmigos(listaUser);
			listaUser = user.getPeticionesAmistadEnviadas();
			listaUser = eliminarUsuarioLista(listaUser, bloqueador);
			user.setPeticionesAmistadEnviadas(listaUser);
			listaUser = user.getPeticionesAmistadRecibidas();
			listaUser = eliminarUsuarioLista(listaUser, bloqueador);
			user.setPeticionesAmistadRecibidas(listaUser);
			
			listaUser = user.getBloqueadores();
			listaUser.add(bloqueador);
			user.setBloqueadores(listaUser);			
			actualizaRelaciones(user);
			
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	public boolean desbloquearUsuario(String bloqueador, String desbloqueado) {
		try {
			user = leerRelaciones(bloqueador);
			listaUser = user.getBloqueados();
			listaUser = eliminarUsuarioLista(listaUser, desbloqueado);
			user.setBloqueados(listaUser);			
			actualizaRelaciones(user);
			
			user = leerRelaciones(desbloqueado);
			listaUser = user.getBloqueadores();
			listaUser = eliminarUsuarioLista(listaUser, bloqueador);
			user.setBloqueadores(listaUser);			
			actualizaRelaciones(user);
			
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	private List<String> eliminarUsuarioLista(List<String> lista, String usuario){
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(usuario)) {
				lista.remove(indice);
				indice = lista.size();
			}
		}
		return lista;
	}

	public List<String> getBloqueados(String username) {
		user = leerRelaciones(username);
		if(user!=null) {
			return user.getBloqueados();
		}else {
			return null;
		}
	}

	public List<String> getBloqueadores(String username) {
		user = leerRelaciones(username);
		if(user!=null) {
			return user.getBloqueadores();
		}else {
			return null;
		}
	}

}
