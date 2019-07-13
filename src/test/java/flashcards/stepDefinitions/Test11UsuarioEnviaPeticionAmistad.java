package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test11UsuarioEnviaPeticionAmistad {
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacionesUsuarios dBRelaciones;
	UsuarioDTO user1;
	UsuarioDTO user2;
	List<String> lista;
	boolean encontrado;
	int indice;
	
	@Given("^Un usuario conoce a otro$")
	public void un_usuario_conoce_a_otro() throws Throwable {
	    dBUsuario = Broker.getInstanciaUsuario();
	    user1 = dBUsuario.getUsuarioDTO("usuario123");
	    user2 = dBUsuario.getUsuarioDTO("usuario456");
	    assert(user1!=null && user2!=null);
	}

	@When("^Envia una peticion de amistad$")
	public void envia_una_peticion_de_amistad() throws Throwable {
	    dBRelaciones = Broker.getInstanciaRelaciones();
	    assert(dBRelaciones.enviarPeticionAmistad(user1.getUsername(), user2.getUsername()));
	}

	@Then("^El otro usuario recibe una peticion de amistad$")
	public void el_otro_usuario_recibe_una_peticion_de_amistad() throws Throwable {
		encontrado = false;
	    lista = dBRelaciones.getPeticionesRecibidas(user2.getUsername());
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals(user1.getUsername())) {
	    		encontrado = true;
	    		indice = lista.size();
	    	}
	    }
	    assert(encontrado);
	}
	
}
