package tests.java;

import com.flashcards.db.gestores.GestionUsuarios;
import com.flashcards.modelo.UsuarioDTO;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Test04ModificarUsuario {
	
	GestionUsuarios gU;
	UsuarioDTO user, user2;
	
	@Given("^Una persona quiere modificar los datos$")
	public void una_persona_quiere_modificar_los_datos() throws Throwable {
	    gU = new GestionUsuarios();
	}

	@When("^Modifica sus datos$")
	public void modifica_sus_datos() throws Throwable {
		user = gU.leerUsuario("sergio123");
		user.setEdad(25);
		assert(gU.modificarUsuario(user));
	}

	@Then("^Se modifican correctamente$")
	public void se_modifican_correctamente() throws Throwable {
		user = gU.leerUsuario("sergio123");
		assert(user.getEdad()==25);
	}
}
