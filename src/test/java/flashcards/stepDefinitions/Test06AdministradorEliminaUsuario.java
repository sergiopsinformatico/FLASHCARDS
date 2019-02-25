package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test06AdministradorEliminaUsuario {
	
	UsuarioDTO administrador;
	UsuarioDTO usuario;
	InterfaceDAOUsuario usuariosDB;
	
	@Given("^El administrador va a eliminar un usuario$")
	public void el_administrador_va_a_eliminar_un_usuario() throws Throwable {
	    usuariosDB = Broker.getInstanciaUsuario();
	    administrador = usuariosDB.getUsuarioDTO("sergio1993");
	    assert(administrador.isRolAdministrador());
	}

	@When("^Encuentra al usuario$")
	public void encuentra_al_usuario() throws Throwable {
	    usuario = usuariosDB.getUsuarioDTO("ejemploUsuario");
	    assert(usuariosDB.login(usuario.getUsername(), usuario.getClave()));
	}

	@Then("^Elimina al usuario$")
	public void elimina_al_usuario() throws Throwable {
	    usuariosDB.deleteUsuario(usuario);
	    assert(!(usuariosDB.login(usuario.getUsername(), usuario.getClave())));
	}
	
}
