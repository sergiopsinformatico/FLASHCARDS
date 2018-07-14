package com.flashcards.db;

import java.util.ArrayList;
import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;
import com.flashcards.modelo.Club;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class DBClubes {
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionClubes;
    Document doc;
    ArrayList<String>miembros;
    ArrayList<String> clubes;
    int indice;
    
    public DBClubes() {
    	conexionDB();
    }
    
	public void conexionDB() {
		try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionClubes = db.getCollection("Clubes");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public boolean insertClub(Club club) {
		boolean insert = false;
		try {
			doc = new Document();
			doc.append("identificador", club.getIdentificador());
			doc.append("nombre", club.getNombre());
			doc.append("descripcion", club.getDescripcion());
			doc.append("administrador", club.getAdministrador());
			doc.append("miembros", club.getColeccionMiembros());
			coleccionClubes.insertOne(doc);
			insert = true;
		}catch(Exception ex) {
			insert = false;
		}
		return insert;
	}
	
	public boolean existIdentificador(String identificador) {
		MongoCursor<Document> listaPosibles = coleccionClubes.find(new BsonDocument().append("identificador", new BsonString(identificador))).iterator();
		if(listaPosibles.hasNext()) {
			return true;
		}else {
			return false;
		}
	}
	

	public Club readClubByIdentificador(String identificador) {
		Club club = null;
		MongoCursor<Document> listas = coleccionClubes.find(new BsonDocument().append("identificador", new BsonString(identificador))).iterator();
		if(listas.hasNext()) {
			doc = listas.next();
			club = new Club (doc.getString("nombre"));
			club.setIdentificador(doc.getString("identificador"));
			club.setDescripcion(doc.getString("descripcion"));
			club.setAdministrador(doc.getString("administrador"));
			club.setColeccionMiembros((ArrayList<String>) doc.get("miembros"));
		}
		return club;
	}
	
	public ArrayList<String> readAllClubes() {
		clubes = new ArrayList<String>();
		MongoCursor<Document> listas = coleccionClubes.find().iterator();
		while(listas.hasNext()) {
			doc = listas.next();
			clubes.add(doc.getString("nombre")+"////-////"+doc.getString("identificador")+"////-////"+doc.getString("descripcion"));
		}
		return clubes;
	}
	
	public ArrayList<String> readAllClubesUser(String usuario) {
		clubes = new ArrayList<String>();
		MongoCursor<Document> listas = coleccionClubes.find().iterator();
		while(listas.hasNext()) {
			doc = listas.next();
			miembros = (ArrayList<String>)doc.get("miembros");
			for(indice=0; indice<miembros.size(); indice++) {
				if(miembros.get(indice).equals(usuario)) {
					clubes.add(doc.getString("nombre")+"////-////"+doc.getString("identificador")+"////-////"+doc.getString("descripcion"));
					indice = miembros.size();
				}
			}
		}
		return clubes;
		
		
	}
	
	public ArrayList<String> readClubesUsuario(String usuario) {
		clubes = new ArrayList<String>();
		MongoCursor<Document> listas = coleccionClubes.find().iterator();
		while(listas.hasNext()) {
			doc = listas.next();
			miembros = (ArrayList<String>)doc.get("miembros");
			for(indice=0; indice<miembros.size(); indice++) {
				if(miembros.get(indice).equals(usuario)) {
					clubes.add(doc.getString("nombre")+"///****id****///"+doc.getString("identificador"));
					indice = miembros.size();
				}
			}
		}
		return clubes;
	}
	
	public ArrayList<String> readMiembros(String identificador) {
		doc = coleccionClubes.find(new BsonDocument().append("identificador", new BsonString(identificador))).iterator().next();
		miembros = (ArrayList<String>)doc.get("miembros");
		return miembros;
	}
	
	public boolean deleteClub(String identificador) {
		MongoCursor<Document> listas = coleccionClubes.find(new BsonDocument().append("identificador", new BsonString(identificador))).iterator();
		if(listas.hasNext()) {
			coleccionClubes.deleteOne(new BsonDocument().append("identificador", new BsonString(identificador)));
			return true;
		}
		return false;
	}
	
	public boolean updateClub(Club club) {
		try {
			deleteClub(club.getIdentificador());
			insertClub(club);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean perteneceIdentificador(String usuario, String identificador) {
		MongoCursor<Document> listaPosibles = coleccionClubes.find(new BsonDocument().append("identificador", new BsonString(identificador))).iterator();
		if(listaPosibles.hasNext()) {
			doc = listaPosibles.next();
			miembros = (ArrayList<String>) doc.get("miembros");
			for(int i=0; i<miembros.size(); i++) {
				if(miembros.get(i).equals(usuario)) {
					return true;
				}
			}
		}
		return false;
	}
}