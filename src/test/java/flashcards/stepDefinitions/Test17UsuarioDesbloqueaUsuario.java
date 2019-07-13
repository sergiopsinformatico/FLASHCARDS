package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test17UsuarioDesbloqueaUsuario {
	
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO user1;
	UsuarioDTO user2;
	InterfaceDAORelacionesUsuarios dBRelaciones;
	boolean encontrado;
	int indice;
	List<String> lista;
	
	@Given("^Un usuario quiere desbloquear a uno bloqueado$")
	public void un_usuario_quiere_desbloquear_a_uno_bloqueado() throws Throwable {
	    dBUsuario = Broker.getInstanciaUsuario();
	    user1 = dBUsuario.getUsuarioDTO("usuario123");
	    user2 = dBUsuario.getUsuarioDTO("usuario456");
	    assert(user1!=null && user2!=null);
	}

	@When("^Lo desbloquea$")
	public void lo_desbloquea() throws Throwable {
	    dBRelaciones = Broker.getInstanciaRelaciones();
		assert(dBRelaciones.desbloquearUsuario("usuario123", "usuario456"));
	}

	@Then("^El usuario queda desbloqueado$")
	public void el_usuario_queda_desbloqueado() throws Throwable {
		encontrado = false;
	    lista = dBRelaciones.getBloqueadores("usuario456");
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("usuario123")) {
	    		encontrado = true;
	    		indice= lista.size();
	    	}
	    }
	    if(!encontrado) {
	    	encontrado = false;
	    	lista = dBRelaciones.getBloqueados("usuario123");
	    	for(indice=0; indice<lista.size(); indice++) {
		    	if(lista.get(indice).equals("usuario456")) {
		    		encontrado = true;
		    		indice= lista.size();
		    	}
		    }
	    	assert(!encontrado);
	    }else {
	    	assert(false);
	    }	    
	}
}
