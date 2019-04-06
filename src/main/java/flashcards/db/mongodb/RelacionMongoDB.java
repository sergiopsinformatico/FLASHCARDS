package main.java.flashcards.db.mongodb;

import java.util.ArrayList;
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
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.dto.RelacionDTO;

public class RelacionMongoDB implements InterfaceDAORelacion{
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionRelaciones;
    Document doc;
    LinkedList<RelacionDTO> relaciones;
    Bson criterios;
    MongoCursor<Document> cursor;
    RelacionDTO relacion;
    String tipoRelacion;
    boolean encontrado;
    List<String> lista;
    int indice;
    
  //Logger
  	private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.RelacionMongoDB");
  	
  	static final String USUARIO = "usuario";
  	static final String AMIGOS = "amigos";
	
  	//Constructor
  	public RelacionMongoDB() {
  		connection();
  	}
  	
	//Conexion con la BD
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
	
    public boolean createRelacionUsuario(RelacionDTO relacion) {
		try {
			doc = new Document().
				  append(USUARIO, relacion.getUsuario()).
				  append("peticionesEnviadas", relacion.getPeticionesEnviadas()).
				  append("peticionesRecibidas", relacion.getPeticionesRecibidas()).
				  append(AMIGOS, relacion.getAmigos()).
				  append("usuariosBloqueados", relacion.getBloqueados()).
				  append("usuariosBloqueadores",relacion.getBloqueadoPor());
			
			coleccionRelaciones.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
    public RelacionDTO readRelacionUsuario(String usuario) {
    	try {
    		criterios = new BsonDocument().
    				    append(USUARIO, new BsonString(usuario));
    		cursor = coleccionRelaciones.find(criterios).iterator();
    		if(cursor.hasNext()) {
    			doc = cursor.next();
    			return new RelacionDTO(doc.getString(USUARIO), (ArrayList<String>)doc.get("peticionesEnviadas"),
    								   (ArrayList<String>)doc.get("peticionesRecibidas"), (ArrayList<String>)doc.get(AMIGOS),
    					               (ArrayList<String>)doc.get("usuariosBloqueados"), (ArrayList<String>)doc.get("usuariosBloqueadores"));
    		}else {
    			return null;
    		}
    	}catch(Exception ex) {
    		return null;
    	}
    }
    
	public boolean updateRelacionUsuario(RelacionDTO relacion) {
		return (deleteRelacionUsuario(relacion.getUsuario()) &&
				createRelacionUsuario(relacion));
	}
	
	public boolean deleteRelacionUsuario(String usuario) {
		try {
			criterios = new BsonDocument().
				    append(USUARIO, new BsonString(usuario));
			coleccionRelaciones.deleteOne(criterios);
    		return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public String getTipoRelacion(String user1, String user2) {
		relacion = readRelacionUsuario(user1);
		encontrado = false;
		tipoRelacion = "";
		
		if(relacion.getAmigos().contains(user2)) {
			tipoRelacion = AMIGOS;
		}else if(relacion.getBloqueados().contains(user2)) {
			tipoRelacion = "bloqueado";
		}else if(relacion.getPeticionesEnviadas().contains(user2)) {
			tipoRelacion = "pdaEnvia";
		}else if(relacion.getPeticionesRecibidas().contains(user2)) {
			tipoRelacion = "pdaRecibe";
		}else {
			tipoRelacion = "none";
		}
		
		/*lista = relacion.getAmigos();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user2)) {
				encontrado = true;
				tipoRelacion = AMIGOS;
				break;
			}
		}
		
		if(!encontrado) {
			lista = relacion.getBloqueados();
			for(indice=0; indice<lista.size(); indice++) {
				if(lista.get(indice).equals(user2)) {
					encontrado = true;
					tipoRelacion = "bloqueado";
					break;
				}
			}
			if(!encontrado) {
				
				lista = relacion.getPeticionesEnviadas();
				for(indice=0; indice<lista.size(); indice++) {
					if(lista.get(indice).equals(user2)) {
						encontrado = true;
						tipoRelacion = "pdaEnvia";
						break;
					}
				}
				
				if(!encontrado) {
					lista = relacion.getPeticionesRecibidas();
					for(indice=0; indice<lista.size(); indice++) {
						if(lista.get(indice).equals(user2)) {
							encontrado = true;
							tipoRelacion = "pdaRecibe";
							break;
						}
					}
					
					if(!encontrado) {
						tipoRelacion = "none";
					}
				}
			}
		}*/
		
		
		
		return tipoRelacion;
	}
	
	public boolean eliminarAmigo(String user1, String user2) {
		relacion = readRelacionUsuario(user1);
		lista = relacion.getAmigos();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user2)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setAmigos(lista);
		updateRelacionUsuario(relacion);
		
		relacion = readRelacionUsuario(user2);
		lista = relacion.getAmigos();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user1)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setAmigos(lista);
		updateRelacionUsuario(relacion);
		
		return true;
	}
	
	public boolean bloqueaUsuario(String user1, String user2) {
		relacion = readRelacionUsuario(user1);
		/*lista = relacion.getAmigos();
		for(indice=0;indice<lista.size();indice++) {
			if(lista.get(indice).equals(user2)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setAmigos(lista);
		lista = relacion.getPeticionesEnviadas();
		for(indice=0;indice<lista.size();indice++) {
			if(lista.get(indice).equals(user2)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setPeticionesEnviadas(lista);
		lista = relacion.getPeticionesRecibidas();
		for(indice=0;indice<lista.size();indice++) {
			if(lista.get(indice).equals(user2)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setPeticionesRecibidas(lista);*/
		
		if(relacion.getAmigos().contains(user2)) {
			lista = relacion.getAmigos();
			lista.remove(user2);
			relacion.setAmigos(lista);
		}else if(relacion.getPeticionesEnviadas().contains(user2)) {
			lista = relacion.getPeticionesEnviadas();
			lista.remove(user2);
			relacion.setPeticionesEnviadas(lista);
		}else if(relacion.getPeticionesRecibidas().contains(user2)) {
			lista = relacion.getPeticionesRecibidas();
			lista.remove(user2);
			relacion.setPeticionesRecibidas(lista);
		}
		
		lista = relacion.getBloqueados();
		lista.add(user2);
		relacion.setBloqueados(lista);
		updateRelacionUsuario(relacion);
		
		relacion = readRelacionUsuario(user2);
		/*lista = relacion.getAmigos();
		for(indice=0;indice<lista.size();indice++) {
			if(lista.get(indice).equals(user1)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setAmigos(lista);
		lista = relacion.getPeticionesEnviadas();
		for(indice=0;indice<lista.size();indice++) {
			if(lista.get(indice).equals(user1)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setPeticionesEnviadas(lista);
		lista = relacion.getPeticionesRecibidas();
		for(indice=0;indice<lista.size();indice++) {
			if(lista.get(indice).equals(user1)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setPeticionesRecibidas(lista);*/
		
		if(relacion.getAmigos().contains(user1)) {
			lista = relacion.getAmigos();
			lista.remove(user1);
			relacion.setAmigos(lista);
		}else if(relacion.getPeticionesEnviadas().contains(user1)) {
			lista = relacion.getPeticionesEnviadas();
			lista.remove(user1);
			relacion.setPeticionesEnviadas(lista);
		}else if(relacion.getPeticionesRecibidas().contains(user1)) {
			lista = relacion.getPeticionesRecibidas();
			lista.remove(user1);
			relacion.setPeticionesRecibidas(lista);
		}
		
		lista = relacion.getBloqueadoPor();
		lista.add(user1);
		relacion.setBloqueadoPor(lista);
		updateRelacionUsuario(relacion);
		
		return true;
	}
	
	public boolean desbloqueaUsuario(String user1, String user2) {
		relacion = readRelacionUsuario(user1);
		lista = relacion.getBloqueados();
		
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user2)) {
				lista.remove(indice);
				break;
			}
		}
		
