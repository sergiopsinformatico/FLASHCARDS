package test.java.flashcards.stepDefinitions;

import java.util.LinkedList;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.RelacionDTO;

public class Test09UsuarioRecibePeticionAmistad {
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacion dBRelacion;
	RelacionDTO relacion;
	boolean encontrado;
	LinkedList<String> recibidas;
	int indice;
	
	@Given("^Un usuario conectado a la aplicacion$")
	public void un_usuario_conectado_a_la_aplicacion() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
	    assert(dBUsuario.login("sergio1995", "sergio1995"));
	}

	@When("^Consulta las peticiones recibidas$")
	public void consulta_las_peticiones_recibidas() throws Throwable {
		dBRelacion = Broker.getInstanciaRelacion();
		relacion = dBRelacion.leerRelacionUsuario("sergio1995");
		assert(true);
	}

	@Then("^Lista las peticiones$")
	public void lista_las_peticiones() throws Throwable {
		encontrado = false;
		recibidas = relacion.getPeticionesRecibidas();
		for(indice=0; indice<recibidas.size(); indice++) {
			if(recibidas.get(indice).equals("Sergio123")) {
				encontrado = true;
				break;
			}
		}
	    assert(encontrado);
	}
	
}
