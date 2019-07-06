package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test06AdministradorCambiaRol {
	
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO admin;
	UsuarioDTO user;
	UsuarioDTO user2;
	
	@Given("^Un administrador quiere cambiar el rol de un usuario$")
	public void un_administrador_quiere_cambiar_el_rol_de_un_usuario() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
		user = new UsuarioDTO("usuario4567", "usuario4567@email.com", "usuario4567");
		user.setRol("Usuario");
		admin = dBUsuario.getUsuarioDTO("admin");
	    assert(admin.getRol().equals("Administrador") && dBUsuario.insertUsuario(user) && user.getRol().equals("Usuario")); 
	}

	@When("^Localiza a ese usuario$")
	public void localiza_a_ese_usuario() throws Throwable {
		user2 = user;
		user2.setRol("Moderador");
	    assert(dBUsuario.updateUsuario(user, user2));
	}

	@Then("^Cambia su rol$")
	public void cambia_su_rol() throws Throwable {
	    user = dBUsuario.getUsuarioDTO("usuario4567");
	    assert(user.getRol().equals("Moderador"));
	}
	
}
