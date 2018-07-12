package com.flashcards.db;

import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.modelo.Bloqueado;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBBloqueado {
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionBloqueado;
    Document doc;
    
    public DBBloqueado() {
    	conexionDB();
    }
    
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionBloqueado = db.getCollection("Bloqueado");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean createBloqueado(Bloqueado bloqueado) {
		try {
			doc = new Document("bloqueador", bloqueado.getBloqueador()).append("bloqueado", bloqueado.getBloqueado());
			coleccionBloqueado.insertOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public LinkedList<String> getUsuariosBloqueados (String bloqueador) {
		LinkedList<String> bloqueados = new LinkedList<String>();
		MongoCursor<Document> listaBloqueos = coleccionBloqueado.find(new BsonDocument().append("bloqueador", new BsonString(bloqueador))).iterator();
		while(listaBloqueos.hasNext()) {
			bloqueados.add(listaBloqueos.next().getString("bloqueado"));
		}
		return bloqueados;
	}
	
	public boolean existBloqueado (Bloqueado bloq) {
		MongoCursor<Document> listaBloqueos = coleccionBloqueado.find(new BsonDocument().append("bloqueador", new BsonString(bloq.getBloqueador())).append("bloqueado", new BsonString(bloq.getBloqueado()))).iterator();
		if(listaBloqueos.hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	public LinkedList<String> getUsuariosBloqueadores (String bloqueado) {
		LinkedList<String> bloqueadores = new LinkedList<String>();
		MongoCursor<Document> listaBloqueos = coleccionBloqueado.find(new BsonDocument().append("bloqueado", new BsonString(bloqueado))).iterator();
		while(listaBloqueos.hasNext()) {
			bloqueadores.add(listaBloqueos.next().getString("bloqueador"));
		}
		return bloqueadores;
	}
	
	public boolean deleteBloqueado(Bloqueado bloqueado) {
		try {
			BsonDocument docBloqueado = new BsonDocument().append("bloqueador", new BsonString(bloqueado.getBloqueador())).append("bloqueado", new BsonString(bloqueado.getBloqueado()));
			MongoCursor<Document> listaBloqueados = coleccionBloqueado.find(docBloqueado).iterator();
			if(listaBloqueados.hasNext()) {
				coleccionBloqueado.deleteOne(docBloqueado);
			}
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
}
