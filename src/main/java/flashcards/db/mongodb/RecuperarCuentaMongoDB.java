package main.java.flashcards.db.mongodb;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import main.java.flashcards.auxiliares.PropertiesConfig;
import main.java.flashcards.db.dao.InterfaceDAORecuperarCuenta;
import main.java.flashcards.dto.RecuperarCuentaDTO;

public class RecuperarCuentaMongoDB implements InterfaceDAORecuperarCuenta {
	
	//Variables
		MongoClientURI uri; 
	    MongoClient client;
	    MongoDatabase db;
	    MongoCollection<Document> coleccionRecuperarCuenta;
	    Document doc;
	    Bson criteriosBusqueda;
	    FindIterable<Document> resultadosBusqueda;
	    MongoCursor<Document>iterador;
	    
	    
	    //Constantes
	    static final String USERNAME = "username";
	    static final String FECHA = "fecha";
	    
	    //Logger
	    private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.RecuperarCuentaMongoDB");
		
		public RecuperarCuentaMongoDB() {
			connection();
		}
		
		//Conexion con la BD
	    private void connection() {
	    	try {
				uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
		        client = new MongoClient(uri);
		        db = client.getDatabase(uri.getDatabase());
		        coleccionRecuperarCuenta = db.getCollection(PropertiesConfig.getProperties("colRecuperarCuenta"));
			}catch(Exception ex) {
				LOGGER.log(Level.INFO, ex.getMessage());
			}
	    }
	
	public boolean insertaRC(RecuperarCuentaDTO recupera) {
		
		criteriosBusqueda = new BsonDocument().append("username", new BsonString(recupera.getUsername()));
		
		doc = new Document().append("username", recupera.getUsername()).
				             append("key", recupera.getKey()).
				             append("fechaExpira", recupera.getFechaExpira());
		
		try {
			coleccionRecuperarCuenta.deleteOne(criteriosBusqueda);
			coleccionRecuperarCuenta.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean leerRC(String username, String key) {
		
		criteriosBusqueda = new BsonDocument().append("username", new BsonString(username)).
				                               append("key", new BsonString(key));
		
		iterador = coleccionRecuperarCuenta.find(criteriosBusqueda).iterator();
		
		return iterador.hasNext();
		
	}
	
	public boolean eliminarRC(String username) {
		try {
			criteriosBusqueda = new BsonDocument().append("username", new BsonString(username));
			coleccionRecuperarCuenta.deleteOne(criteriosBusqueda);
			return true;
		}catch (Exception ex) {
			return false;
		}
	}
	
}
