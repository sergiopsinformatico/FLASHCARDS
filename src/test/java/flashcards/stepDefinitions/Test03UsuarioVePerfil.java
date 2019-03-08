package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test03UsuarioVePerfil {
	
	UsuarioDTO user, user2;
	InterfaceDAOUsuario dBUsuario;
	
	@Given("^Una persona quiere ver su perfil$")
	public void una_persona_quiere_ver_su_perfil() throws Throwable {
	    dBUsuario = Broker.getInstanciaUsuario();
	    user = new UsuarioDTO();
		user.setUsername("Sergio123");
		user.setClave("sergio1");
		user.setEmail("correoInventado@email.com");
		user.setRol("Usuario");
	    assert(true);
	}
	
	@When("^Se ha logueado con el username$")
	public void se_loguea_con_el_username() throws Throwable {
	    assert(dBUsuario.login(user.getUsername(), user.getClave()));
	}
	
	@Then("^Ve el perfil con el username$")
	public void ve_el_perfil_con_el_username() throws Throwable {
	    user2 = dBUsuario.getUsuarioDTO(user.getUsername());
	    assert(user2.getClave().equals(user.getClave()));
	}

	@When("^Se ha logueado con el email$")
	public void se_loguea_con_el_email() throws Throwable {
		assert(dBUsuario.login(user.getEmail(), user.getClave()));
	}
	
	@Then("^Ve el perfil con el email$")
	public void ve_el_perfil_con_el_email() throws Throwable {
		user2 = dBUsuario.getUsuarioDTO(user.getEmail());
	    assert(user2.getClave().equals(user.getClave()));
	}
}