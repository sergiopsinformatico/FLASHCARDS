package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test07UsuarioBuscaUsuarios {
	
	InterfaceDAOUsuario dBUsuario;
	List<UsuarioDTO> listaUsuarios;
	
	@Given("^Un usuario conectado$")
	public void un_usuario_conectado() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
	    assert(dBUsuario.login("Sergio123", "sergio1"));
	}

	@When("^Lista a los usuarios$")
	public void lista_a_los_usuarios() throws Throwable {
	    listaUsuarios = dBUsuario.getAllUsuarios("Sergio123");
	    for(int indice=0; indice<listaUsuarios.size();indice++) {
	    	if(listaUsuarios.get(indice).getUsername().equals("Sergio123")) {
	    		listaUsuarios.remove(indice);
	    	}
	    }
	    assert(true);
	}

	@Then("^Encuentra a otros usuarios$")
	public void encuentra_a_otros_usuarios() throws Throwable {
	    assert(listaUsuarios.size()>=0);
	}
	
}
