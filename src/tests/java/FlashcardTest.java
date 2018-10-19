package tests.java;

import com.flashcards.dao.GestionFlashcards;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Flashcard;
import com.flashcards.modelo.Usuario;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class FlashcardTest {
	
	Usuario user;
	GestionUsuarios gU;
	Flashcard fl;
	GestionFlashcards gF;
	
	@Given("^Una usuario logueado$")
	public void una_usuario_logueado() throws Throwable {
	    gU = new GestionUsuarios();
	    user = new Usuario("user", "clave", "email", "nombre", 35, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
	    assert(gU.login(user.getUsuario(), user.getClave()));
	}

	@When("^No existe una coleccion$")
	public void no_existe_una_coleccion() throws Throwable {
	    gF=new GestionFlashcards();
	    fl = new Flashcard();
	    fl.setIdentificador("id5");
	    assert(!(gF.existeIdentificador(fl.getIdentificador())));
	}

	@Then("^Crea la coleccion$")
	public void crea_la_coleccion() throws Throwable {
	    gF.insertarFlashcard(fl);
	    assert(gF.existeIdentificador(fl.getIdentificador()));
	}
	
}