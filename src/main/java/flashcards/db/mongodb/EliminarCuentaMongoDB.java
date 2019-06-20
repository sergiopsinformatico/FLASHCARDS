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
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.auxiliares.PropertiesConfig;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOEliminarCuenta;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;

public class EliminarCuentaMongoDB implements InterfaceDAOEliminarCuenta{
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionEliminados;
    Document doc;
    Bson criteriosBusqueda;
    FindIterable<Document> resultadosBusqueda;
    MongoCursor<Document>iterador;
    LinkedList<EliminarCuentaDTO> lista;
    Fecha date;
    String compara;
    UsuarioDTO user;
    
    //Logger
    private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.EliminarCuentaMongoDB");
	
	public EliminarCuentaMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionEliminados = db.getCollection(PropertiesConfig.getProperties("colEliminarCuenta"));
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }
	
	public boolean insertaEliminado(EliminarCuentaDTO cuenta) {
		try {
			doc = new Document().append("username", cuenta.getUsername())
								.append("fecha", cuenta.getFecha());
			coleccionEliminados.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	public boolean leerEliminado(EliminarCuentaDTO cuenta) {
		try {
			if(cuenta.getFecha()=="") {
				criteriosBusqueda = new BsonDocument().append("username", new BsonString(cuenta.getUsername()));
			}else {
				criteriosBusqueda = new BsonDocument().append("username", new BsonString(cuenta.getUsername()))
													  .append("fecha", new BsonString(cuenta.getFecha()));
			}
			resultadosBusqueda = coleccionEliminados.find(criteriosBusqueda);
			return resultadosBusqueda.iterator().hasNext();
		}catch(Exception ex) {
			return false;
		}
	}
	public boolean eliminarEliminado(EliminarCuentaDTO cuenta) {
		try {
			if(cuenta.getFecha()=="") {
				criteriosBusqueda = new BsonDocument().append("username", new BsonString(cuenta.getUsername()));
			}else {
				criteriosBusqueda = new BsonDocument().append("username", new BsonString(cuenta.getUsername()))
													  .append("fecha", new BsonString(cuenta.getFecha()));
			}
			coleccionEliminados.deleteOne(criteriosBusqueda);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	public List<EliminarCuentaDTO> leerTodos(){
		lista = new LinkedList<>();
		resultadosBusqueda = coleccionEliminados.find();
		iterador = resultadosBusqueda.iterator();
		while(iterador.hasNext()) {
			doc = iterador.next();
			lista.add(new EliminarCuentaDTO(doc.getString("username"), doc.getString("fecha")));
		}
		return lista;
	}
	
	public void comprobarCuentasAEliminar() {
		iterador = coleccionEliminados.find().iterator();
		date = new Fecha();
		while(iterador.hasNext()) {
			doc = iterador.next();
			compara = date.compararFechas(doc.getString("fecha"), date.fechaHoy());
			if(compara!=null && Integer.parseInt(compara)<0) {
				eliminarEliminado(new EliminarCuentaDTO(doc.getString("username")));
				user = Broker.getInstanciaUsuario().getUsuarioDTO(doc.getString("username"));
				Broker.getInstanciaUsuario().deleteUsuario(user);
				iterador = coleccionEliminados.find().iterator();
			}
		}
	}
}
