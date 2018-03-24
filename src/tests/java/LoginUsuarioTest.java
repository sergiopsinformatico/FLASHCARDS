package tests.java;

import static org.junit.Assert.assertArrayEquals;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class LoginUsuarioTest {
	Usuario user;
	GestionUsuarios gU;
	String usuario, clave;
	
	//Login Correcto
	
	@Given("^Una persona quiere loguearse$")
	public void una_persona_quiere_loguearse() throws Throwable {
		gU = new GestionUsuarios();
		assert(true);
	}

	@When("^Escribe sus credenciales$")
	public void escribe_sus_credenciales() throws Throwable {
		usuario="sergio123";
		clave="Sergio123";
		assert(true);
	}

	@Then("^Entra al sistema$")
	public void entra_al_sistema() throws Throwable {
		assert(gU.login(usuario, clave));
	}

	//El nombre de usuario no existe
	
	@Given("^Una persona va a loguearse$")
	public void una_persona_va_a_loguearse() throws Throwable {
		gU = new GestionUsuarios();
		assert(true);
	}

	@When("^Introduce sus credenciales$")
	public void introduce_sus_credenciales() throws Throwable {
		usuario="sergio@123.es";
		clave="Sergio123";
		assert(true);
	}

	@Then("^El email o usuario no existe$")
	public void el_email_o_usuario_no_existe() throws Throwable {
		assert(!gU.login(usuario, clave));
	}

	//La clave no coincide
	
	@Given("^Una persona va a entrar al sistema$")
	public void una_persona_va_a_entrar_al_sistema() throws Throwable {
		gU = new GestionUsuarios();
		assert(true);
	}

	@When("^Escribe las credenciales$")
	public void escribe_las_credenciales() throws Throwable {
		usuario="sergio13_yo@hotmail.com";
		clave="Aergio123";
		assert(true);
	}

	@Then("^La clave no coincide$")
	public void la_clave_no_coincide() throws Throwable {
		assert(!gU.login(usuario, clave));
	}
}