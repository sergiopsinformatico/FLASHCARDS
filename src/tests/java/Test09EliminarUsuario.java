package tests.java;

import com.flashcards.db.gestores.GestionUsuarios;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Test09EliminarUsuario {
	
	GestionUsuarios gU;
	
	@Given("^Una persona conectada$")
	public void una_persona_conectada() throws Throwable {
		gU = new GestionUsuarios();
		assert(gU.login("sergio123", "Sergio123"));
	}

	@When("^Elimina su Cuenta$")
	public void elimina_su_Cuenta() throws Throwable {
	    assert(gU.eliminaCuenta("sergio123"));
	}

	@Then("^La cuenta ya no existe$")
	public void la_cuenta_ya_no_existe() throws Throwable {
	    assert(!gU.existeUsername("sergio123"));
	}
}
