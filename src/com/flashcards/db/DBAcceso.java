package com.flashcards.db;

import java.util.ArrayList;
import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.dao.GestionUsuarios;
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
    String solicitudes;
    MongoCursor<Document> listas;
    int cont;
    GestionUsuarios gU;
	
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
			doc.append("identificador", sA.getIdentificador());
			coleccionSolicitudes.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public String leerSolicitudes(String identificador){
		solicitudes = "";
		cont = 0;
		gU = new GestionUsuarios();
		listas = coleccionSolicitudes.find(new BsonDocument().append("identificador", new BsonString(identificador))).iterator();
		while(listas.hasNext()) {
			doc = listas.next();
			if(cont==0) {
				solicitudes = gU.getNyA(doc.getString("solicita"))+"///****user****///"+doc.getString("solicita");
				cont++;
			}else {
				solicitudes = solicitudes+"///****nMiembro****///"+gU.getNyA(doc.getString("solicita"))+"///****user****///"+doc.getString("solicita");
			}
		}
		return solicitudes;
	}
	
	public boolean existeSolicitud(SolicitudAcceso sA) {
		try {
			listas = coleccionSolicitudes.find(new BsonDocument().append("identificador", new BsonString(sA.getIdentificador())).append("solicita", new BsonString(sA.getSolicita()))).iterator();
			if(listas.hasNext()) {
				return true;
			}else {
				return false;
			}
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminarSolicitud(SolicitudAcceso sA) {
		try {
			listas = coleccionSolicitudes.find(new BsonDocument().append("identificador", new BsonString(sA.getIdentificador())).append("solicita", new BsonString(sA.getSolicita()))).iterator();
			if(listas.hasNext()) {
				coleccionSolicitudes.deleteOne(listas.next());
			}
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
}
