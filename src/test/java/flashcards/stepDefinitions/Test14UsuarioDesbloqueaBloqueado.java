package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.RelacionDTO;

public class Test14UsuarioDesbloqueaBloqueado {
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacion dBRelacion;
	RelacionDTO relacion;
	List<String> lista;
	int indice;
	boolean desb1;
	boolean desb2;
	
	@Given("^Un usuario tiene bloqueado a otro$")
	public void un_usuario_tiene_bloqueado_a_otro() throws Throwable {
		desb1=false;
		desb2=false;
		dBUsuario = Broker.getInstanciaUsuario();
		dBRelacion = Broker.getInstanciaRelacion();
	    assert(dBUsuario.login("Sergio123", "sergio1") && dBUsuario.login("sergio1993", "sergio1993"));
	}

	@When("^Quiere desbloquearlo$")
	public void quiere_desbloquearlo() throws Throwable {
		relacion = dBRelacion.readRelacionUsuario("sergio1993");
	    lista = relacion.getBloqueados();
	    
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("Sergio123")) {
	    		lista.remove(indice);
	    		desb1 = true;
	    		break;
	    	}
	    }
	    
	    assert(dBRelacion.updateRelacionUsuario(relacion));
	}

	@Then("^Desbloquea al usuario$")
	public void desbloquea_al_usuario() throws Throwable {
		relacion = dBRelacion.readRelacionUsuario("Sergio123");
	    lista = relacion.getBloqueadoPor();
	    
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("sergio1993")) {
	    		lista.remove(indice);
	    		desb2 = true;
	    		break;
	    	}
	    }
	    
	    dBRelacion.updateRelacionUsuario(relacion);
	    assert(desb1 && desb2);
	}
	
}
