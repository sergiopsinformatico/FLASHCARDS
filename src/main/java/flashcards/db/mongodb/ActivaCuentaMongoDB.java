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
import main.java.flashcards.db.dao.InterfaceDAOActivaCuenta;
import main.java.flashcards.dto.ActivaCuentaDTO;

public class ActivaCuentaMongoDB implements InterfaceDAOActivaCuenta{
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionActivaCuenta;
    Document doc;
    Bson criteriosBusqueda;
    FindIterable<Document> resultadosBusqueda;
    LinkedList<ActivaCuentaDTO> lista;
    MongoCursor<Document> iterador;
    static final String CODIGO = "codigo";
    static final String USERNAME = "username";
    
    private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.ActivaCuentaMongoDB");
	
	public ActivaCuentaMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI("mongodb://sistemaflashcards:sistemaflashcards@ds119969.mlab.com:19969/sistemaflashcards"); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionActivaCuenta = db.getCollection("ActivaCuenta");
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }
	
	public boolean activacionCuenta(ActivaCuentaDTO activaCuenta) {
		try{
			criteriosBusqueda = new BsonDocument().append(USERNAME, new BsonString(activaCuenta.getUsername())).append(CODIGO, new BsonString(activaCuenta.getCodigoActivacion()));
			resultadosBusqueda = coleccionActivaCuenta.find(criteriosBusqueda);
			return resultadosBusqueda.iterator().hasNext();
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean insertaAC(ActivaCuentaDTO activaCuenta) {
		try{
			doc = new Document().append(USERNAME, activaCuenta.getUsername()).append(CODIGO, activaCuenta.getCodigoActivacion()).append("fecha",activaCuenta.getFecha());
			coleccionActivaCuenta.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminaAC(ActivaCuentaDTO activaCuenta) {
		try{
			criteriosBusqueda = new BsonDocument().append(USERNAME, new BsonString(activaCuenta.getUsername())).append(CODIGO, new BsonString(activaCuenta.getCodigoActivacion()));
			coleccionActivaCuenta.deleteOne(criteriosBusqueda);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public List<ActivaCuentaDTO> leerTodas(){
		lista = new LinkedList<>();
		resultadosBusqueda = coleccionActivaCuenta.find();
		iterador = resultadosBusqueda.iterator();
		while(iterador.hasNext()) {
			doc = iterador.next();
			lista.add(new ActivaCuentaDTO(doc.getString(USERNAME), doc.getString(CODIGO), doc.getString("fecha")));
		}
		return lista;
	}
	
	public void comprobarActivacionesCaducadas() {
		List<ActivaCuentaDTO> listaAC = leerTodas();
		String compara;
	    Fecha fecha = new Fecha();
		for(int indice=0; indice<listaAC.size(); indice++) {
			compara = fecha.compararFechas(listaAC.get(indice).getFecha(), fecha.fechaHoy());
			if(compara!=null && Integer.parseInt(compara)<=0) {
				Broker.getInstanciaActivaCuenta().eliminaAC(listaAC.get(indice));
			}
		}
	}
}
