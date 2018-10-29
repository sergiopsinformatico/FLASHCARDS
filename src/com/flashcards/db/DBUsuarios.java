package com.flashcards.db;

import java.util.ArrayList;
import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.db.dao.InterfaceDAOUsuario;
import com.flashcards.db.gestores.GestionAcceso;
import com.flashcards.modelo.UsuarioDTO;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBUsuarios implements InterfaceDAOUsuario{
	
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionUsuarios;
    Document doc;
    UsuarioDTO user;
    ArrayList<String> lista;
    MongoCursor<Document> usuarios;
    int indice, cont;
    String miembros;
    GestionAcceso gA;
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
	
	public boolean crearUsuario(UsuarioDTO user) {
		try {
			doc = new Document("usuario", user.getNombreUsuario())
				  .append("clave", user.getClave())
				  .append("email", user.getEmail())
				  .append("nombreApellidos", user.getNombreApellidos())
				  .append("edad", user.getEdad())
				  .append("ciudad", user.getCiudad())
				  .append("pais", user.getPais())
				  .append("genero", user.getGenero())
				  .append("photo", user.getPhoto())
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
	
	public LinkedList<UsuarioDTO> usuarios (String username) {
		LinkedList<UsuarioDTO> usuarios = new LinkedList<UsuarioDTO>();
		MongoCursor<Document> lista = coleccionUsuarios.find().iterator();
		while(lista.hasNext()) {
			doc = lista.next();
			if(!(doc.getString("usuario").equalsIgnoreCase(username))) {
				usuarios.add(new UsuarioDTO(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombreApellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getString("photo"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador")));
			}
		}
		return usuarios;
	}
	
	public UsuarioDTO usuarioByUsername (String username) {
		user=null;
		if(coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(username))).iterator().hasNext()) {
			doc = coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(username))).iterator().next();
			user = new UsuarioDTO(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombreApellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getString("photo"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador"));
		}
		return user;
	}
	
	public UsuarioDTO usuarioByEmail (String email) {
		user=null;
		if(coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(email))).iterator().hasNext()) {
			doc = coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(email))).iterator().next();
			user = new UsuarioDTO(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombreApellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getString("photo"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador"));
		}
		return user;
	}
	
	public boolean modificarUsuario (UsuarioDTO user) {
		try {
			if(coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(user.getEmail()))).iterator().hasNext()) {
				coleccionUsuarios.deleteOne(new BsonDocument().append("email", new BsonString(user.getEmail())));
				return crearUsuario(user);
			}else {
				return false;
			}
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminarUsuario(String usuario) {
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





/*GENTE*/
/*
//Eliminamos Amigos
GestionAmigos gA=new GestionAmigos();
LinkedList<String>personas = gA.getAmigos(username);
for(int i=0; i<personas.size(); i++) {
	for(int j=0;j<usuarios.size(); j++) {
		if(personas.get(i).equals(usuarios.get(j).getUsuario())) {
			usuarios.remove(j);
			j=0;
		}
	}
}
//Eliminamos Bloqueados
GestionBloqueados gB = new GestionBloqueados();
personas = gB.leerBloqueados(username);
for(int i=0; i<personas.size(); i++) {
	for(int j=0;j<usuarios.size(); j++) {
		if(personas.get(i).equals(usuarios.get(j).getUsuario())) {
			usuarios.remove(j);
			j=0;
		}
	}
}
//Eliminamos los que nos han bloqueado
gB = new GestionBloqueados();
personas = gB.leerBloqueadores(username);
for(int i=0; i<personas.size(); i++) {
	for(int j=0;j<usuarios.size(); j++) {
		if(personas.get(i).equals(usuarios.get(j).getUsuario())) {
			usuarios.remove(j);
			j=0;
		}
	}
}
//Eliminamos Los que han mandado peticion de Amistad
GestionPeticiones gP = new GestionPeticiones();
LinkedList<PeticionDeAmistad>peticiones=gP.leerPeticionRecibida(username);
for(int i=0; i<peticiones.size();i++) {
	for(int j=0; j<usuarios.size(); j++) {
		if(peticiones.get(i).getEnvia().equals(usuarios.get(j).getUsuario())) {
			usuarios.remove(j);
			j=0;
		}
	}
}

//Eliminamos a los que hemos enviado peticion de amistad
gP = new GestionPeticiones();
peticiones=gP.leerPeticionEnviada(username);
for(int i=0; i<peticiones.size();i++) {
	for(int j=0; j<usuarios.size(); j++) {
		if(peticiones.get(i).getRecibe().equals(usuarios.get(j).getUsuario())) {
			usuarios.remove(j);
			j=0;
		}
	}
}*/

