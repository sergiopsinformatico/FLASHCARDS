package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test15UsuarioRechazaPeticionAmistad {
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacionesUsuarios dBRelaciones;
	UsuarioDTO user1;
	UsuarioDTO user2;
	List<String> lista;
	int indice;
	boolean encontrado;
	
	@Given("^Un usuario recibe una peticion de amistad$")
	public void un_usuario_recibe_una_peticion_de_amistad() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
	    user1 = dBUsuario.getUsuarioDTO("usuario123");
	    user2 = dBUsuario.getUsuarioDTO("usuario1");
	    dBRelaciones = Broker.getInstanciaRelaciones();
	    assert(user1!=null && user2!=null && 
	    	   dBRelaciones.enviarPeticionAmistad(user1.getUsername(), user2.getUsername()));
	}

	@When("^Rechaza la peticion$")
	public void rechaza_la_peticion() throws Throwable {
	    lista = dBRelaciones.getPeticionesRecibidas("usuario1");
	    encontrado = false;
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("usuario123")) {
	    		encontrado = true;
	    		indice = lista.size();
	    	}
	    }
	    if(encontrado) {
	    	assert(dBRelaciones.rechazarInvitacion("usuario1", "usuario123"));
	    }else {
	    	assert(false);
	    }
	}

	@Then("^No son amigos$")
	public void no_son_amigos() throws Throwable {
		encontrado = false;
	    lista = dBRelaciones.getAmigos("usuario123");
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("usuario1")) {
	    		indice = lista.size();
	    		encontrado = true;
	    	}
	    }
	    if(encontrado) {
	    	assert(false);
	    }else {
	    	lista = dBRelaciones.getAmigos("usuario1");
	    	for(indice=0; indice<lista.size(); indice++) {
	    		if(lista.get(indice).equals("usuario123")) {
	    			encontrado = true;
	    			indice = lista.size();
	    		}
	    	}
	    	assert(!encontrado);
	    }
	   
	}
}
