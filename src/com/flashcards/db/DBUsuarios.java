package com.flashcards.db;

import java.util.ArrayList;
import java.util.LinkedList;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

import com.flashcards.dao.GestionAcceso;
import com.flashcards.modelo.Club;
import com.flashcards.modelo.SolicitudAcceso;
import com.flashcards.modelo.Usuario;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBUsuarios {
	
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionUsuarios;
    Document doc;
    Usuario user;
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
	
	public boolean createUsuario(Usuario user) {
		try {
			doc = new Document("usuario", user.getUsuario())
				  .append("clave", user.getClave())
				  .append("email", user.getEmail())
				  .append("nombreApellidos", user.getNombreApellidos())
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
	
	public LinkedList<Usuario> gente (String username) {
		conexionDB();
		LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
		MongoCursor<Document> lista = coleccionUsuarios.find().iterator();
		while(lista.hasNext()) {
			doc = lista.next();
			if(!(doc.getString("usuario").equalsIgnoreCase(username))) {
				usuarios.add(new Usuario(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombreApellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador")));
			}
		}
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
		return usuarios;
	}
	
	public LinkedList<Usuario> todosUsuariosAdministrador (String username) {
		LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
		MongoCursor<Document> lista = coleccionUsuarios.find().iterator();
		while(lista.hasNext()) {
			doc = lista.next();
			if(!(doc.getString("usuario").equalsIgnoreCase(username))) {
				usuarios.add(new Usuario(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombreApellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador")));
			}
		}
		return usuarios;
	}
	
	public Usuario usuarioByUsername (String username) {
		user=null;
		if(coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(username))).iterator().hasNext()) {
			doc = coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(username))).iterator().next();
			user = new Usuario(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombreApellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador"));
		}
		return user;
	}
	
	public Usuario usuarioByEmail (String email) {
		user=null;
		if(coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(email))).iterator().hasNext()) {
			doc = coleccionUsuarios.find(new BsonDocument().append("email", new BsonString(email))).iterator().next();
			user = new Usuario(doc.getString("usuario"), doc.getString("clave"), doc.getString("email"), doc.getString("nombreApellidos"), doc.getInteger("edad"), doc.getString("ciudad"), doc.getString("pais"), doc.getString("genero"), doc.getBoolean("isUsuario"), doc.getBoolean("isModerador"), doc.getBoolean("isAdministrador"));
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
	
	public String getNyA(String usuario) {
		try {
			if(coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(usuario))).iterator().hasNext()) {
				return coleccionUsuarios.find(new BsonDocument().append("usuario", new BsonString(usuario))).iterator().next().getString("nombreApellidos");
			}else {
				return "";
			}
		}catch(Exception ex) {
			return "";
		}
	}
	
	public String getNewMiembros(Club club) {
		gA = new GestionAcceso();
		miembros="";
		cont = 0;
		usuarios = coleccionUsuarios.find().iterator();
		lista = club.getColeccionMiembros();
		while(usuarios.hasNext()) {
			doc = usuarios.next();
			for(indice=0; indice<lista.size(); indice++) {
				if(doc.getString("usuario").equals(lista.get(indice))) {
					indice = lista.size();
				}else if((indice == (lista.size()-1)) && (!(gA.existeSolicitud(new SolicitudAcceso(doc.getString("usuario"),club.getIdentificador()))))) {
					if(cont==0) {
						miembros = getNyA(doc.getString("usuario")) + "///****user****///"+doc.getString("usuario");
						cont++;
					}else {
						miembros = miembros + "///****nMiembro****///" + getNyA(doc.getString("usuario")) + "///****user****///"+doc.getString("usuario");
					}
				}
			}
		}
		return miembros;
	}
}
