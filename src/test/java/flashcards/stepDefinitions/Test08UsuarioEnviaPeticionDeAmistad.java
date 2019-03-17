package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.RelacionDTO;

public class Test08UsuarioEnviaPeticionDeAmistad {
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacion dBRelacion;
	RelacionDTO relacion;
	boolean encontrado;
	List<RelacionDTO> lista;
	
	@Given("^Un usuario encuentra un usuario$")
	public void un_usuario_encuentra_un_usuario() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
	    assert(dBUsuario.login("Sergio123", "sergio1") && dBUsuario.login("sergio1995", "sergio1995"));
	}

	@When("^Envia una peticion de amistad$")
	public void envia_una_peticion_de_amistad() throws Throwable {
	    dBRelacion = Broker.getInstanciaRelacion();
	    dBRelacion.insertarRelacionUsuario(new RelacionDTO("Sergio123"));
	    relacion = dBRelacion.leerRelacionUsuario("Sergio123");
	    relacion.getPeticionesEnviadas().add("sergio1995");
	    assert(dBRelacion.modificaRelacionUsuario(relacion));
	}

	@Then("^Otro usuario recibe esa invitacion$")
	public void otro_usuario_recibe_esa_invitacion() throws Throwable {
		relacion = dBRelacion.leerRelacionUsuario("sergio1995");
	    relacion.getPeticionesRecibidas().add("Sergio123");
	    assert(dBRelacion.modificaRelacionUsuario(relacion));
	}
	
}
