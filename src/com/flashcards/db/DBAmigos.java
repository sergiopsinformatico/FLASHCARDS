package com.flashcards.db;

import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.modelo.Amigos;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBAmigos {

	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionAmigos;
    Document doc;
    
    public DBAmigos() {
    	conexionDB();
    }
    
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionAmigos = db.getCollection("Amigos");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean createAmigos(Amigos amigo) {
		try {
			doc = new Document("amigo1", amigo.getAmigo1()).append("amigo2", amigo.getAmigo2());
			coleccionAmigos.insertOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public LinkedList<String> getAmigos (String username) {
		LinkedList<String> amigos = new LinkedList<String>();
		MongoCursor<Document> listaAmigos = coleccionAmigos.find(new BsonDocument().append("amigo1", new BsonString(username))).iterator();
		while(listaAmigos.hasNext()) {
			amigos.add(listaAmigos.next().getString("amigo2"));
		}
		listaAmigos = coleccionAmigos.find(new BsonDocument().append("amigo2", new BsonString(username))).iterator();
		while(listaAmigos.hasNext()) {
			amigos.add(listaAmigos.next().getString("amigo1"));
		}
		return amigos;
	}
	
	public boolean deleteAmigos(Amigos am) {
		try {
			BsonDocument busq = new BsonDocument().append("amigo1", new BsonString(am.getAmigo1())).append("amigo2", new BsonString(am.getAmigo2()));
			MongoCursor<Document> listaAmigos = coleccionAmigos.find(busq).iterator();
			while(listaAmigos.hasNext()) {
				coleccionAmigos.deleteOne(busq);
			}
			busq = new BsonDocument().append("amigo1", new BsonString(am.getAmigo2())).append("amigo2", new BsonString(am.getAmigo1()));
			listaAmigos = coleccionAmigos.find(busq).iterator();
			while(listaAmigos.hasNext()) {
				coleccionAmigos.deleteOne(busq);
			}
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean existeAmigos(Amigos am) {
		MongoCursor<Document> listaPosibles = coleccionAmigos.find(new BsonDocument().append("amigo1", new BsonString(am.getAmigo1())).append("amigo2",  new BsonString(am.getAmigo2()))).iterator();
		if(listaPosibles.hasNext()) {
			return true;
		}else {
			listaPosibles = coleccionAmigos.find(new BsonDocument().append("amigo1", new BsonString(am.getAmigo2())).append("amigo2",  new BsonString(am.getAmigo1()))).iterator();
			if(listaPosibles.hasNext()) {
				return true;
			}else {
				return false;
			}
		}
		
	}
	
}
