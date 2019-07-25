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
import main.java.flashcards.db.dao.InterfaceDAOMensajes;
import main.java.flashcards.dto.MensajeDTO;

public class MensajesMongoDB implements InterfaceDAOMensajes {
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionMensajes;
    
    Bson criteriosBusqueda;
    MongoCursor<Document> iterador;
    Document doc;
    List<MensajeDTO> listaMensajes;
    List<MensajeDTO> listaAuxiliar;
    Document docAux;
    
    //Logger
    private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.MensajesMongoDB");
	
	public MensajesMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionMensajes = db.getCollection(PropertiesConfig.getProperties("colMensajes"));
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }
	
	public List<MensajeDTO> mensajesRecibidos(String username){
		try {
			listaMensajes = new LinkedList<>();
			
			criteriosBusqueda = new BsonDocument().append("envia", new BsonString(username));
			iterador = coleccionMensajes.find(criteriosBusqueda).iterator();
			listaMensajes = iteradorToList(iterador);
			return listaMensajes;
		}catch(Exception ex) {
			listaMensajes = new LinkedList<>();
			return listaMensajes;
		}
		
	}
	
	public List<MensajeDTO> mensajesEnviados(String username){
		try {
			listaMensajes = new LinkedList<>();
			
			criteriosBusqueda = new BsonDocument().append("recibidos", new BsonString(username));
			iterador = coleccionMensajes.find(criteriosBusqueda).iterator();
			listaMensajes = iteradorToList(iterador);
			return listaMensajes;
		}catch(Exception ex) {
			listaMensajes = new LinkedList<>();
			return listaMensajes;
		}
	}
	
	private List<MensajeDTO> iteradorToList(MongoCursor<Document> cursorIterador){
		listaAuxiliar = new LinkedList<>();
		while(cursorIterador.hasNext()) {
			docAux = cursorIterador.next();
			listaAuxiliar.add(new MensajeDTO(docAux.getString("idMensaje"), docAux.getString("envia"), 
							  docAux.getString("recibe"), docAux.getString("mensaje")));
		}
		return listaAuxiliar;
	}
	
	public boolean enviarMensaje(MensajeDTO mensaje) {
		try {
			doc = new Document().append("idMensaje", mensaje.getIdMensaje())
								.append("envia", mensaje.getEnvia())
								.append("recibe", mensaje.getRecibe())
								.append("mensaje", mensaje.getMensaje());
			coleccionMensajes.insertOne(doc);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminarMensaje(String idMensaje) {
		try {
			criteriosBusqueda = new BsonDocument().append("idMensaje", new BsonString(idMensaje));
			coleccionMensajes.deleteOne(criteriosBusqueda);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public MensajeDTO leerMensaje(String idMensaje) {
		try {
			criteriosBusqueda = new BsonDocument().append("idMensaje", new BsonString(idMensaje));
			iterador = coleccionMensajes.find(criteriosBusqueda).iterator();
			if(iterador.hasNext()) {
				doc = iterador.next();
				return new MensajeDTO(doc.getString("idMensaje"),
						doc.getString("envia"), doc.getString("recibe"), doc.getString("mensaje"));
			}else {
				return null;
			}
		}catch(Exception ex) {
			return null;
		}
	}
	
}
