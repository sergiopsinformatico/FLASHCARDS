package tests.java;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.UsuarioDTO;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class AdministradorTest {
	
	GestionUsuarios gU;
	UsuarioDTO user;
	
	//Cambio de Rol
	
	@Given("^El administrador logueado$")
	public void el_administrador_logueado() throws Throwable {
	    gU = new GestionUsuarios();
	    user = new UsuarioDTO("pepeAdmin", "Admin1234", "email@email.com", "Pepe Admin", 25, "Ciudad Real", "España", "Hombre", "resources/img/profileHombre.jpg", false, false, true);
	    gU.registrarUsuario(user);
	    assert(gU.login(user.getUsuario(), user.getClave()));
	}

	@When("^Cambia de rol a un usuario$")
	public void cambia_de_rol_a_un_usuario() throws Throwable {
		user = new UsuarioDTO("Saergio123", "Sergio123", "sergio123_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU.registrarUsuario(user);
		user.setAdministrador(true);
		user.setModerador(true);
		user.setUsuario(false);
		assert(gU.modificarUsuario(user));
	}

	@Then("^Obtiene ese usuario un nuevo rol$")
	public void obtiene_ese_usuario_un_nuevo_rol() throws Throwable {
	    user = gU.leerUsuario("Saergio123");
	    assert(user.isAdministrador());
	}
	
	//Eliminar a un Usuario
	
	@Given("^El administrador conectado$")
	public void el_administrador_conectado() throws Throwable {
		gU = new GestionUsuarios();
	    user = new UsuarioDTO("pepeAdmin", "Admin1234", "email@email.com", "Pepe Admin", 25, "Ciudad Real", "España", "Hombre", "resources/img/profileHombre.jpg", false, false, true);
	    assert(gU.login(user.getUsuario(), user.getClave()));
	}

	@When("^Elimina a un usuario$")
	public void elimina_a_un_usuario() throws Throwable {
	    assert(gU.eliminaCuenta("Saergio123"));
	}

	@Then("^El usuario se elimina$")
	public void el_usuario_se_elimina() throws Throwable {
		gU.eliminaCuenta("pepeAdmin");
	    assert(!gU.existeUsername("Saergio123")&&!gU.existeUsername("pepeAdmin"));
	}
}
