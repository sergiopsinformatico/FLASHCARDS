package com.flashcards.db;

import org.bson.Document;

import com.flashcards.modelo.Usuario;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class DBUsuarios {
	
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> songs;
    
    public DBUsuarios() {
    	conexionDB();
    }
    
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        songs = db.getCollection("Usuarios");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void createUsuario(Usuario user) {
		
	}
	
}
