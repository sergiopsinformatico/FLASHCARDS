package main.java.flashcards.db.mongodb;

import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import main.java.flashcards.auxiliares.PropertiesConfig;
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.dto.ClubDTO;

public class ClubMongoDB implements InterfaceDAOClub {
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionClubes;
    Bson criteriosBusqueda;
    Document doc;
    MongoCursor<Document> iterador;
    ClubDTO club;
    List<String> miembros;
    List<ClubDTO> clubes;
    int indice;
    boolean encontrado;
    
    //Logger
    private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.ClubMongoDB");
    
    //Constantes
  	static final String CONST_ID_CLUB = "idClub";
  	static final String CONST_NOMBRE = "nombre";
  	static final String CONST_ADMIN = "administrador";
  	static final String CONST_FECHA = "fecha";
  	static final String CONST_MIEMBROS = "miembros";
	
	public ClubMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionClubes = db.getCollection(PropertiesConfig.getProperties("colClub"));
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }

	public boolean insertaClub(ClubDTO club) {
		try {
			if(!existeIdClub(club.getIdClub())) {
				doc = new Document().append(CONST_ID_CLUB, club.getIdClub())
									.append(CONST_NOMBRE, club.getNombreClub())
									.append("tema", club.getTemaClub())
									.append(CONST_ADMIN, club.getAdministrador())
									.append(CONST_FECHA, club.getFechaCreacion())
									.append(CONST_MIEMBROS, club.getMiembros());
				coleccionClubes.insertOne(doc);
				return true;
			}else {
				return false;
			}
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean existeIdClub(String idClub) {
		criteriosBusqueda = new BsonDocument().append(CONST_ID_CLUB, new BsonString(idClub));
		iterador = coleccionClubes.find(criteriosBusqueda).iterator();
		return iterador.hasNext();
	}

	public ClubDTO leerClub(String idClub, String username) {
		criteriosBusqueda = new BsonDocument().append(CONST_ID_CLUB, new BsonString(idClub));
		iterador = coleccionClubes.find(criteriosBusqueda).iterator();
		if(iterador.hasNext()) {
			doc = iterador.next();
			club = new ClubDTO(doc.getString(CONST_ID_CLUB), doc.getString(CONST_NOMBRE), doc.getString("tema"), 
					doc.getString(CONST_ADMIN), (List<String>)doc.get(CONST_MIEMBROS), doc.getString(CONST_FECHA));
			
			club.setSoyAdministradorClub(username.equals(club.getAdministrador()));
			
			miembros = club.getMiembros();
			
			club.setPertenezcoClub(checkPertenezcoClub(miembros, username));
			
			return club;
		}else {
			return null;
		}
	}

	public boolean eliminaClub(String idClub) {
		try {
			criteriosBusqueda = new BsonDocument().append(CONST_ID_CLUB, new BsonString(idClub));
			coleccionClubes.deleteOne(criteriosBusqueda);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	public boolean insertaUsuario(String idClub, String username) {
		club = leerClub(idClub, username);
		if(club!=null) {
			miembros = club.getMiembros();
			encontrado = false;
			for(indice=0; indice<miembros.size(); indice++) {
				if(miembros.get(indice).equals(username)) {
					encontrado = true;
					indice = miembros.size();
				}
			}
			if(!encontrado) {
				miembros.add(username);
				club.setMiembros(miembros);
				return actualizaClub(club);
			}else {
				return false;
			}
		}else {
			return false;
		}		
	}

	public boolean eliminaUsuario(String idClub, String username) {
		club = leerClub(idClub, username);
		if(club!=null) {
			miembros = club.getMiembros();
			encontrado = false;
			for(indice=0; indice<miembros.size(); indice++) {
				if(miembros.get(indice).equals(username)) {
					encontrado = true;
					miembros.remove(indice);
					club.setMiembros(miembros);
					indice = miembros.size();
				}
			}
			if(encontrado) {
				return actualizaClub(club);
			}else {
				return false;
			}
		}else {
			return false;
		}		
	}
	
	public boolean actualizaClub(ClubDTO club) {
		return eliminaClub(club.getIdClub()) && insertaClub(club);
	}
	
	public List<ClubDTO> getTodosClubes(String username){
		clubes = new LinkedList<>();
		iterador = coleccionClubes.find().iterator();
		while(iterador.hasNext()) {
			doc = iterador.next();
			club = new ClubDTO(doc.getString(CONST_ID_CLUB), doc.getString(CONST_NOMBRE), doc.getString("tema"), 
					doc.getString(CONST_ADMIN), (List<String>)doc.get(CONST_MIEMBROS), doc.getString(CONST_FECHA));
			
			club.setSoyAdministradorClub(username.equals(club.getAdministrador()));
			
			club.setPertenezcoClub(checkPertenezcoClub(club.getMiembros(), username));
					
			clubes.add(club);
		}
		return clubes;
	}
	
	public List<ClubDTO> getMisClubes(String username){
		clubes = new LinkedList<>();
		criteriosBusqueda = new BsonDocument().append(CONST_ADMIN, new BsonString(username));
		iterador = coleccionClubes.find(criteriosBusqueda).iterator();
		while(iterador.hasNext()) {
			doc = iterador.next();
			
			club = new ClubDTO(doc.getString(CONST_ID_CLUB), doc.getString(CONST_NOMBRE), doc.getString("tema"), 
					doc.getString(CONST_ADMIN), (List<String>)doc.get(CONST_MIEMBROS), doc.getString(CONST_FECHA));
			
			club.setSoyAdministradorClub(true);
			
			club.setPertenezcoClub(checkPertenezcoClub(club.getMiembros(), username));
			
			clubes.add(club);
		}
		return clubes;
	}
	
	public List<ClubDTO> getClubesPertenezco(String username){
		clubes = new LinkedList<>();
		iterador = coleccionClubes.find().iterator();
		while(iterador.hasNext()) {
			doc = iterador.next();
			miembros = (List<String>)doc.get(CONST_MIEMBROS);
			if(checkPertenezcoClub(miembros, username)) {
				
				club = new ClubDTO(doc.getString(CONST_ID_CLUB), doc.getString(CONST_NOMBRE), doc.getString("tema"), 
						doc.getString(CONST_ADMIN), (List<String>)doc.get(CONST_MIEMBROS), doc.getString(CONST_FECHA));
				
				club.setSoyAdministradorClub(username.equals(club.getAdministrador()));
				
				club.setPertenezcoClub(true);
				
				clubes.add(club);
			}
		}
		return clubes;
	}
	
	private boolean checkPertenezcoClub(List<String> listaMiembros, String username) {
		encontrado = false;
		for(indice=0; indice<listaMiembros.size(); indice++) {
			if(listaMiembros.get(indice).equals(username)) {
				encontrado = true;
				indice = listaMiembros.size();
			}
		}
		return encontrado;
	}
	
	public List<ClubDTO> todosClubesCreados(){
		clubes = new LinkedList<>();
		iterador = coleccionClubes.find().iterator();
		while(iterador.hasNext()) {
			doc = iterador.next();
			miembros = (List<String>)doc.get(CONST_MIEMBROS);
			club = new ClubDTO(doc.getString(CONST_ID_CLUB), doc.getString(CONST_NOMBRE), doc.getString("tema"), 
					doc.getString(CONST_ADMIN), (List<String>)doc.get(CONST_MIEMBROS), doc.getString(CONST_FECHA));
			clubes.add(club);
		}
		return clubes;
	}

}
