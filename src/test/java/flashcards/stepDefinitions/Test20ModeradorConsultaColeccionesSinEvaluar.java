package test.java.flashcards.stepDefinitions;

import java.util.LinkedList;
import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.FlashcardsDTO;
import main.java.flashcards.dto.TarjetaDTO;

public class Test20ModeradorConsultaColeccionesSinEvaluar {
	
	FlashcardsDTO flashcard;
	List<TarjetaDTO> tarjetas;
	TarjetaDTO tarjeta;
	List<FlashcardsDTO> listaFlashcards;
	boolean encontrado;
	int indice;
		
	@Given("^Un moderador consulta las colecciones$")
	public void un_moderador_consulta_las_colecciones() throws Throwable {
	    assert(Broker.getInstanciaUsuario().getUsuarioDTO("moderador").getRol().equals("Moderador"));
	}

	@When("^Busca$")
	public void busca() throws Throwable {
		tarjeta = new TarjetaDTO("anverso", "reverso");
		
		tarjetas = new LinkedList<>();
		tarjetas.add(tarjeta);
		
		flashcard = new FlashcardsDTO("flash12345", "flashEjemplo", "tema5", "2019/10/01", "usuario123", 
				tarjetas, "publico", "", false, "");
		
	    Broker.getInstanciaFlashcards().crearFlashcards(flashcard);
	    
	    listaFlashcards = Broker.getInstanciaFlashcards().consultaSinEvaluar("moderador");
	    
	    assert(true);
	}

	@Then("^Se lista todas sin evaluar$")
	public void se_lista_todas_sin_evaluar() throws Throwable {
	    encontrado = false;
	    for(indice=0; indice<listaFlashcards.size(); indice++) {
	    	if(listaFlashcards.get(indice).isEvaluada()) {
	    		encontrado = true;
	    		indice = listaFlashcards.size();
	    	}
	    }
	    assert(!encontrado);
	}
	
}
