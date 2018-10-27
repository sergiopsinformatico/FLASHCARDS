package com.flashcards.db.dao;

import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.auxiliares.Fecha;
import com.flashcards.modelo.Eliminado;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBEliminados {
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionEliminados;
    Document doc;
    MongoCursor<Document> eliminados;
    Fecha fecha;
    LinkedList<Eliminado> lista;
    String result;
    
    public DBEliminados() {
    	conexionDB();
    }
    
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionEliminados = db.getCollection("Eliminados");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean insertEliminado(Eliminado eliminado) {
		try {
			doc = new Document("email", eliminado.getEmail()).append("fecha", eliminado.getFecha());
			coleccionEliminados.insertOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public String getDate (String email) {
		eliminados = coleccionEliminados.find(new BsonDocument().append("email", new BsonString(email))).iterator();
		if(eliminados.hasNext()) {
			return eliminados.next().getString("fecha");
		}else {
			return null;
		}
	}
	
	public boolean isUsuario (String email) {
		eliminados = coleccionEliminados.find(new BsonDocument().append("email", new BsonString(email))).iterator();
		if(eliminados.hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteEmail(String email) {
		try {
			eliminados = coleccionEliminados.find(new BsonDocument().append("email", new BsonString(email))).iterator();
			if(eliminados.hasNext()) {
				coleccionEliminados.deleteOne(new BsonDocument().append("email", new BsonString(email)));
			}
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public LinkedList<Eliminado> searchEliminados(String hoy) {
		try {
			lista = new LinkedList<Eliminado>();
			fecha = new Fecha();
			eliminados = coleccionEliminados.find().iterator();
			while(eliminados.hasNext()) {
				doc = eliminados.next();
				result = fecha.compararFechas(hoy, doc.get("fecha").toString());
				if(result!=null && Integer.parseInt(result)>=0) {
					lista.add(new Eliminado(doc.get("email").toString(), doc.getString("fecha").toString()));
				}
			}
			return lista;
		}catch(Exception ex) {
			return null;
		}
	}
	
}