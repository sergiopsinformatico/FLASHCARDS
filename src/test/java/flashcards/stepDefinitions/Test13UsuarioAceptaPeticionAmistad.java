package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test13UsuarioAceptaPeticionAmistad {
	
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO user;
	InterfaceDAORelacionesUsuarios dBRelaciones;
	List<String> lista;
	int indice;
	boolean encontrado;
	
	@Given("^Un usuario recibe una peticion$")
	public void un_usuario_recibe_una_peticion() throws Throwable {
	    dBRelaciones = Broker.getInstanciaRelaciones();
	    dBUsuario = Broker.getInstanciaUsuario();
	    user = dBUsuario.getUsuarioDTO("usuario456");
	    if(user!=null) {
	    	encontrado = false;
	    	lista = dBRelaciones.getPeticionesRecibidas(user.getUsername());
	    	for(indice=0; indice<lista.size(); indice++) {
	    		if(lista.get(indice).equals("usuario123")) {
	    			encontrado = true;
	    			indice = lista.size();
	    		}
	    	}
	    	assert(encontrado);
	    }else {
	    	assert(false);
	    }	    
	}

	@When("^Acepta la peticion$")
	public void acepta_la_peticion() throws Throwable {
	    assert(dBRelaciones.aceptarInvitacion("usuario456", "usuario123"));
	}

	@Then("^Son amigos$")
	public void son_amigos() throws Throwable {
	    encontrado = false;
	    lista = dBRelaciones.getAmigos("usuario123");
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("usuario456")) {
	    		encontrado = true;
	    		indice = lista.size();
	    	}
	    }
	    if(encontrado) {
	    	encontrado = false;
	    	lista = dBRelaciones.getAmigos("usuario456");
	    	for(indice=0; indice<lista.size(); indice++) {
		    	if(lista.get(indice).equals("usuario123")) {
		    		encontrado = true;
		    		indice = lista.size();
		    	}
		    }
		    assert(encontrado);
	    }else {
	    	assert(false);
	    }
	    
	}
	
}
