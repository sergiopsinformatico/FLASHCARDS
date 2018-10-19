package tests.java;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Test01CrearCuenta {
	
	Usuario user;
	GestionUsuarios gU;
	
	//Scenario 1: Registrar un usuario exitosamente
	
	@Given("^Una persona quiere registrarse$")
	public void una_persona_quiere_registrarse() throws Throwable {
		user = new Usuario("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		assert(true);
		
	}

	@When("^Introduce los datos$")
	public void introduce_los_datos() throws Throwable {
		gU = new GestionUsuarios();
	    assert(true);
	}

	@Then("^Se registra correctamente$")
	public void se_registra_correctamente() throws Throwable {
	    assert(gU.registrarUsuario(user));
	}

	
	//Scenario 2: Existe email
	
	@Given("^Una persona desea registrarse$")
	public void una_persona_desea_registrarse() throws Throwable {
		user = new Usuario("sergio123", "Sergio123", "", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU = new GestionUsuarios();
		assert(true);
	}

	@When("^Introduce un email existente$")
	public void introduce_un_email_existente() throws Throwable {
		user.setEmail("sergio13_yo@hotmail.com");
		assert(true);
	}

	@Then("^No puede registrarse$")
	public void no_puede_registrarse() throws Throwable {
		assert(!gU.registrarUsuario(user));
	}

	
	//Scenario 3: Existe nombre de usuario
	
	@Given("^Una persona va a registrarse$")
	public void una_persona_va_a_registrarse() throws Throwable {
		user = new Usuario("", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU = new GestionUsuarios();
		assert(true);
	}

	@When("^Introduce un nombre de usuario existente$")
	public void introduce_un_nombre_de_usuario_existente() throws Throwable {
		user.setUsuario("sergio123");
		assert(true);
	}

	@Then("^La cuenta no se crea$")
	public void la_cuenta_no_se_crea() throws Throwable {
		assert(!gU.registrarUsuario(user));
	}

	
	//Scenario 4: La password no cumple con los requisitos
	
	@Given("^Un usuario quiere registrarse$")
	public void un_usuario_quiere_registrarse() throws Throwable {
		user = new Usuario("sergio123", "", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU = new GestionUsuarios();
		assert(true);
	}

	@When("^La clave no cumple los requisitos$")
	public void la_clave_no_cumple_los_requisitos() throws Throwable {
		user.setClave("sergio123");
		assert(true);
	}

	@Then("^No se crea la cuenta$")
	public void no_se_crea_la_cuenta() throws Throwable {
		assert(!gU.registrarUsuario(user));
	}
}
