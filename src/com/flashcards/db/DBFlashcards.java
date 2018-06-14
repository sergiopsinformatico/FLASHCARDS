package com.flashcards.db;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.modelo.Flashcard;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBFlashcards {
	
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionFlashcards;
    Document doc;
    int indice;
    boolean existe;
    MongoCursor<Document> listaPosibles;
    
	public DBFlashcards() {
		conexionDB();
	}
	
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionFlashcards = db.getCollection("Flashcards");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean insertFlashcard(Flashcard flash) {
		boolean insert = false;
		try {
			doc = new Document();
			doc.append("identificador", flash.getIdentificador());
			coleccionFlashcards.insertOne(doc);
			insert = true;
		}catch(Exception ex) {
			insert = false;
		}
		return insert;
	}
	
	public boolean existIdentificador(String identificador) {
		listaPosibles = coleccionFlashcards.find(new BsonDocument().append("identificador", new BsonString(identificador))).iterator();
		if(listaPosibles.hasNext()) {
			return true;
		}else {
			return false;
		}
	}
}
