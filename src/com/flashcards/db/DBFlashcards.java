package com.flashcards.db;

import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.dao.GestionAmigos;
import com.flashcards.dao.GestionClubes;
import com.flashcards.modelo.Amigos;
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
    Flashcard flash;
    String[] lista;
    String listJSON;
    GestionClubes gC;
    GestionAmigos gA;
    
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
			doc.append("creador", flash.getCreador());
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
					cardsJSON = t.getAnverso()+"----resp----"+t.getReverso();
				}else {
					cardsJSON = cardsJSON + "----nuevaCARD----"+t.getAnverso()+"----resp----"+t.getReverso();
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
	
	public String listJSON(String usuario) {
		listJSON = "";
		indice = 0;
		listaPosibles = coleccionFlashcards.find().iterator();
		while(listaPosibles.hasNext()) {
			doc = listaPosibles.next();
			if(doc.getBoolean("evaluado")) {
				switch(doc.getString("compartido")) {
					case "publico":
						if(indice==0) {
							listJSON = doc.getString("coleccion")+"****////identificador////****"+doc.getString("identificador");
							indice++;
						}else {
							listJSON = listJSON + "****////nCol////****" + doc.getString("coleccion")+ "****////identificador////****" +doc.getString("identificador");
						}
						break;
					case "privado":
						if(doc.getString("compartidoCon").equals(usuario)) {
							if(indice==0) {
								listJSON = doc.getString("coleccion")+"****////identificador////****"+doc.getString("identificador");
								indice++;
							}else {
								listJSON = listJSON + "****////nCol////****" + doc.getString("coleccion")+ "****////identificador////****" +doc.getString("identificador");
							}
						}
						break;
					case "club":
						gC = new GestionClubes();
						if(gC.perteneceWithIdentificador(usuario, doc.getString("compartidoCon"))) {
							if(indice==0) {
								listJSON = doc.getString("coleccion")+"****////identificador////****"+doc.getString("identificador");
								indice++;
							}else {
								listJSON = listJSON + "****////nCol////****" + doc.getString("coleccion")+ "****////identificador////****" +doc.getString("identificador");
							}
						}
						break;
					case "usuario":
						gA = new GestionAmigos();
						if(gA.existeAmigos(new Amigos(usuario,doc.getString("compartidoCon")))) {
							if(indice==0) {
								listJSON = doc.getString("coleccion")+"****////identificador////****"+doc.getString("identificador");
								indice++;
							}else {
								listJSON = listJSON + "****////nCol////****" + doc.getString("coleccion")+ "****////identificador////****" +doc.getString("identificador");
							}
						}
						break;
				}
			}
		}
		return listJSON;
	}
	
	public String evaluarJSON(String usuario) {
		listJSON = "";
		indice = 0;
		listaPosibles = coleccionFlashcards.find().iterator();
		while(listaPosibles.hasNext()) {
			doc = listaPosibles.next();
			if((!doc.getBoolean("evaluado")) && (!(doc.getString("creador").equals(usuario)))) {
				if(indice==0) {
					listJSON = doc.getString("coleccion")+"****////identificador////****"+doc.getString("identificador");
					indice++;
				}else {
					listJSON = listJSON + "****////nCol////****" + doc.getString("coleccion")+ "****////identificador////****" +doc.getString("identificador");
				}
			}
		}
		return listJSON;
	}
	
	public Flashcard readFlashcard(String id) {
		listaPosibles = coleccionFlashcards.find(new BsonDocument().append("identificador", new BsonString(id))).iterator();
		if(listaPosibles.hasNext()) {
			doc = listaPosibles.next();
			flash = new Flashcard();
			flash.setIdentificador(doc.getString("identificador"));
			flash.setNombreColeccion(doc.getString("coleccion"));
			flash.setDescripcion(doc.getString("descripcion"));
			flash.setCompartido(doc.getString("compartido"));
			flash.setNombreCompartido(doc.getString("compartidoCon"));
			flash.setEvaluado(doc.getBoolean("evaluado"));
			flash.setEvaluador(doc.getString("evaluador"));
			cards = new LinkedList<Tarjeta>();
			cardsJSON=doc.getString("cards");
			lista = cardsJSON.split("----nuevaCARD----");
			for(indice=0; indice<lista.length; indice++) {
				cardsJSON = lista[indice];
				cards.add(new Tarjeta(cardsJSON.split("----resp----")[0],cardsJSON.split("----resp----")[1]));
			}
			flash.setColeccion(cards);
			return flash;
		}else {
			return null;
		}
	}
}
