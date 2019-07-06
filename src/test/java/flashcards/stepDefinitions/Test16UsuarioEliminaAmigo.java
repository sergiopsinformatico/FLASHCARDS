package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

public class Test16UsuarioEliminaAmigo {
	
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO user1;
	UsuarioDTO user2;
	InterfaceDAORelacionesUsuarios dBRelaciones;
	boolean encontrado;
	List<String> lista;
	int indice;
	
	@Given("^Un usuario no quiere tener a un usuario de amigo$")
	public void un_usuario_no_quiere_tener_a_un_usuario_de_amigo() throws Throwable {
	    dBUsuario = Broker.getInstanciaUsuario();
	    user1 = dBUsuario.getUsuarioDTO("usuario123");
	    user2 = dBUsuario.getUsuarioDTO("usuario456");
	    dBRelaciones = Broker.getInstanciaRelaciones();
	    assert(user1!=null && user2!=null);
	}

	@When("^Elimina al amigo$")
	public void elimina_al_amigo() throws Throwable {
	    assert(dBRelaciones.eliminarAmigo("usuario123", "usuario456"));
	}

	@Then("^Ya no son amigos$")
	public void ya_no_son_amigos() throws Throwable {
	    lista = dBRelaciones.getAmigos("usuario123");
	    encontrado = false;
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("usuario456")) {
	    		encontrado = true;
	    		indice = lista.size();
	    	}
	    }
	    if(encontrado) {
	    	assert(false);
	    }else {
	    	lista = dBRelaciones.getAmigos("usuario456");
		    encontrado = false;
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
