package main.java.flashcards.db.mongodb;

import java.util.ArrayList;
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
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.dto.ClubDTO;

public class ClubMongoDB implements InterfaceDAOClub{
	
	//Variables
	MongoClientURI uri;
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionClubes;
    Document docClub;
    ClubDTO club;
    Bson filtros;
    MongoCursor<Document> cursor;
    List<String> lista;
    
    //Logger
  	private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.ClubMongoDB");
	
	//Constructor
    public ClubMongoDB() {
		connection();
	}
    
    //Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionClubes = db.getCollection(PropertiesConfig.getProperties("colClubes"));
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }
	
	public boolean crearClub(ClubDTO club) {
		try {
			docClub = new Document().
					append("idClub", club.getIdClub()).
					append("nombreClub", club.getNombreClub()).
					append("administrador", club.getAdministrador()).
					append("fecha", club.getFechaCreacion()).
					append("miembros", club.getMiembros());
			coleccionClubes.insertOne(docClub);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public List<String> getIdClubes(){
		lista = new ArrayList<String>();
		filtros = new BsonDocument();
		cursor = coleccionClubes.find(filtros).iterator();
		while(cursor.hasNext()) {
			lista.add(cursor.next().getString("idClub"));
		}
		return lista;
	}
	
	public ClubDTO leerClub(String idClub) {
		try {
			filtros = new BsonDocument().append("idClub", new BsonString(idClub));
			cursor = coleccionClubes.find(filtros).iterator();
			if(cursor.hasNext()) {
				docClub = cursor.next();
				club = new ClubDTO(docClub.getString("idClub"), docClub.getString("nombreClub"), docClub.getString("administrador"), (List<String>) docClub.get("miembros"), docClub.getString("fecha"));
				return club;
			}else {
				return null;
			}
		}catch(Exception ex) {
			return null;
		}
	}
}
