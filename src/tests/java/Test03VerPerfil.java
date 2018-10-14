package tests.java;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Test03VerPerfil {
	
	GestionUsuarios gU;
	Usuario user;
	String email, usuario, clave;
	
	//Ver Perfil de Usuario con Nombre de Usuario
	@Given("^Un usuario logueado con su nombre de usuario$")
	public void un_usuario_logueado_con_su_nombre_de_usuario() throws Throwable {
	    gU = new GestionUsuarios();
	    usuario = "sergio123";
	    clave = "Sergio123";
	    assert(true);
	}

	@When("^Va al perfil$")
	public void va_al_perfil() throws Throwable {
		assert(gU.login(usuario, clave));
	}

	@Then("^Ve sus datos$")
	public void ve_sus_datos() throws Throwable {
	    user = gU.leerUsuario(usuario);
	    if(user != null) {
	    	assert(true);
	    }else {
	    	assert(false);
	    }
	}

	@Given("^Un usuario logueado con su email$")
	public void un_usuario_logueado_con_su_email() throws Throwable {
		gU = new GestionUsuarios();
	    email = "sergio13_yo@hotmail.com";
	    clave = "Sergio123";
	    assert(true);
	}

	@When("^Se dirige al perfil$")
	public void se_dirige_al_perfil() throws Throwable {
		assert(gU.login(email, clave));
	}

	@Then("^Ve sus datos en el perfil$")
	public void ve_sus_datos_en_el_perfil() throws Throwable {
		user = gU.leerUsuario(email);
	    if(user != null) {
	    	assert(true);
	    }else {
	    	assert(false);
	    }
	}
	
}
