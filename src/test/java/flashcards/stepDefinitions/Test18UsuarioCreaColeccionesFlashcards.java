package test.java.flashcards.stepDefinitions;

import java.util.LinkedList;
import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.FlashcardsDTO;
import main.java.flashcards.dto.TarjetaDTO;

public class Test18UsuarioCreaColeccionesFlashcards{
	
	FlashcardsDTO flashcard;
	List<TarjetaDTO> tarjetas;
	TarjetaDTO tarjeta;
	
	@Given("^Un usuario va a crear una coleccion$")
	public void un_usuario_va_a_crear_una_coleccion() throws Throwable {
	    assert(Broker.getInstanciaUsuario().login("usuario123", "usuario123"));
	}

	@When("^Inserta las tarjetas e indica con quien compartirlo$")
	public void inserta_las_tarjetas_e_indica_con_quien_compartirlo() throws Throwable {
	    
		tarjeta = new TarjetaDTO("anverso", "reverso");
		
		tarjetas = new LinkedList<>();
		tarjetas.add(tarjeta);
		
		flashcard = new FlashcardsDTO("flash12345", "flashEjemplo", "tema5", "2019/10/01", "usuario123", 
				tarjetas, "publico", "", false, "");
	    assert(Broker.getInstanciaFlashcards().crearFlashcards(flashcard));
	}

	@Then("^Se crea la coleccion$")
	public void se_crea_la_coleccion() throws Throwable {
	    flashcard = Broker.getInstanciaFlashcards().leerFlashcard("flash12345");
	    assert(flashcard!=null);
	}
	
}
