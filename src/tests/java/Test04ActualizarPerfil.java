package tests.java;
import com.flashcards.brokers.Broker;
import com.flashcards.db.dao.InterfaceDAOUsuario;
import com.flashcards.dto.UsuarioDTO;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;



public class Test04ActualizarPerfil {
	
	UsuarioDTO user, user2;
	Broker broker;
	InterfaceDAOUsuario dBUsuario;
	
	@Given("^Una persona quiere actualizar su perfil$")
	public void una_persona_quiere_actualizar_su_perfil() throws Throwable {
		broker = new Broker();
		dBUsuario = broker.getInstanciaUsuario();
		user = new UsuarioDTO("Sergio123", "sergio1", "sergio13_yo@hotmail.com", true, false, false);
		assert(dBUsuario.login(user.getEmail(), user.getClave()));
	}
	
	@When("^Cambia los datos$")
	public void cambia_los_datos() throws Throwable {
		user2 = new UsuarioDTO("Sergio123", "sergio1", "sergio13_yo@hotmail.com", false, true, false);
		assert(true);
	}

	@Then("^Se actualiza el perfil correctamente$")
	public void se_actualiza_el_perfil_correctamente() throws Throwable {
	    dBUsuario.updateUsuario(user, user2);
	    user = dBUsuario.getUsuarioDTO(user2.getUsername());
	    assert(!user.isRolUsuario() && user.isRolModerador() && !user.isRolAdministrador());
	}

}
