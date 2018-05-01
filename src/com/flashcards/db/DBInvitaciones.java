package com.flashcards.db;

import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.modelo.Invitacion;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBInvitaciones {
	
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionInvitaciones;
    Document doc;
    MongoCursor<Document> invitaciones;
	
	public DBInvitaciones() {
		conexionDB();
	}
	
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionInvitaciones = db.getCollection("Invitaciones");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean insertarInvitacion(Invitacion invitacion) {
		try {
			doc = new Document("envia", invitacion.getEnvia()).append("recibe", invitacion.getRecibe()).append("club", invitacion.getClub());
			coleccionInvitaciones.insertOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public LinkedList<Invitacion> leerInvitaciones(String recibe) {
		LinkedList<Invitacion> coleccion =  new LinkedList<Invitacion>();
		invitaciones = coleccionInvitaciones.find(new BsonDocument().append("recibe", new BsonString(recibe))).iterator();
		while(invitaciones.hasNext()) {
			doc = invitaciones.next();
			coleccion.add(new Invitacion(doc.get("envia").toString(), doc.get("recibe").toString(), doc.get("club").toString()));
		}
		return coleccion;
	}
	
	public boolean eliminarInvitacion(String recibe, String club) {
		try {
			invitaciones = coleccionInvitaciones.find(new BsonDocument().append("recibe", new BsonString(recibe)).append("club", new BsonString(club))).iterator();
			if(invitaciones.hasNext()) {
				coleccionInvitaciones.deleteOne(invitaciones.next());
			}
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
}
