package main.java.flashcards.db.mongodb;

import java.util.LinkedList;
import java.util.List;

import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import main.java.flashcards.db.dao.InterfaceDAOActivaCuenta;
import main.java.flashcards.dto.ActivaCuentaDTO;

public class ActivaCuentaMongoDB implements InterfaceDAOActivaCuenta{
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionUsuarios;
    Document doc;
    Bson criteriosBusqueda;
    FindIterable<Document> resultadosBusqueda;
    LinkedList<ActivaCuentaDTO> lista;
    MongoCursor<Document> iterador;
	
	public ActivaCuentaMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionUsuarios = db.getCollection("ActivaCuenta");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
    }
	
	public boolean activacionCuenta(ActivaCuentaDTO activaCuenta) {
		try{
			criteriosBusqueda = new BsonDocument().append("username", new BsonString(activaCuenta.getUsername())).append("codigo", new BsonString(activaCuenta.getCodigoActivacion()));
			resultadosBusqueda = coleccionUsuarios.find(criteriosBusqueda);
			if(resultadosBusqueda.iterator().hasNext()) {
				return true;
			}else {
				return false;
			}
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean insertaAC(ActivaCuentaDTO activaCuenta) {
		try{
			doc = new Document().append("username", activaCuenta.getUsername()).append("codigo", activaCuenta.getCodigoActivacion()).append("fecha",activaCuenta.getFecha());
			coleccionUsuarios.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminaAC(ActivaCuentaDTO activaCuenta) {
		try{
			criteriosBusqueda = new BsonDocument().append("username", new BsonString(activaCuenta.getUsername())).append("codigo", new BsonString(activaCuenta.getCodigoActivacion()));
			coleccionUsuarios.deleteOne(criteriosBusqueda);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public List<ActivaCuentaDTO> leerTodas(){
		lista = new LinkedList<ActivaCuentaDTO>();
		resultadosBusqueda = coleccionUsuarios.find();
		iterador = resultadosBusqueda.iterator();
		while(iterador.hasNext()) {
			doc = iterador.next();
			lista.add(new ActivaCuentaDTO(doc.getString("username"), doc.getString("codigo"), doc.getString("fecha")));
		}
		return lista;
	}
}
