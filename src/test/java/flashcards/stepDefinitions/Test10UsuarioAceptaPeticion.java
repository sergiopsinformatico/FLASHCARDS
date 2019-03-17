package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.RelacionDTO;

public class Test10UsuarioAceptaPeticion {
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacion dBRelacion;
	RelacionDTO relacion;
	boolean encontrado;
	boolean am1;
	boolean am2;
	List<String> lista;
	int indice;
	
	@Given("^Un usuario tiene una peticion de amistad$")
	public void un_usuario_tiene_una_peticion_de_amistad() throws Throwable {
		am1 = false;
	    am2 = false;
		dBUsuario = Broker.getInstanciaUsuario();
		dBRelacion = Broker.getInstanciaRelacion();
		relacion = dBRelacion.leerRelacionUsuario("sergio1995");
	    assert(dBUsuario.login("sergio1995", "sergio1995") && relacion.getPeticionesRecibidas().size()>=1);
	}

	@When("^Acepta la peticion$")
	public void acepta_la_peticion() throws Throwable {
		lista = relacion.getPeticionesRecibidas();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals("Sergio123")) {
				lista.remove(indice);
				break;
			}
		}
		relacion.getAmigos().add("Sergio123");
		dBRelacion.modificaRelacionUsuario(relacion);
		
		relacion = dBRelacion.leerRelacionUsuario("Sergio123");
	    relacion.getAmigos().add("sergio1995");
	    dBRelacion.modificaRelacionUsuario(relacion);
	    
	    assert(true);
	}

	@Then("^Son amigos$")
	public void son_amigos() throws Throwable {
		
		relacion = dBRelacion.leerRelacionUsuario("sergio1995");
		for(indice=0; indice<relacion.getAmigos().size(); indice++) {
			if(relacion.getAmigos().get(indice).equals("Sergio123")) {
				am1 = true;
				break;
			}
		}
		
		relacion = dBRelacion.leerRelacionUsuario("Sergio123");
		for(indice=0; indice<relacion.getAmigos().size(); indice++) {
			if(relacion.getAmigos().get(indice).equals("sergio1995")) {
				am2 = true;
				break;
			}
		}
		
	    assert (am1 && am2);
	}
	
}
