package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.dto.RelacionDTO;

public class Test12UsuarioEliminaAmigo {
	
	InterfaceDAORelacion dBRelacion;
	RelacionDTO relacion;
	int indice;
	boolean encontrado;
	boolean am1;
	boolean am2;
	
	@Given("^Un usuario tiene un amigo$")
	public void un_usuario_tiene_un_amigo() throws Throwable {
		encontrado = false;
		dBRelacion = Broker.getInstanciaRelacion();
		relacion = dBRelacion.leerRelacionUsuario("Sergio123");
		for(indice=0; indice<relacion.getAmigos().size(); indice++) {
			if(relacion.getAmigos().get(indice).equals("sergio1995")) {
				encontrado = true;
				break;
			}
		}
		
	    assert (encontrado);
	}

	@When("^No quiere conectar mas$")
	public void no_quiere_conectar_mas() throws Throwable {
		relacion = dBRelacion.leerRelacionUsuario("Sergio123");
		for(indice=0; indice<relacion.getAmigos().size(); indice++) {
			if(relacion.getAmigos().get(indice).equals("sergio1995")) {
				relacion.getAmigos().remove(indice);
				break;
			}
		}
		dBRelacion.modificaRelacionUsuario(relacion);
		
		relacion = dBRelacion.leerRelacionUsuario("sergio1995");
		for(indice=0; indice<relacion.getAmigos().size(); indice++) {
			if(relacion.getAmigos().get(indice).equals("Sergio123")) {
				relacion.getAmigos().remove(indice);
				break;
			}
		}
		dBRelacion.modificaRelacionUsuario(relacion);
		
		assert (true);
	}

	@Then("^Elimina amigo$")
	public void elimina_amigo() throws Throwable {
	    am1 = true;
	    am2 = true;
	    
	    relacion = dBRelacion.leerRelacionUsuario("Sergio123");
		for(indice=0; indice<relacion.getAmigos().size(); indice++) {
			if(relacion.getAmigos().get(indice).equals("sergio1995")) {
				am1 = false;
				break;
			}
		}
		relacion = dBRelacion.leerRelacionUsuario("sergio1995");
		for(indice=0; indice<relacion.getAmigos().size(); indice++) {
			if(relacion.getAmigos().get(indice).equals("Sergio123")) {
				am2 = false;
				break;
			}
		}
	    
	    assert(am1 && am2);
	}
	
}
