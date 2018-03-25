package tests.java;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class ModificarUsuarioTest {
	
	GestionUsuarios gU;
	Usuario user, user2;
	
	@Given("^Una persona logueada$")
	public void una_persona_logueada() throws Throwable {
		gU = new GestionUsuarios();
	    assert(gU.login("sergio13_yo@hotmail.com", "Sergio123"));
	}

	@When("^Modifica sus datos$")
	public void modifica_sus_datos() throws Throwable {
		user = new Usuario("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio", "Perez Sanchez", 24, "Toledo", "España", "Hombre", true, false, false);
		user.setEdad(25);
		assert(true);
	}

	@Then("^Se guardan correctamente$")
	public void se_guardan_correctamente() throws Throwable {
	    gU.modificarUsuario(user);
	    user2=gU.leerUsuario("sergio13_yo@hotmail.com");
	    assert(user2.getEdad()==25);
	}
}
