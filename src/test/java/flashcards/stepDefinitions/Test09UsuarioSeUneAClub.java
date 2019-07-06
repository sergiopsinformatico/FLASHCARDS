package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.dto.ClubDTO;

public class Test09UsuarioSeUneAClub {
	
	ClubDTO club;
	InterfaceDAOClub dBClub;
	List<String> miembros;
	boolean encontrado;
	int indice;
	
	@Given("^Un usuario encuentra un club$")
	public void un_usuario_encuentra_un_club() throws Throwable {
	    dBClub = Broker.getInstanciaClub();
	    club = dBClub.leerClub("idEjemploClub");
	    assert(club!=null);
	}

	@When("^Solicita unirse$")
	public void solicita_unirse() throws Throwable {
		miembros = club.getMiembros();
		miembros.add("usuario456");
		club.setMiembros(miembros);
		assert(dBClub.actualizaClub(club));
	}

	@Then("^Forma parte de este club$")
	public void forma_parte_de_este_club() throws Throwable {
		club = dBClub.leerClub("idEjemploClub");
		encontrado = false;
		miembros = club.getMiembros();
		for(indice=0; indice<miembros.size(); indice++) {
			if(miembros.get(indice).equals("usuario456")) {
				encontrado = true;
				indice = miembros.size();
			}
		}
		assert(encontrado);
	}
	
}
