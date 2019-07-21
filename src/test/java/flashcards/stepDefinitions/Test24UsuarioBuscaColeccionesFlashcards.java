package test.java.flashcards.stepDefinitions;

import java.util.LinkedList;
import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.FlashcardsDTO;
import main.java.flashcards.dto.TarjetaDTO;

public class Test24UsuarioBuscaColeccionesFlashcards {
	
	FlashcardsDTO flashcard;
	List<TarjetaDTO> tarjetas;
	TarjetaDTO tarjeta;
	List<FlashcardsDTO> listaFlashcards;
	boolean encontrado;
	
	int indice;
	
	@Given("^Un usuario quiere visualizar una coleccion$")
	public void un_usuario_quiere_visualizar_una_coleccion() throws Throwable {
		tarjeta = new TarjetaDTO("anverso", "reverso");
		
		tarjetas = new LinkedList<>();
		tarjetas.add(tarjeta);
		
		flashcard = new FlashcardsDTO("flash12345", "flashEjemplo", "tema5", "usuario123", tarjetas, "publico", "");
		
		flashcard.setFechaCreacion("2019/10/01");
		flashcard.setEvaluada(false);
		flashcard.setEvaluador("");
		
	    Broker.getInstanciaFlashcards().crearFlashcards(flashcard);
	    
	    assert(Broker.getInstanciaUsuario().login("usuario123", "usuario123"));
	}

	@When("^Lista las colecciones en el buscador$")
	public void lista_las_colecciones_en_el_buscador() throws Throwable {
		listaFlashcards = Broker.getInstanciaFlashcards().listarColeccionesVisibles("usuario123");
		assert(true);
	}

	@Then("^Encuentra la coleccion buscada$")
	public void encuentra_la_coleccion_buscada() throws Throwable {
	    encontrado = false;
		for(indice=0; indice<listaFlashcards.size(); indice++) {
	    	flashcard = listaFlashcards.get(indice);
	    	if(flashcard.getIdColeccion().equals("flash12345")) {
	    		encontrado = true;
	    	}
	    }
		assert(encontrado);
	}
	
}
