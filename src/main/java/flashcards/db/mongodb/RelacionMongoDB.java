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
	
	public boolean insertarRelacion(RelacionDTO relacion) {
		try {
			doc = new Document().
				  append("username1", relacion.getUsername1()).
				  append("username2", relacion.getUsername2()).
				  append("tipo", relacion.getTipoRelacion());
			coleccionRelaciones.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public List<RelacionDTO> getPeticionesEnviadas(String username){
		relaciones = new LinkedList<>();
		criterios = new BsonDocument().
				    append("username1", new BsonString(username)).
				    append("tipo", new BsonString("envia"));
		cursor = coleccionRelaciones.find(criterios).iterator();
		while(cursor.hasNext()) {
			doc = cursor.next();
			relaciones.add(new RelacionDTO(doc.getString("username1"), doc.getString("username2"), doc.getString("tipo")));
		}
		return relaciones;
	}
}
