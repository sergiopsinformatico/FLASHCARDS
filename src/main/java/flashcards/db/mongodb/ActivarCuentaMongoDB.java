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
import main.java.flashcards.db.dao.InterfaceDAOActivaCuenta;
import main.java.flashcards.dto.ActivaCuentaDTO;

public class ActivarCuentaMongoDB implements InterfaceDAOActivaCuenta{
	
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
    
    //Constantes
  	static final String CONST_USERNAME = "username";
  	static final String CONST_CODIGO = "codigo";
  	static final String CONST_FECHA = "fecha";
    
    //Logger
    private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.ActivarCuentaMongoDB");
	
	public ActivarCuentaMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionActivaCuenta = db.getCollection(PropertiesConfig.getProperties("colActivarCuenta"));
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }
	
	public boolean activacionCuenta(ActivaCuentaDTO activaCuenta) {
		try{
			criteriosBusqueda = new BsonDocument().append(CONST_USERNAME, new BsonString(activaCuenta.getUsername()))
												  .append(CONST_CODIGO, new BsonString(activaCuenta.getCodigoActivacion()));
			
			resultadosBusqueda = coleccionActivaCuenta.find(criteriosBusqueda);
			return resultadosBusqueda.iterator().hasNext();
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean existeActivacionUsuario(String username) {
		try{
			criteriosBusqueda = new BsonDocument().append(CONST_USERNAME, new BsonString(username));
			resultadosBusqueda = coleccionActivaCuenta.find(criteriosBusqueda);
			return resultadosBusqueda.iterator().hasNext();
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean insertaAC(ActivaCuentaDTO activaCuenta) {
		try{
			doc = new Document().append(CONST_USERNAME, activaCuenta.getUsername())
								.append(CONST_CODIGO, activaCuenta.getCodigoActivacion())
								.append(CONST_FECHA,activaCuenta.getFecha());
			coleccionActivaCuenta.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminaAC(ActivaCuentaDTO activaCuenta) {
		try{
			criteriosBusqueda = new BsonDocument().append(CONST_USERNAME, new BsonString(activaCuenta.getUsername()))
												  .append(CONST_CODIGO, new BsonString(activaCuenta.getCodigoActivacion()));
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
			lista.add(new ActivaCuentaDTO(doc.getString(CONST_USERNAME), doc.getString(CONST_CODIGO), doc.getString(CONST_FECHA)));
		}
		return lista;
	}
	
	public void comprobarActivacionesCaducadas() {
		iterador = coleccionActivaCuenta.find().iterator();
		String compara;
	    Fecha fecha = new Fecha();
	    while(iterador.hasNext()) {
	    	doc = iterador.next();
	    	compara = fecha.compararFechas(doc.getString(CONST_FECHA), fecha.fechaHoy());
	    	if(compara!=null && Integer.parseInt(compara)<0) {
				eliminaAC(new ActivaCuentaDTO(doc.getString(CONST_USERNAME), doc.getString(CONST_CODIGO)));
		    	iterador = coleccionActivaCuenta.find().iterator();
			}
	    }	
	}
}
