package com.flashcards.db;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.auxiliares.ReadDBProperties;
import com.flashcards.modelo.Bloqueado;
import com.flashcards.modelo.SolicitudModerador;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class DBSolicitudModerador {
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionSolicitudes;
    Document doc;
    ReadDBProperties properties;
    
    public DBSolicitudModerador() {
    	properties = new ReadDBProperties();
    	conexionDB();
    }
    
	public void conexionDB() {
		try {
			uri  = new MongoClientURI(properties.getProperty("url")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionSolicitudes = db.getCollection(properties.getProperty("tSolModerador"));
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean createSoliciud(SolicitudModerador sM) {
		try {
			doc = new Document();
			doc.append("usuario", sM.getUsuario());
			coleccionSolicitudes.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean existUsuario(SolicitudModerador sM) {
		try {
			if(coleccionSolicitudes.find(new BsonDocument().append("usuario", new BsonString(sM.getUsuario()))).iterator().hasNext()) {
				return true;
			}else {
				return false;
			}
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean deleteUsuario(SolicitudModerador sM) {
		try {
			doc = new Document();
			doc.append("usuario", sM.getUsuario());
			coleccionSolicitudes.deleteOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
}
