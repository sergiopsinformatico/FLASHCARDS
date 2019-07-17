package main.java.flashcards.db.mongodb;

import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.bson.BsonBoolean;
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

import main.java.flashcards.auxiliares.PropertiesConfig;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.db.dao.InterfaceDAOFlashcards;
import main.java.flashcards.dto.ClubDTO;
import main.java.flashcards.dto.FlashcardsDTO;
import main.java.flashcards.dto.TarjetaDTO;

public class FlashcardsMongoDB implements InterfaceDAOFlashcards {
	
	//Variables
	MongoClientURI uri; 
    MongoClient client;
    MongoDatabase db;
    MongoCollection<Document> coleccionFlashcards;
    
    Document doc;
    Document docTarjetas;
    Document docTransformado;
    
    Bson criteriosBusqueda;
    FindIterable<Document> resultadosBusqueda;
    LinkedList<FlashcardsDTO> lista;
    MongoCursor<Document> iterador;
    FlashcardsDTO flashcard;
    FlashcardsDTO flashcardTransformada;
    List<TarjetaDTO> listaTarjetas;
    List<Document> listaTarjetasDoc;
    List<FlashcardsDTO> listaFlashcards;
    List<String> idsFlashcards;
    int indice;
    
    InterfaceDAOClub dBClubes;
    List<ClubDTO> clubes;
    
    //Logger
    private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.db.mongodb.FlashcardsMongoDB");
	
	public FlashcardsMongoDB() {
		connection();
	}
	
	//Conexion con la BD
    private void connection() {
    	try {
			uri  = new MongoClientURI(PropertiesConfig.getProperties("conexionMongoDB")); 
	        client = new MongoClient(uri);
	        db = client.getDatabase(uri.getDatabase());
	        coleccionFlashcards = db.getCollection(PropertiesConfig.getProperties("colFlashcards"));
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
		}
    }
    
    public boolean crearFlashcards(FlashcardsDTO flashcards) {
    	try {
    		
    		doc = flashcardToDocument(flashcards);
	    	coleccionFlashcards.insertOne(doc);
	    	
	    	return true;
    	}catch(Exception ex) {
    		return false;
    	}
    }
    
    private Document flashcardToDocument(FlashcardsDTO flashcards) {
    	
    	
    	listaTarjetasDoc = new LinkedList<>();
		listaTarjetas = flashcards.getTarjetas();
		for(indice=0; indice<listaTarjetas.size(); indice++) {
			docTarjetas = new Document().append("anverso", listaTarjetas.get(indice).getAnverso())
										.append("reverso", listaTarjetas.get(indice).getReverso());
			listaTarjetasDoc.add(docTarjetas);
		}
		
		
    	docTransformado = new Document().append("id", flashcards.getIdColeccion())
    						.append("nombre", flashcards.getNombreColeccion())
    						.append("tema", flashcards.getTemaColeccion())
    						.append("autor", flashcards.getAutorColeccion())
    						.append("tipoCompartir", flashcards.getTipoCompartir())
    						.append("compartirCon", flashcards.getCompartirCon())
    						.append("tarjetas", listaTarjetasDoc)
    						.append("fecha", flashcards.getFechaCreacion())
    						.append("evaluada", flashcards.isEvaluada())
    						.append("evaluador", flashcards.getEvaluador());
    	
    	return docTransformado;
    }
    
    public FlashcardsDTO leerFlashcard(String idFlashcard) {
    	criteriosBusqueda = new BsonDocument().append("id", new BsonString(idFlashcard));
    	iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
    	if(iterador.hasNext()) {
    		
    		doc = iterador.next();
    		flashcard = documentToFlashcards(doc);
    		return flashcard;
    		
    	}else {
    		return null;
    	}
    }
    
    private FlashcardsDTO documentToFlashcards(Document docFlashcards) {
    	
    	listaTarjetasDoc = (List<Document>)docFlashcards.get("tarjetas");
		listaTarjetas = new LinkedList<>();
		
		for(indice=0; indice<listaTarjetasDoc.size(); indice++) {
			listaTarjetas.add(new TarjetaDTO(listaTarjetasDoc.get(indice).getString("anverso"),
					listaTarjetasDoc.get(indice).getString("reverso")));
		}
		
		flashcardTransformada = new FlashcardsDTO(docFlashcards.getString("id"), docFlashcards.getString("nombre"), docFlashcards.getString("tema"), docFlashcards.getString("fecha"), docFlashcards.getString("autor"), 
				listaTarjetas, docFlashcards.getString("tipoCompartir"), docFlashcards.getString("compartirCon"), docFlashcards.getBoolean("evaluada"), docFlashcards.getString("evaluador"));

		return flashcardTransformada;
    }
    
    public boolean eliminarFlashcard(String idFlashcard) {
    	try {
    		criteriosBusqueda = new BsonDocument().append("id", new BsonString(idFlashcard));
        	coleccionFlashcards.deleteOne(criteriosBusqueda);
    		return true;
    	}catch(Exception ex) {
    		return false;
    	}
    }
    
    public List<FlashcardsDTO> consultaSinEvaluar(){
    	try {
    		listaFlashcards = new LinkedList<>();
    		
    		criteriosBusqueda = new BsonDocument().append("evaluada", new BsonBoolean(false));
        	iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
        	
        	while(iterador.hasNext()) {
        		doc = iterador.next();
        		flashcard = documentToFlashcards(doc);
        		listaFlashcards.add(flashcard);
        	}

    	}catch(Exception ex) {
    		listaFlashcards = new LinkedList<>();
    	}
    	
    	return listaFlashcards;
    }
    
