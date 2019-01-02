package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test02LoginUsuario {
	
	UsuarioDTO user;
	InterfaceDAOUsuario dBUsuario;
	boolean loguea;
	
	@Given("^Una persona quiere loguearse$")
	public void una_persona_quiere_loguearse() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
		user = new UsuarioDTO();
		user.setUsername("Sergio123");
		user.setClave("sergio1");
		user.setEmail("sergio13_yo@hotmail.com");
		user.setRolUsuario(true);
		user.setRolModerador(false);
		user.setRolAdministrador(false);
	    assert(true);
	}

	@When("^Se loguea con el email$")
	public void se_loguea_con_el_email() throws Throwable {
	    loguea = dBUsuario.login(user.getEmail(), user.getClave());
	    assert(true);
	}

	@Then("^Se loguea correctamente$")
	public void se_loguea_correctamente() throws Throwable {
	    assert(loguea);
	}

	@When("^Se loguea con el username$")
	public void se_loguea_con_el_username() throws Throwable {
		loguea = dBUsuario.login(user.getUsername(), user.getClave());
	    assert(true);
	}

	@When("^El email es erroneo$")
	public void el_email_es_erroneo() throws Throwable {
		user.setEmail("hola");
		loguea = dBUsuario.login(user.getEmail(), user.getClave());
	    assert(true);
	}

	@Then("^No se puede loguear$")
	public void no_se_puede_loguear() throws Throwable {
		assert(!loguea);
	}

	@When("^El username es erroneo$")
	public void el_username_es_erroneo() throws Throwable {
		user.setUsername("--hola--");
		loguea = dBUsuario.login(user.getUsername(), user.getClave());
	    assert(true);
	}

	@When("^La clave es erronea$")
	public void la_clave_es_erronea() throws Throwable {
		user.setClave("--hola--");
		loguea = dBUsuario.login(user.getEmail(), user.getClave());
	    assert(true);
	}
	
}