		relacion.setBloqueados(lista);
		updateRelacionUsuario(relacion);
		
		relacion = readRelacionUsuario(user2);
		lista = relacion.getBloqueadoPor();
		
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user1)) {
				lista.remove(indice);
				break;
			}
		}
		
		relacion.setBloqueadoPor(lista);
		updateRelacionUsuario(relacion);
		
		return true;
	}
	
	public boolean aceptaPdA(String user1, String user2) {
		relacion = readRelacionUsuario(user1);
		
		lista = relacion.getPeticionesRecibidas();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user2)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setPeticionesRecibidas(lista);
		
		lista = relacion.getAmigos();
		lista.add(user2);
		relacion.setAmigos(lista);
		
		updateRelacionUsuario(relacion);
		
		
		relacion = readRelacionUsuario(user2);
		
		lista = relacion.getPeticionesEnviadas();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user1)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setPeticionesEnviadas(lista);
		
		lista = relacion.getAmigos();
		lista.add(user1);
		relacion.setAmigos(lista);
		
		updateRelacionUsuario(relacion);
		
		return true;
		
	}
	
	public boolean rechazaPdA(String user1, String user2) {
		relacion = readRelacionUsuario(user1);
		
		lista = relacion.getPeticionesRecibidas();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user2)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setPeticionesRecibidas(lista);
		
		updateRelacionUsuario(relacion);
		
		relacion = readRelacionUsuario(user2);
		
		lista = relacion.getPeticionesEnviadas();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(user1)) {
				lista.remove(indice);
				break;
			}
		}
		relacion.setPeticionesEnviadas(lista);
		
		updateRelacionUsuario(relacion);
		
		return true;
	}
	
	public boolean enviarPdA(String user1, String user2) {
		relacion = readRelacionUsuario(user1);
		lista = relacion.getPeticionesEnviadas();
		lista.add(user2);
		relacion.setPeticionesEnviadas(lista);
		updateRelacionUsuario(relacion);
		
		relacion = readRelacionUsuario(user2);
		lista = relacion.getPeticionesRecibidas();
		lista.add(user1);
		relacion.setPeticionesRecibidas(lista);
		updateRelacionUsuario(relacion);
		
		return true;
	}
	
}
