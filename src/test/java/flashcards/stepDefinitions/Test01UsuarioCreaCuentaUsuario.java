package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test01UsuarioCreaCuentaUsuario {
	
	UsuarioDTO user;
	InterfaceDAOUsuario dBUsuario;
	boolean condicion;
	
	@Given("^Una persona quiere registrarse$")
	public void una_persona_quiere_registrarse() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
		user = new UsuarioDTO();
		user.setUsername("Sergio123");
		user.setClave("sergio1");
		user.setEmail("correoInventado@email.com");
		user.setRolUsuario(true);
		user.setRolModerador(false);
		user.setRolAdministrador(false);
	    assert(true);
	}

	@When("^Introduce los datos correctamente$")
	public void introduce_los_datos_correctamente() throws Throwable {
		assert((!dBUsuario.existEmail(user.getEmail())) &&
		    	   (!dBUsuario.existUsername(user.getUsername())) &&
		    	   dBUsuario.claveIsCorrect(user.getClave()) &&
		    	   dBUsuario.usernameIsCorrect(user.getUsername()));
	}

	@Then("^Se registra correctamente$")
	public void se_registra_correctamente() throws Throwable {
		assert(dBUsuario.insertUsuario(user) && dBUsuario.existEmail(user.getEmail()));
	}

	@When("^Introduce un username existente$")
	public void introduce_un_username_existente() throws Throwable {
		user.setUsername(user.getUsername());
	    assert(dBUsuario.existUsername(user.getUsername()));
	}

	@Then("^No se registra$")
	public void no_se_registra() throws Throwable {
		assert(!dBUsuario.insertUsuario(user));
	}

	@When("^El username contiene un caracter invalido$")
	public void el_username_contiene_un_caracter_invalido() throws Throwable {
		user.setUsername("sergio 123");
	    assert(!dBUsuario.usernameIsCorrect(user.getUsername()));
	}

	@When("^La longitud del username es incorrecta$")
	public void la_longitud_del_username_es_incorrecta() throws Throwable {
		user.setUsername("se");
	    assert(!dBUsuario.usernameIsCorrect(user.getUsername()));
	}

	@When("^La clave contiene un caracter invalido$")
	public void la_clave_contiene_un_caracter_invalido() throws Throwable {
		user.setClave("Sergio 123");
		assert(!dBUsuario.claveIsCorrect(user.getClave()));
	}

	@When("^La longitud de la clave es incorrecta$")
	public void la_longitud_de_la_clave_es_incorrecta() throws Throwable {
		user.setClave("Sergio2145123456300047899625");
		assert(!dBUsuario.claveIsCorrect(user.getClave()));
	}

	@When("^Introduce un email existente$")
	public void introduce_un_email_existente() throws Throwable {
		user.setEmail(user.getEmail());
		assert(dBUsuario.existEmail(user.getEmail()));
	}
}
