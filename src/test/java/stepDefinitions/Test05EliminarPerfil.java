package test.java.stepDefinitions;
import com.flashcards.brokers.Broker;
import com.flashcards.db.dao.InterfaceDAOUsuario;
import com.flashcards.dto.UsuarioDTO;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class Test05EliminarPerfil {
	
	UsuarioDTO user;
	Broker broker;
	InterfaceDAOUsuario dBUsuario;
	
	@Given("^Una persona quiere eliminar su perfil$")
	public void una_persona_quiere_eliminar_su_perfil() throws Throwable {
		broker = new Broker();
		dBUsuario = broker.getInstanciaUsuario();
		user = new UsuarioDTO("Sergio123", "sergio1", "sergio13_yo@hotmail.com", true, false, false);
		assert(dBUsuario.login(user.getEmail(), user.getClave()));
	}

	@When("^Da a eliminar$")
	public void da_a_eliminar() throws Throwable {
	    assert(dBUsuario.deleteUsuario(user));
	}

	@Then("^Elimina su perfil$")
	public void elimina_su_perfil() throws Throwable {
	    assert(!dBUsuario.existEmail(user.getEmail()) && !dBUsuario.existUsername(user.getUsername()));
	}
}
