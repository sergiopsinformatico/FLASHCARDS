package test.java.flashcards.stepDefinitions;

import java.util.LinkedList;
import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.ClubDTO;

public class Test07UsuarioCreaClub {
	
	ClubDTO club;
	Fecha fecha;
	List<String> miembros;
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAOClub dBClub;
	
	@Given("^Un usuario no encuentra club$")
	public void un_usuario_no_encuentra_club() throws Throwable {
		
		dBUsuario = Broker.getInstanciaUsuario();
	    dBClub = Broker.getInstanciaClub();
		
		fecha =new Fecha();
		miembros = new LinkedList<String>();
		miembros.add("usuario123");
	    
		club = new ClubDTO ("idEjemploClub", "Club Pruebas", "Pruebas BDD", 
				"usuario123", miembros, fecha.fechaHoy());
	    
	    assert(dBUsuario.existUsername("usuario123") && (!dBClub.existeIdClub(club.getIdClub())));	    
	}

	@When("^Crea un club$")
	public void crea_un_club() throws Throwable {
	    		
		assert(dBClub.insertaClub(club));
		
	}

	@Then("^Existe el club$")
	public void existe_el_club() throws Throwable {
	    assert(dBClub.existeIdClub(club.getIdClub()));
	}	
}
