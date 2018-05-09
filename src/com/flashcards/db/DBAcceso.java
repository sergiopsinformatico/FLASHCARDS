package com.flashcards.db;

import java.util.ArrayList;
import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.modelo.Club;
import com.flashcards.modelo.SolicitudAcceso;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBAcceso {
	
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionSolicitudes;
    Document doc;
    LinkedList<String> solicitudes;
    MongoCursor<Document> listas;
	
	public DBAcceso() {
		conexionDB();
	}
	
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionSolicitudes = db.getCollection("Acceso");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean insertarSolicitud(SolicitudAcceso sA) {
		try {
			doc = new Document();
			doc.append("solicita", sA.getSolicita());
			doc.append("club", sA.getClub());
			coleccionSolicitudes.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public LinkedList<String> leerSolicitudes(String club){
		solicitudes = new LinkedList<String>();
		listas = coleccionSolicitudes.find(new BsonDocument().append("club", new BsonString(club))).iterator();
		while(listas.hasNext()) {
			doc = listas.next();
			solicitudes.add(doc.get("solicita").toString());
		}
		return solicitudes;
	}
	
	public boolean eliminarSolicitud(SolicitudAcceso sA) {
		try {
			listas = coleccionSolicitudes.find(new BsonDocument().append("club", new BsonString(sA.getClub())).append("solicita", new BsonString(sA.getSolicita()))).iterator();
			if(listas.hasNext()) {
				coleccionSolicitudes.deleteOne(listas.next());
			}
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
}
