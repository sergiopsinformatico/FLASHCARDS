package test.java.flashcards.stepDefinitions;


import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test04UsuarioActualizaPerfil {
	
	UsuarioDTO user, user2;
	InterfaceDAOUsuario dBUsuario;
	
	@Given("^Una persona quiere actualizar su perfil$")
	public void una_persona_quiere_actualizar_su_perfil() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
		user = new UsuarioDTO();
		user.setUsername("Sergio123");
		user.setClave("sergio1");
		user.setEmail("correoInventado@email.com");
		user.setRol("Usuario");
		assert(dBUsuario.login(user.getEmail(), user.getClave()));
	}
	
	@When("^Cambia los datos$")
	public void cambia_los_datos() throws Throwable {
		user2 = new UsuarioDTO();
		user2.setUsername("Sergio123");
		user2.setClave("sergio1");
		user2.setEmail("correoInventado@email.com");
		user2.setRol("Usuario");
		user2.setNombreApellidos("Pepito");
		assert(true);
	}

	@Then("^Se actualiza el perfil correctamente$")
	public void se_actualiza_el_perfil_correctamente() throws Throwable {
	    dBUsuario.updateUsuario(user, user2);
	    user = dBUsuario.getUsuarioDTO(user2.getUsername());
	    assert(user.getNombreApellidos().equals("Pepito"));
	}

}