    public boolean valoraPositivamente(String idFlashcard, String evaluador) {
    	flashcard = leerFlashcard(idFlashcard);
    	flashcard.setEvaluada(true);
    	flashcard.setEvaluador(evaluador);
    	eliminarFlashcard(flashcard.getIdColeccion());
    	return crearFlashcards(flashcard);
    }
    
	public boolean valoraNegativamente(String idFlashcard) {
    	return eliminarFlashcard(idFlashcard);
	}
	
	public List<FlashcardsDTO> listarTodasColecciones(){
		try {
    		listaFlashcards = new LinkedList<>();
    		
    		criteriosBusqueda = new BsonDocument().append("evaluada", new BsonBoolean(true));
        	iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
        	
        	while(iterador.hasNext()) {
        		doc = iterador.next();
        		flashcard = documentToFlashcards(doc);
        		listaFlashcards.add(flashcard);
        	}

    	}catch(Exception ex) {
    		listaFlashcards = new LinkedList<>();
    	}
    	
    	return listaFlashcards;
	}
	
	public List<FlashcardsDTO> listarColeccionesVisibles(String username){
		
		try {
    		listaFlashcards = new LinkedList<>();
    		idsFlashcards = new LinkedList<>();
    		
    		criteriosBusqueda = new BsonDocument().append("autor", new BsonString(username));
        	iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
        	
        	while(iterador.hasNext()) {
        		doc = iterador.next();
        		flashcard = documentToFlashcards(doc);
        		listaFlashcards.add(flashcard);
        		idsFlashcards.add(flashcard.getIdColeccion());
        	}
        	
        	criteriosBusqueda = new BsonDocument().append("tipoCompartir", new BsonString("publico"))
        										  .append("evaluada", new BsonBoolean(true));
        	iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
        	
        	while(iterador.hasNext()) {
        		doc = iterador.next();
        		flashcard = documentToFlashcards(doc);
        		if(!(idsFlashcards.contains(flashcard.getIdColeccion()))) {
        			listaFlashcards.add(flashcard);
        			idsFlashcards.add(flashcard.getIdColeccion());
        		}
        	}
        	
        	criteriosBusqueda = new BsonDocument().append("tipoCompartir", new BsonString("usuario"))
        										  .append("compartirCon", new BsonString(username))
        										  .append("evaluada", new BsonBoolean(true));
        	
        	iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
        	
        	while(iterador.hasNext()) {
        		doc = iterador.next();
        		flashcard = documentToFlashcards(doc);
        		if(!(idsFlashcards.contains(flashcard.getIdColeccion()))) {
        			listaFlashcards.add(flashcard);
        			idsFlashcards.add(flashcard.getIdColeccion());
        		}
        	}
        	
        	dBClubes = Broker.getInstanciaClub();
        	clubes = dBClubes.getMisClubes(username);
        	for(indice=0; indice<clubes.size(); indice++) {
        		
        		criteriosBusqueda = new BsonDocument().append("tipoCompartir", new BsonString("club"))
        											  .append("compartirCon", new BsonString(clubes.get(indice).getIdClub()))
        											  .append("evaluada", new BsonBoolean(true));

				iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
				
				while(iterador.hasNext()) {
					doc = iterador.next();
					flashcard = documentToFlashcards(doc);
					if(!(idsFlashcards.contains(flashcard.getIdColeccion()))) {
						listaFlashcards.add(flashcard);
						idsFlashcards.add(flashcard.getIdColeccion());
					}
				}
        		
        	}
        	
        }catch(Exception ex) {
    		listaFlashcards = new LinkedList<>();
    	}
    	
    	return listaFlashcards;
		
	}
	
	public boolean existeIdColeccion(String idFlashcards) {
		try {
			criteriosBusqueda = new BsonDocument().append("id", new BsonString(idFlashcards));
			iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
			return iterador.hasNext();
		}catch(Exception ex) {
			return false;
		}
	}
	
	public List<FlashcardsDTO> coleccionesCreadasVisibles(String username){
		
		try {
    		listaFlashcards = new LinkedList<>();
    		
    		criteriosBusqueda = new BsonDocument().append("autor", new BsonString(username))
    											  .append("evaluada", new BsonBoolean(true));
    		
        	iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
        	
        	while(iterador.hasNext()) {
        		doc = iterador.next();
        		flashcard = documentToFlashcards(doc);
        		listaFlashcards.add(flashcard);
        	}
        	
        }catch(Exception ex) {
    		listaFlashcards = new LinkedList<>();
    	}
    	
    	return listaFlashcards;
		
	}
	
	public List<FlashcardsDTO> coleccionesCreadasSinEvaluar (String username){
		
		try {
    		listaFlashcards = new LinkedList<>();
    		
    		criteriosBusqueda = new BsonDocument().append("autor", new BsonString(username))
    											  .append("evaluada", new BsonBoolean(false));
    		
        	iterador = coleccionFlashcards.find(criteriosBusqueda).iterator();
        	
        	while(iterador.hasNext()) {
        		doc = iterador.next();
        		flashcard = documentToFlashcards(doc);
        		listaFlashcards.add(flashcard);
        	}
        	
        }catch(Exception ex) {
    		listaFlashcards = new LinkedList<>();
    	}
    	
    	return listaFlashcards;
		
	}
    
}
