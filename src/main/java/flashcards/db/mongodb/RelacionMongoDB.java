package main.java.flashcards.db.mongodb;

import java.util.ArrayList;
import java.util.LinkedList;
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
    
  //Logger
  	private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.RelacionMongoDB");
	
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
	
    public boolean insertarRelacionUsuario(RelacionDTO relacion) {
		try {
			doc = new Document().
				  append("usuario", relacion.getUsuario()).
				  append("peticionesEnviadas", relacion.getPeticionesEnviadas()).
				  append("peticionesRecibidas", relacion.getPeticionesRecibidas()).
				  append("amigos", relacion.getAmigos()).
				  append("usuariosBloqueados", relacion.getBloqueados()).
				  append("usuariosBloqueadores",relacion.getBloqueadoPor());
			
			coleccionRelaciones.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
    public RelacionDTO leerRelacionUsuario(String usuario) {
    	try {
    		criterios = new BsonDocument().
    				    append("usuario", new BsonString(usuario));
    		cursor = coleccionRelaciones.find(criterios).iterator();
    		if(cursor.hasNext()) {
    			doc = cursor.next();
    			return new RelacionDTO(doc.getString("usuario"), (ArrayList<String>)doc.get("peticionesEnviadas"),
    								   (ArrayList<String>)doc.get("peticionesRecibidas"), (ArrayList<String>)doc.get("amigos"),
    					               (ArrayList<String>)doc.get("usuariosBloqueados"), (ArrayList<String>)doc.get("usuariosBloqueadores"));
    		}else {
    			return null;
    		}
    	}catch(Exception ex) {
    		return null;
    	}
    }
    
	public boolean modificaRelacionUsuario(RelacionDTO relacion) {
		return (eliminarRelacionUsuario(relacion.getUsuario()) &&
				insertarRelacionUsuario(relacion));
	}
	
	public boolean eliminarRelacionUsuario(String usuario) {
		try {
			criterios = new BsonDocument().
				    append("usuario", new BsonString(usuario));
			coleccionRelaciones.deleteOne(criterios);
    		return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
}
