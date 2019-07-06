package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test07AdministradorEliminaUsuario {
	
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO admin;
	UsuarioDTO user;
	UsuarioDTO user2;
	
	@Given("^Un administrador quiere eliminar a un usuario$")
	public void un_administrador_quiere_eliminar_a_un_usuario() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
		user = dBUsuario.getUsuarioDTO("usuario4567");
		admin = dBUsuario.getUsuarioDTO("admin");
	    assert(admin.getRol().equals("Administrador") && user!=null); 
	}

	@When("^Encuentra a ese usuario$")
	public void encuentra_a_ese_usuario() throws Throwable {
	    assert(dBUsuario.deleteUsuario(user));
	}

	@Then("^Le elimina del sistema$")
	public void le_elimina_del_sistema() throws Throwable {
		user = dBUsuario.getUsuarioDTO("usuario4567");
		assert(user == null);
	}
	
}
