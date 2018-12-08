package com.flashcards.db.mongoDB;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.conversions.Bson;

import com.flashcards.db.dao.InterfaceDAOUsuario;
import com.flashcards.dto.UsuarioDTO;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class UsuariosMongoDB implements InterfaceDAOUsuario{
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionUsuarios;
	Document doc;
	Bson criteriosBusqueda;
	FindIterable<Document> resultadosBusqueda;
	UsuarioDTO usuarioDB;
    
    //Constructor
    public UsuariosMongoDB() {
		connection();
	}
    
    //Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionUsuarios = db.getCollection("Usuarios");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
    }
	
	//Insertar Usuario
	public boolean insertUsuario(UsuarioDTO user) {
		if((!existEmail(user.getEmail())) && (!existUsername(user.getUsername())) && claveIsCorrect(user.getClave()) && usernameIsCorrect(user.getUsername())) {
			return insert(usuarioDTOToDocument(user));
		}else {
			return false;
		}
	}
	
	private Document usuarioDTOToDocument(UsuarioDTO user) {
		doc = new Document().
				append("username", user.getUsername()).
				append("email", user.getEmail()).
				append("clave", user.getClave());
		
		try {
			if(user.getNombreApellidos()!=null || !user.getNombreApellidos().equalsIgnoreCase("")) {
				doc = doc.append("nombreApellidos", user.getNombreApellidos());
			}
		}catch(Exception ex) {
			
		}
		
		try {
			if(user.getCiudad()!=null || !user.getCiudad().equalsIgnoreCase("")) {
				doc = doc.append("ciudad", user.getCiudad());
			}
		}catch(Exception ex) {
			
		}
		
		try {
			if(user.getPais()!=null || !user.getPais().equalsIgnoreCase("")) {
				doc = doc.append("pais", user.getPais());
			}
		}catch(Exception ex) {
			
		}
		
		try {
			if(user.getPhoto()!=null || !user.getPhoto().equalsIgnoreCase("")) {
				doc = doc.append("photo", user.getPhoto());
			}
		}catch(Exception ex) {
			
		}
		
		doc = doc.append("rolUsuario", user.isRolUsuario()).
				append("rolModerador", user.isRolModerador()).
				append("rolAdministrador", user.isRolAdministrador());
		
		return doc;
	}
	
	private UsuarioDTO documentToUsuarioDTO(Document doc) {
		usuarioDB = new UsuarioDTO(doc.getString("username"),
                doc.getString("clave"),
                doc.getString("email"),
                doc.getBoolean("rolUsuario"),
                doc.getBoolean("rolModerador"),
                doc.getBoolean("rolAdministrador"));
		try {
			if(doc.getString("nombreApellidos")!=null || (!doc.getString("nombreApellidos").equalsIgnoreCase(""))) {
				usuarioDB.setNombreApellidos(doc.getString("nombreApellidos"));
			}
		}catch(Exception ex) {
		
		}
		
		try {
			if(doc.getString("ciudad")!=null || (!doc.getString("ciudad").equalsIgnoreCase(""))) {
				usuarioDB.setCiudad(doc.getString("ciudad"));
			}
		}catch(Exception ex) {
		
		}
		
		try {
			if(doc.getString("pais")!=null || (!doc.getString("pais").equalsIgnoreCase(""))) {
				usuarioDB.setPais(doc.getString("pais"));
			}
		}catch(Exception ex) {
		
		}
		
		try {
			if(doc.getString("photo")!=null || (!doc.getString("photo").equalsIgnoreCase(""))) {
				usuarioDB.setPhoto(doc.getString("photo"));
			}
		}catch(Exception ex) {
		
		}
		
		return usuarioDB;
	}
	
	//Comprobar si existe el email
	public boolean existEmail (String email) {
		criteriosBusqueda = new BsonDocument().append("email", new BsonString(email));
		resultadosBusqueda = read(criteriosBusqueda);
		if(resultadosBusqueda.iterator().hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	//Comprobar si existe el nombre de usuario
	public boolean existUsername (String username) {
		criteriosBusqueda = new BsonDocument().append("username", new BsonString(username));
		resultadosBusqueda = read(criteriosBusqueda);
		if(resultadosBusqueda.iterator().hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	
	//Comprobar si es correcta la restriccion del nombre de usuario
	public boolean usernameIsCorrect(String username) {
		if(!(username.length()>=5 && username.length()<=15)) {
			return false;
		}
		for(int indice=0; indice<username.length(); indice++) {
			if(!((username.charAt(indice)>='0' && username.charAt(indice)<='9') ||
				 (username.charAt(indice)>='a' && username.charAt(indice)<='z') ||
				 (username.charAt(indice)>='A' && username.charAt(indice)<='Z'))) {
				return false;
			}
		}
		return true;
	}
	
	//Comprobar si es correcta la restricción de la clave
	public boolean claveIsCorrect(String clave) {
		if(!(clave.length()>=5 && clave.length()<=20)) {
			return false;
		}
		for(int indice=0; indice<clave.length(); indice++) {
			if(!((clave.charAt(indice)>='0' && clave.charAt(indice)<='9') ||
				 (clave.charAt(indice)>='a' && clave.charAt(indice)<='z') ||
				 (clave.charAt(indice)>='A' && clave.charAt(indice)<='Z'))) {
				return false;
			}
		}
		return true;
	}
	
	//Login Usuario
	public boolean login(String usernameEmail, String clave) {
		criteriosBusqueda = new BsonDocument().
				            append("username", new BsonString(usernameEmail)).
				            append("clave", new BsonString(clave));
		resultadosBusqueda = read(criteriosBusqueda);
		if(resultadosBusqueda.iterator().hasNext()) {
			return true;
		}else {
			criteriosBusqueda = new BsonDocument().
		            append("email", new BsonString(usernameEmail)).
		            append("clave", new BsonString(clave));
			resultadosBusqueda = read(criteriosBusqueda);
			if(resultadosBusqueda.iterator().hasNext()) {
				return true;
			}else {
				return false;
			}
		}
		
	}
	
	//Get usuario
	public UsuarioDTO getUsuarioDTO(String usernameEmail) {
		criteriosBusqueda = new BsonDocument().
	            append("username", new BsonString(usernameEmail));
		resultadosBusqueda = read(criteriosBusqueda);
		
		if(!(resultadosBusqueda.iterator().hasNext())) {
			criteriosBusqueda = new BsonDocument().
		            append("email", new BsonString(usernameEmail));
			resultadosBusqueda = read(criteriosBusqueda);
		}
		
		if(!(resultadosBusqueda.iterator().hasNext())) {
			return null;
		}
		
		doc = resultadosBusqueda.iterator().next();
		usuarioDB = documentToUsuarioDTO(doc);
		
		return usuarioDB;
		
	}
	
	public boolean updateUsuario(UsuarioDTO userAntiguo, UsuarioDTO userNuevo) {
		if(userAntiguo.getUsername().equals(userNuevo.getUsername())) {
			if(userAntiguo.getEmail().equals(userNuevo.getEmail())) {
				criteriosBusqueda = new BsonDocument().
			            append("email", new BsonString(userAntiguo.getEmail()));
				if(deleteOne(criteriosBusqueda)) {
					return insert(usuarioDTOToDocument(userNuevo));
				}else {
					return false;
				}
			}else {
				if(!existEmail(userNuevo.getEmail())) {
					criteriosBusqueda = new BsonDocument().
				            append("email", new BsonString(userAntiguo.getEmail()));
					if(deleteOne(criteriosBusqueda)) {
						return insert(usuarioDTOToDocument(userNuevo));
					}else {
						return false;
					}
				}else {
					return false;
				}
			}
		}else {
			if(userAntiguo.getEmail().equals(userNuevo.getEmail())) {
				if(!existUsername(userNuevo.getUsername())) {
					criteriosBusqueda = new BsonDocument().
				            append("email", new BsonString(userAntiguo.getEmail()));
					if(deleteOne(criteriosBusqueda)) {
						return insert(usuarioDTOToDocument(userNuevo));
					}else {
						return false;
					}
				}else {
					return false;
				}
			}else {
				if(!existUsername(userNuevo.getUsername()) && !existEmail(userNuevo.getEmail())) {
					criteriosBusqueda = new BsonDocument().
				            append("email", new BsonString(userAntiguo.getEmail()));
					if(deleteOne(criteriosBusqueda)) {
						return insert(usuarioDTOToDocument(userNuevo));
					}else {
						return false;
					}
				}else {
					return false;
				}
			}
		}
	}
	
	public boolean deleteUsuario(UsuarioDTO user) {
		try {
			criteriosBusqueda = new BsonDocument().
		            append("email", new BsonString(user.getEmail()));
			return deleteOne(criteriosBusqueda);
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	private boolean insert(Document doc) {
		try {
			coleccionUsuarios.insertOne(doc);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	private FindIterable<Document> read(Bson criterios) {
		try {
			return coleccionUsuarios.find(criterios);
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	private boolean deleteOne(Bson criterios) {
		try {
			coleccionUsuarios.deleteOne(criterios);
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}