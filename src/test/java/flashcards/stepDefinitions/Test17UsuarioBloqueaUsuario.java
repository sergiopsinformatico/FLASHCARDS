package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test17UsuarioBloqueaUsuario {
	
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO user1;
	UsuarioDTO user2;
	InterfaceDAORelacionesUsuarios dBRelaciones;
	List<String> lista;
	boolean encontrado;
	int indice;
	
	@Given("^Un usuario no quiere que otro usuario sea su amigo$")
	public void un_usuario_no_quiere_que_otro_usuario_sea_su_amigo() throws Throwable {
	    dBUsuario = Broker.getInstanciaUsuario();
	    user1 = dBUsuario.getUsuarioDTO("usuario123");
	    user2 = dBUsuario.getUsuarioDTO("usuario456");
	    assert(user1!=null && user2!=null);
	}

	@When("^Bloquea$")
	public void bloquea() throws Throwable {
	    dBRelaciones = Broker.getInstanciaRelaciones();
	    assert(dBRelaciones.bloquearUsuario("usuario123", "usuario456"));
	}

	@Then("^El usuario bloqueado no ve su perfil$")
	public void el_usuario_bloqueado_no_ver_su_perfil() throws Throwable {
		encontrado = false;
	    lista = dBRelaciones.getBloqueadores("usuario456");
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("usuario123")) {
	    		encontrado = true;
	    		indice= lista.size();
	    	}
	    }
	    if(encontrado) {
	    	encontrado = false;
	    	lista = dBRelaciones.getBloqueados("usuario123");
	    	for(indice=0; indice<lista.size(); indice++) {
		    	if(lista.get(indice).equals("usuario456")) {
		    		encontrado = true;
		    		indice= lista.size();
		    	}
		    }
	    	assert(encontrado);
	    }else {
	    	assert(false);
	    }	    
	}
}
