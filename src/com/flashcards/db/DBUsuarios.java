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
    MongoCollection<Document> coleccionUsuarios;
    Document doc;
    
    public DBUsuarios() {
    	conexionDB();
    }
    
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionUsuarios = db.getCollection("Usuarios");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean createUsuario(Usuario user) {
		try {
			doc = new Document("usuario", user.getUsuario())
				  .append("clave", user.getClave())
				  .append("email", user.getEmail())
				  .append("nombre", user.getNombre())
				  .append("apellidos", user.getApellidos())
				  .append("edad", user.getEdad())
				  .append("ciudad", user.getCiudad())
				  .append("pais", user.getPais());
			coleccionUsuarios.insertOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
}
