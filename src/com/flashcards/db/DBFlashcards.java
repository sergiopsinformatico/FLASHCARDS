package com.flashcards.db;

import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.modelo.Flashcard;
import com.flashcards.modelo.Tarjeta;
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
    LinkedList<Tarjeta>cards;
    String cardsJSON;
    Tarjeta t;
    
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
		try {
			doc = new Document();
			doc.append("identificador", flash.getIdentificador());
			doc.append("coleccion", flash.getNombreColeccion());
			doc.append("descripcion", flash.getDescripcion());
			doc.append("compartido", flash.getCompartido());
			doc.append("compartidoCon", flash.getNombreCompartido());
			doc.append("evaluado", flash.isEvaluado());
			doc.append("evaluador", flash.getEvaluador());
			cards = flash.getColeccion();
			for(indice=0; indice<cards.size(); indice++) {
				t = cards.get(indice);
				if(indice==0) {
					cardsJSON = t.getEnunciado()+"///****resp****///"+t.getRespuesta();
				}else {
					cardsJSON = cardsJSON + "///****nuevaCARD****///"+t.getEnunciado()+"///****resp****///"+t.getRespuesta();
				}
			}
			doc.append("cards", cardsJSON);
			coleccionFlashcards.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
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