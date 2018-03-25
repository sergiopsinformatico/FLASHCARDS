package com.flashcards.db;

import org.bson.BsonDocument;
import org.bson.BsonString;
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
    Usuario user;
    
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
				  .append("pais", user.getPais())
				  .append("genero", user.getGenero())
				  .append("isUsuario", user.isUsuario())
				  .append("isModerador", user.isModerador())
				  .append("isAdministrador", user.isAdministrador());
			coleccionUsuarios.insertOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public boolean existeEmail (String email) {
		if(coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(email))).iterator().hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean existeUsername (String username) {
		if(coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(username))).iterator().hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean loginByUsername (String username, String clave) {
		if(coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(username)).append("clave", new BsonString(clave))).iterator().hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean loginByEmail (String email, String clave) {
		if(coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(email)).append("clave", new BsonString(clave))).iterator().hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	public Usuario usuarioByUsername (String username) {
		user=null;
		if(coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(username))).iterator().hasNext()) {
			doc = coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(username))).iterator().next();
			user = new Usuario(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombre"), doc.getString("apellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador"));
		}
		return user;
	}
	
	public Usuario usuarioByEmail (String email) {
		user=null;
		if(coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(email))).iterator().hasNext()) {
			doc = coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(email))).iterator().next();
			user = new Usuario(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombre"), doc.getString("apellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador"));
		}
		return user;
	}
	
	public boolean modificarUsuario (Usuario user) {
		try {
			if(coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(user.getEmail()))).iterator().hasNext()) {
				coleccionUsuarios.deleteOne(new BsonDocument().append("email", new BsonString(user.getEmail())));
				return createUsuario(user);
			}else {
				return false;
			}
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminarCuenta(String usuario) {
		try {
			if(coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(usuario))).iterator().hasNext()) {
				coleccionUsuarios.deleteOne(new BsonDocument().append("usuario", new BsonString(usuario)));
				if(!existeUsername(usuario)) {
					return true;
				}else {
					return false;
				}
			}else {
				return false;
			}
		}catch(Exception ex) {
			return false;
		}
	}
	
}
