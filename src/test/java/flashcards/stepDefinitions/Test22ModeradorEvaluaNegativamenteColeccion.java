package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.FlashcardsDTO;

public class Test22ModeradorEvaluaNegativamenteColeccion {
	
	FlashcardsDTO flashcard;
	
	@Given("^El moderador analiza la coleccion$")
	public void el_moderador_analiza_la_coleccion() throws Throwable {
		assert(Broker.getInstanciaUsuario().getUsuarioDTO("moderador").getRol().equals("Moderador"));
	}

	@When("^Lo valora negativamente$")
	public void lo_valora_negativamente() throws Throwable {
		assert(Broker.getInstanciaFlashcards().valoraNegativamente("flash12345"));
	}

	@Then("^La coleccion se elimina por no cumplir los requisitos$")
	public void la_coleccion_se_elimina_por_no_cumplir_los_requisitos() throws Throwable {
	    flashcard = Broker.getInstanciaFlashcards().leerFlashcard("flash12345");
	    assert(flashcard==null);
	}
	
}
