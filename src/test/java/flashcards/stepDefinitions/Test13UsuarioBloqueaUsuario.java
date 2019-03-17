package test.java.flashcards.stepDefinitions;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.RelacionDTO;

public class Test13UsuarioBloqueaUsuario {
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacion dBRelacion;
	RelacionDTO relacion;
	
	@Given("^Usuario quiere bloquear a otro$")
	public void usuario_quiere_bloquear_a_otro() throws Throwable {
		dBUsuario = Broker.getInstanciaUsuario();
		dBRelacion = Broker.getInstanciaRelacion();
	    assert(dBUsuario.login("Sergio123", "sergio1") && dBUsuario.login("sergio1993", "sergio1993"));
	}

	@When("^Bloquea al usuario$")
	public void bloquea_al_usuario() throws Throwable {
	    relacion = dBRelacion.leerRelacionUsuario("sergio1993");
	    relacion.getBloqueados().add("Sergio123");
	    assert(dBRelacion.modificaRelacionUsuario(relacion));
	}

	@Then("^No pueden ser amigos$")
	public void no_pueden_ser_amigos() throws Throwable {
		relacion = dBRelacion.leerRelacionUsuario("Sergio123");
	    relacion.getBloqueadoPor().add("sergio1993");
	    assert(dBRelacion.modificaRelacionUsuario(relacion));
	}
	
}
