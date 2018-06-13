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
			doc.append("nombre", club.getNombre());
			doc.append("administrador", club.getAdministrador());
			doc.append("miembros", club.getColeccionMiembros());
			coleccionClubes.insertOne(doc);
			insert = true;
		}catch(Exception ex) {
			insert = false;
		}
		return insert;
	}
	
	public boolean existClub(String nombre) {
		boolean existe = false;
		MongoCursor<Document> listaPosibles = coleccionClubes.find(new BsonDocument().append("nombre", new BsonString(nombre))).iterator();
		if(listaPosibles.hasNext()) {
			existe = true;
		}
		return existe;
	}
	
	@SuppressWarnings("unchecked")
	public Club readClub(String nombre) {
		Club club = null;
		MongoCursor<Document> listas = coleccionClubes.find(new BsonDocument().append("nombre", new BsonString(nombre))).iterator();
		if(listas.hasNext()) {
			doc = listas.next();
			club = new Club (doc.getString("nombre"));
			club.setAdministrador(doc.getString("administrador"));
			club.setColeccionMiembros((ArrayList<String>) doc.get("miembros"));
		}
		return club;
	}
	
	public ArrayList<String> readAllClubes() {
		clubes = new ArrayList<String>();
		MongoCursor<Document> listas = coleccionClubes.find().iterator();
		while(listas.hasNext()) {
			clubes.add(listas.next().getString("nombre"));
		}
		return clubes;
	}
	
	public ArrayList<String> readClubesUsuario(String usuario) {
		clubes = new ArrayList<String>();
		MongoCursor<Document> listas = coleccionClubes.find().iterator();
		while(listas.hasNext()) {
			miembros = (ArrayList<String>)listas.next().get("miembros");
			for(indice=0; indice<miembros.size(); indice++) {
				if(miembros.get(indice).equals(usuario)) {
					clubes.add(listas.next().get("nombre").toString());
					indice = miembros.size();
				}
			}
		}
		return clubes;
	}
	
	public boolean deleteClub(Club club) {
		MongoCursor<Document> listas = coleccionClubes.find(new BsonDocument().append("nombre", new BsonString(club.getNombre()))).iterator();
		if(listas.hasNext()) {
			coleccionClubes.deleteOne(new BsonDocument().append("nombre", new BsonString(club.getNombre())));
			return true;
		}
		return false;
	}
	
	public boolean updateClub(Club club) {
		try {
			deleteClub(club);
			insertClub(club);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean deleteClub(String nombre) {
		boolean borrado = false;
		MongoCursor<Document> listaPosibles = coleccionClubes.find(new BsonDocument().append("nombre", new BsonString(nombre))).iterator();
		if(listaPosibles.hasNext()) {
			coleccionClubes.deleteOne(new BsonDocument().append("nombre", new BsonString(nombre)));
			borrado = true;
		}
		return borrado;
	}
	
	public boolean pertenece(String usuario, String club) {
		boolean pertenece = false;
		MongoCursor<Document> listaPosibles = coleccionClubes.find(new BsonDocument().append("nombre", new BsonString(club))).iterator();
		if(listaPosibles.hasNext()) {
			doc = listaPosibles.next();
			miembros = (ArrayList<String>) doc.get("miembros");
			for(int i=0; i<miembros.size(); i++) {
				if(miembros.get(i).equals(usuario)) {
					pertenece = true;
				}
			}
		}
		return pertenece;
	}
}