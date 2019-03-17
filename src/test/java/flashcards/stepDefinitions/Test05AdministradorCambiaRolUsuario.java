package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test05AdministradorCambiaRolUsuario {
	
	UsuarioDTO administrador;
	UsuarioDTO usuario, usuarioNuevo;
	InterfaceDAOUsuario usuariosDB;

	@Given("^Un administrador va a cambiar el rol de un usuario$")
	public void un_administrador_va_a_cambiar_el_rol_de_un_usuario() throws Throwable {
		usuariosDB = Broker.getInstanciaUsuario();
	    administrador = usuariosDB.getUsuarioDTO("sergio1993");
	    assert(administrador.getRol().equals("Administrador"));
	}

	@When("^Localiza al usuario$")
	public void localiza_al_usuario() throws Throwable {
		usuario = new UsuarioDTO("ejemploUsuario", "emailInventado@sfs.co", "clave");
	    usuariosDB.insertUsuario(usuario);
	    assert(usuariosDB.login(usuario.getUsername(), usuario.getClave()));
	}

	@Then("^Cambia el rol de este$")
	public void cambia_el_rol_de_este() throws Throwable {
	    usuario = usuariosDB.getUsuarioDTO("ejemploUsuario");
	    usuarioNuevo = usuariosDB.getUsuarioDTO("ejemploUsuario");
	    usuarioNuevo.setRol("Moderador");
	    usuariosDB.updateUsuario(usuario, usuarioNuevo);
	    usuario = usuariosDB.getUsuarioDTO("ejemploUsuario");
	    assert(usuario.getRol().equals("Moderador"));
	}

}
