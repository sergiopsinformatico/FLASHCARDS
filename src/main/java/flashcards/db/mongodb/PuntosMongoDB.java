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
import main.java.flashcards.db.dao.InterfaceDAOPuntos;
import main.java.flashcards.dto.PuntosDTO;

public class PuntosMongoDB implements InterfaceDAOPuntos {
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionPuntos;
    Document doc;
    Bson criteriosBusqueda;
    MongoCursor<Document> iterador;
    int nuevosPuntos;
    
    List<PuntosDTO> rankingSinOrdenar;
    List<PuntosDTO> rankingOrdenados;
    PuntosDTO ePunto;
    Document eDoc;
    
    int indice;
    int indiceElegido;
    int valor;
    
    //Logger
    private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.PuntosMongoDB");
	
	public PuntosMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionPuntos = db.getCollection(PropertiesConfig.getProperties("colPuntos"));
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }

	public boolean sumoPuntos(PuntosDTO puntos) {
		criteriosBusqueda = new BsonDocument().append("username", new BsonString(puntos.getUsuario()));
		
		iterador = coleccionPuntos.find(criteriosBusqueda).iterator();
		if(iterador.hasNext()) {
			try {
				doc = iterador.next();
				coleccionPuntos.deleteOne(criteriosBusqueda);
				nuevosPuntos = doc.getInteger("puntos");
				nuevosPuntos = nuevosPuntos + puntos.getPuntos();
				doc.replace("puntos", nuevosPuntos);
				coleccionPuntos.insertOne(doc);
				return true;
			}catch(Exception ex) {
				return false;
			}
		}else {
			return false;
		}
	}
	
	public boolean creoPuntos(PuntosDTO puntos) {
		try {
			coleccionPuntos.insertOne(dtoToDocument(puntos));
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminoPuntos(String username) {
		try {
			criteriosBusqueda = new BsonDocument().append("username", new BsonString(username));
			coleccionPuntos.deleteOne(criteriosBusqueda);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public int getPuntosUsuario(String username) {
		criteriosBusqueda = new BsonDocument().append("username", new BsonString(username));
		iterador = coleccionPuntos.find(criteriosBusqueda).iterator();
		return iterador.next().getInteger("puntos");
	}
	
	public List<PuntosDTO> rankingPuntos(){
		rankingSinOrdenar = new LinkedList<>();
		rankingOrdenados = new LinkedList<>();
		
		iterador = coleccionPuntos.find().iterator();
		while(iterador.hasNext()) {
			rankingSinOrdenar.add(documentToDTO(iterador.next()));
		}
		
		indice = 0;
		indiceElegido = -1;
		valor = -1;
		
		while(rankingSinOrdenar.size() > 0) {
			if(indice<rankingSinOrdenar.size() && rankingSinOrdenar.get(indice).getPuntos()>valor) {
				valor = rankingSinOrdenar.get(indice).getPuntos();
				indiceElegido = indice;
				indice++;
			}else if(indice == rankingSinOrdenar.size()) {
				rankingOrdenados.add(rankingSinOrdenar.get(indiceElegido));
				rankingSinOrdenar.remove(indiceElegido);
				indice = 0;
				indiceElegido = -1;
				valor = -1;
			}
			
		}
		
		return rankingOrdenados;
	}
	
	private PuntosDTO documentToDTO(Document doc) {
		ePunto = new PuntosDTO(doc.getString("username"), doc.getInteger("puntos"));
		return ePunto;
	}
	
	private Document dtoToDocument(PuntosDTO puntos) {
		eDoc = new Document().append("username", puntos.getUsuario())
							 .append("puntos", puntos.getPuntos());
		return eDoc;
	}

}
