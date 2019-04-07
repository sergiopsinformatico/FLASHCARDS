package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.dto.RelacionDTO;

public class Test11UsuarioRechazaPeticionAmistad {
	
	InterfaceDAORelacion dBRelacion;
	RelacionDTO relacion;
	List<String> lista;
	int indice;
	boolean am1;
	boolean am2;
	
	@Given("^Un usuario recibe peticiones de amistad$")
	public void un_usuario_recibe_peticiones_de_amistad() throws Throwable {
	    dBRelacion = Broker.getInstanciaRelacion();
	    am1 = true;
	    am2 = true;
	    
	    relacion = dBRelacion.readRelacionUsuario("Sergio123");
	    relacion.getPeticionesEnviadas().add("sergio1993");
	    dBRelacion.updateRelacionUsuario(relacion);
	    
	    relacion = dBRelacion.readRelacionUsuario("sergio1993");
	    relacion.getPeticionesRecibidas().add("Sergio123");
	    dBRelacion.updateRelacionUsuario(relacion);
	    
	    assert(true);
	    
	}

	@When("^Rechaza la peticion$")
	public void no_quiere_conectar() throws Throwable {
		relacion = dBRelacion.readRelacionUsuario("Sergio123");
	    lista = relacion.getPeticionesEnviadas();
	    if(lista.size()==0) { assert(false);}
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("sergio1993")) {
	    		lista.remove(indice);
	    		break;
	    	}
	    }
	    dBRelacion.updateRelacionUsuario(relacion);
	    
	    relacion = dBRelacion.readRelacionUsuario("sergio1993");
	    lista = relacion.getPeticionesRecibidas();
	    if(lista.size()==0) { assert(false);}
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("Sergio123")) {
	    		lista.remove(indice);
	    		break;
	    	}
	    }
	    dBRelacion.updateRelacionUsuario(relacion);
	    
	    assert(true);
	}

	@Then("^No son amigos$")
	public void rechaza_la_peticion() throws Throwable {
	    
		relacion = dBRelacion.readRelacionUsuario("Sergio123");
	    lista = relacion.getAmigos();
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("sergio1993")) {
	    		am1 = false;
	    		break;
	    	}
	    }
	    
	    relacion = dBRelacion.readRelacionUsuario("sergio1993");
	    lista = relacion.getAmigos();
	    for(indice=0; indice<lista.size(); indice++) {
	    	if(lista.get(indice).equals("Sergio123")) {
	    		am2 = false;
	    		break;
	    	}
	    }
		
		assert(am1 && am2);
		
	}
	
}