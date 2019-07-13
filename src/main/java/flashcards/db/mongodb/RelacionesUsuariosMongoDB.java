package main.java.flashcards.db.mongodb;

import java.util.LinkedList;
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
    boolean encontrado;
	List<String> amigos;
	List<String> bloqueadores;
	List<String> bloqueados;
	List<String> pdaEnv;
	List<String> pdaRec;
	String tipoRelacion;
    
    //Logger
  	private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.RelacionesUsuariosMongoDB");
  	
  	//Constantes
  	static final String CONST_USUARIO = "usuario";
  	static final String CONST_PDA_ENV = "pdaEnviadas";
  	static final String CONST_PDA_REC = "pdaRecibidas";
  	static final String CONST_AMIGOS = "amigos";
  	static final String CONST_BLOQUEADOS = "bloqueados";
  	static final String CONST_BLOQUEADORES = "bloqueadores";
	
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
				doc = new Document().append(CONST_USUARIO, relaciones.getUsername())
									.append(CONST_PDA_ENV, relaciones.getPeticionesAmistadEnviadas())
									.append(CONST_PDA_REC, relaciones.getPeticionesAmistadRecibidas())
									.append(CONST_AMIGOS, relaciones.getAmigos())
									.append(CONST_BLOQUEADOS, relaciones.getBloqueados())
									.append(CONST_BLOQUEADORES, relaciones.getBloqueadores());
				coleccionRelaciones.insertOne(doc);
				return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public RelacionesUsuariosDTO leerRelaciones(String username) {
		criteriosBusqueda = new BsonDocument().append(CONST_USUARIO, new BsonString(username));
		iterador = coleccionRelaciones.find(criteriosBusqueda).iterator();
		if(iterador.hasNext()) {
			doc = iterador.next();
			relacionesUser = new RelacionesUsuariosDTO(doc.getString(CONST_USUARIO),
													   (List<String>)doc.get(CONST_PDA_ENV),
													   (List<String>)doc.get(CONST_PDA_REC),
													   (List<String>)doc.get(CONST_AMIGOS),
													   (List<String>)doc.get(CONST_BLOQUEADOS),
													   (List<String>)doc.get(CONST_BLOQUEADORES));
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
			criteriosBusqueda = new BsonDocument().append(CONST_USUARIO, new BsonString(username));
			coleccionRelaciones.deleteOne(criteriosBusqueda);
			
			iterador = coleccionRelaciones.find().iterator();
			while(iterador.hasNext()) {
				doc = iterador.next();
				relacionesUser = new RelacionesUsuariosDTO(doc.getString(CONST_USUARIO),
														   (List<String>)doc.get(CONST_PDA_ENV),
														   (List<String>)doc.get(CONST_PDA_REC),
														   (List<String>)doc.get(CONST_AMIGOS),
														   (List<String>)doc.get(CONST_BLOQUEADOS),
														   (List<String>)doc.get(CONST_BLOQUEADORES));
				
				
				
				amigos = relacionesUser.getAmigos();
				
				for(indice=0; indice<amigos.size(); indice++) {
					if(amigos.get(indice).equals(username)) {
						amigos.remove(indice);
						indice = amigos.size();
					}
				}
				
				relacionesUser.setAmigos(amigos);
				
				bloqueados = relacionesUser.getBloqueados();
				
				for(indice=0; indice<bloqueados.size(); indice++) {
					if(bloqueados.get(indice).equals(username)) {
						bloqueados.remove(indice);
						indice = bloqueados.size();
					}
				}
				
				relacionesUser.setBloqueados(bloqueados);
				
				bloqueadores = relacionesUser.getBloqueadores();
				
				for(indice=0; indice<bloqueadores.size(); indice++) {
					if(bloqueadores.get(indice).equals(username)) {
						bloqueadores.remove(indice);
						indice = bloqueadores.size();
					}
				}
				
				relacionesUser.setBloqueadores(bloqueadores);
				
				pdaEnv = relacionesUser.getPeticionesAmistadEnviadas();
				
				for(indice=0; indice<pdaEnv.size(); indice++) {
					if(pdaEnv.get(indice).equals(username)) {
						pdaEnv.remove(indice);
						indice = pdaEnv.size();
					}
				}
				
				relacionesUser.setPeticionesAmistadEnviadas(pdaEnv);
				
				pdaRec = relacionesUser.getPeticionesAmistadRecibidas();
				
				for(indice=0; indice<pdaRec.size(); indice++) {
					if(pdaRec.get(indice).equals(username)) {
						pdaRec.remove(indice);
						indice = pdaRec.size();
					}
				}
				
				relacionesUser.setPeticionesAmistadRecibidas(pdaRec);
				
				actualizaRelaciones(relacionesUser);
				
			}
			
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
			return new LinkedList<>();
		}
	}

	public List<String> getPeticionesRecibidas(String username) {
		user = leerRelaciones(username);
		if(user!=null) {
			return user.getPeticionesAmistadRecibidas();
		}else {
			return new LinkedList<>();
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
			return new LinkedList<>();
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
			return new LinkedList<>();
		}
	}

	public List<String> getBloqueadores(String username) {
		user = leerRelaciones(username);
		if(user!=null) {
			return user.getBloqueadores();
		}else {
			return new LinkedList<>();
		}
	}
	
	public String tipoRelacion(String usuarioPregunta, String otroUsuario) {
		amigos = getAmigos(usuarioPregunta);
		bloqueadores = getBloqueadores(usuarioPregunta);
		bloqueados = getBloqueados(usuarioPregunta);
		pdaEnv = getPeticionesAmistadEnviadas(usuarioPregunta);
		pdaRec = getPeticionesRecibidas(usuarioPregunta);
		
		encontrado = false;
		
		for(indice=0; (!encontrado) && indice<bloqueadores.size(); indice++) {
			if(bloqueadores.get(indice).equals(otroUsuario)) {
				encontrado = true;
				tipoRelacion = "";
				indice=bloqueadores.size();
				return tipoRelacion;
			}
		}
			
		for(indice=0; (!encontrado) && indice<amigos.size(); indice++) {
			if(amigos.get(indice).equals(otroUsuario)) {
				encontrado = true;
				tipoRelacion = "amigo";
				indice=amigos.size();
				return tipoRelacion;
			}
		}
		
		for(indice=0; (!encontrado) && indice<bloqueados.size(); indice++) {
			if(bloqueados.get(indice).equals(otroUsuario)) {
				encontrado = true;
				tipoRelacion = "bloqueado";
				indice=bloqueados.size();
				return tipoRelacion;
			}
		}
		
		for(indice=0; (!encontrado) && indice<pdaEnv.size(); indice++) {
			if(pdaEnv.get(indice).equals(otroUsuario)) {
				encontrado = true;
				tipoRelacion = "solEnviada";
				indice=pdaEnv.size();
				return tipoRelacion;
			}
		}
		
		for(indice=0; (!encontrado) && indice<pdaRec.size(); indice++) {
			if(pdaRec.get(indice).equals(otroUsuario)) {
				encontrado = true;
				tipoRelacion = "solRecibida";
				indice=pdaRec.size();
				return tipoRelacion;
			}
		}
		
		if(!encontrado) {
			tipoRelacion = "ninguna";
		}
		
		return tipoRelacion;

	}

}
