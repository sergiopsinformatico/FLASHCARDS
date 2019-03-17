
package test.java.flashcards.stepDefinitions;


import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test15UsuarioEliminaPerfil {
	
	UsuarioDTO user;
	InterfaceDAOUsuario dBUsuario;
	
	@Given("^Una persona quiere eliminar su perfil$")
	public void una_persona_quiere_eliminar_su_perfil() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
		user = new UsuarioDTO("Sergio123", "correoInventado@email.com", "sergio1");
		user.setRol("Usuario");
		user.setNombreApellidos("Pepito");
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
