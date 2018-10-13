package com.flashcards.db;

import java.util.LinkedList;

import org.bson.Document;

import com.flashcards.auxiliares.ReadDBProperties;
import com.flashcards.modelo.PeticionDeAmistad;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBPeticiones {
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionPeticiones;
    Document doc;
    ReadDBProperties properties;
    
    public DBPeticiones() {
    	properties = new ReadDBProperties();
    	conexionDB();
    }
    
	public void conexionDB() {
		try {
			uri  = new MongoClientURI(properties.getProperty("url")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionPeticiones = db.getCollection(properties.getProperty("tPeticiones"));
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean createPeticion(PeticionDeAmistad peticion) {
		try {
			doc = new Document("envia", peticion.getEnvia())
				  .append("recibe", peticion.getRecibe())
				  .append("estado", peticion.getEstado());
			coleccionPeticiones.insertOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public LinkedList<PeticionDeAmistad> readPeticionRecibida(String recibe) {
		try {
			LinkedList<PeticionDeAmistad> lista = new LinkedList<PeticionDeAmistad>();
			doc = new Document("recibe", recibe);
			MongoCursor<Document> elementos = coleccionPeticiones.find(doc).iterator();
			while(elementos.hasNext()) {
				doc = elementos.next();
				lista.add(new PeticionDeAmistad(doc.getString("envia"), doc.getString("recibe"), doc.getString("estado")));
			}
			return lista;
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public LinkedList<PeticionDeAmistad> readPeticionEnviada(String envia) {
		try {
			LinkedList<PeticionDeAmistad> lista = new LinkedList<PeticionDeAmistad>();
			doc = new Document("envia", envia);
			MongoCursor<Document> elementos = coleccionPeticiones.find(doc).iterator();
			while(elementos.hasNext()) {
				doc = elementos.next();
				lista.add(new PeticionDeAmistad(doc.getString("envia"), doc.getString("recibe"), doc.getString("estado")));
			}
			return lista;
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public boolean existPeticion(PeticionDeAmistad pdA) {
		doc = new Document("envia", pdA.getEnvia()).append("recibe", pdA.getRecibe());
		MongoCursor<Document> elementos = coleccionPeticiones.find(doc).iterator();
		if(elementos.hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean updatePeticion(PeticionDeAmistad peticion) {
		try {
			return (deletePeticion(peticion) && createPeticion(peticion));
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public boolean deletePeticion(PeticionDeAmistad peticion) {
		try {
			doc = new Document("envia", peticion.getEnvia())
				  .append("recibe", peticion.getRecibe());
			coleccionPeticiones.deleteOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
}
