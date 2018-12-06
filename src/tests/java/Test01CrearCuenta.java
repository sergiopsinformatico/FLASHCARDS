package tests.java;

import com.flashcards.db.gestores.GestorUsuarios;
import com.flashcards.dto.UsuarioDTO;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Test01CrearCuenta {
	
	UsuarioDTO user;
	GestorUsuarios gU;
		
	@Given("^Una persona quiere registrarse$")
	public void una_persona_quiere_registrarse() throws Throwable {
		user = new UsuarioDTO("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU = new GestorUsuarios();
		assert(true);
		
	}
	
	@When("^Introduce los datos correctamente$")
	public void introduce_los_datos_correctamente() throws Throwable {
		user.setNombreUsuario("sergio123");
	    assert(true);
	}

	@Then("^Se registra correctamente$")
	public void se_registra_correctamente() throws Throwable {
	    assert(gU.registrarUsuario(user));
	}
	
	@When("^Introduce un nombre de usuario no valido$")
	public void introduce_un_nombre_de_usuario_no_valido() throws Throwable {
	    user.setNombreUsuario(" ");
	    assert(true);
	}
	
	@When("^Introduce un nombre de usuario existente$")
	public void introduce_un_nombre_de_usuario_existente() throws Throwable {
		user.setNombreUsuario("sergio123");
		assert(true);
	}
	
	@When("^Introduce un email existente$")
	public void introduce_un_email_existente() throws Throwable {
		user.setNombreUsuario("a");
		user.setEmail("sergio13_yo@hotmail.com");
		assert(true);
	}
	
	@Then("^No se registra$")
	public void no_se_registra() throws Throwable {
	    if((!user.cumpleNombreUsuario())||
	        gU.existeUsername(user.getNombreUsuario())||
	        gU.existeEmail(user.getEmail())) {
	    	assert(true);
	    }else {
	    	assert(false);
	    }
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	


	@Then("^No puede registrarse$")
	public void no_puede_registrarse() throws Throwable {
		assert(!gU.registrarUsuario(user));
	}
	
	@Given("^Una persona va a registrarse$")
	public void una_persona_va_a_registrarse() throws Throwable {
		user = new UsuarioDTO("", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU = new GestorUsuarios();
		assert(true);
	}

	

	@Then("^La cuenta no se crea$")
	public void la_cuenta_no_se_crea() throws Throwable {
		assert(!gU.registrarUsuario(user));
	}
	
	@Given("^Un usuario quiere registrarse$")
	public void un_usuario_quiere_registrarse() throws Throwable {
		user = new UsuarioDTO("sergio123", "", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU = new GestorUsuarios();
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
