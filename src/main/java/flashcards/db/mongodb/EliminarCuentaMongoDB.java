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
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOEliminarCuenta;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;

public class EliminarCuentaMongoDB implements InterfaceDAOEliminarCuenta{
	
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionEliminados;
    Document doc;
    Bson criteriosBusqueda;
    FindIterable<Document> resultadosBusqueda;
    MongoCursor<Document>iterador;
    LinkedList<EliminarCuentaDTO> lista;
    final String username = "username";
    final String fecha = "fecha";
    
    private final static Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.EliminarCuentaMongoDB");
	
	public EliminarCuentaMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionEliminados = db.getCollection("SolicitudEliminarCuenta");
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }
	
	public boolean insertaEliminado(EliminarCuentaDTO cuenta) {
		try {
			doc = new Document().append(username, cuenta.getUsername()).append(fecha, cuenta.getFecha());
			coleccionEliminados.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	public boolean leerEliminado(EliminarCuentaDTO cuenta) {
		try {
			if(cuenta.getFecha()=="") {
				criteriosBusqueda = new BsonDocument().append(username, new BsonString(cuenta.getUsername()));
			}else {
				criteriosBusqueda = new BsonDocument().append(username, new BsonString(cuenta.getUsername())).append(fecha, new BsonString(cuenta.getFecha()));
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
				criteriosBusqueda = new BsonDocument().append(username, new BsonString(cuenta.getUsername()));
			}else {
				criteriosBusqueda = new BsonDocument().append(username, new BsonString(cuenta.getUsername())).append(fecha, new BsonString(cuenta.getFecha()));
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
			lista.add(new EliminarCuentaDTO(doc.getString(username), doc.getString(fecha)));
		}
		return lista;
	}
	
	public void comprobarCuentasAEliminar() {
		List<EliminarCuentaDTO>listaEl = leerTodos();
		Fecha fecha = new Fecha();
		String compara;
		UsuarioDTO user;
		for(int indice=0; indice<listaEl.size(); indice++) {
			compara = fecha.compararFechas(listaEl.get(indice).getFecha(), fecha.fechaHoy());
			if(compara!=null && Integer.parseInt(compara)<=0) {
				Broker.getInstanciaEliminarCuenta().eliminarEliminado(listaEl.get(indice));
				user = Broker.getInstanciaUsuario().getUsuarioDTO(listaEl.get(indice).getUsername());
				Broker.getInstanciaUsuario().deleteUsuario(user);
			}
		}
	}
}
