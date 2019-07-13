package test.java.flashcards.stepDefinitions;

import java.util.List;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.dto.ClubDTO;

public class Test09UsuarioDejaClub {
	
	InterfaceDAOClub dBClub;
	ClubDTO club;
	boolean encontrado;
	List<String> miembros;
	int indice;
	int indiceEncontrado = -1;
	
	@Given("^Un usuario que pertenece a un club$")
	public void un_usuario_que_pertenece_a_un_club() throws Throwable {
	    dBClub = Broker.getInstanciaClub();
	    club = dBClub.leerClub("idEjemploClub", "usuario456");
	    if(club!=null) {
	    	encontrado = false;
	    	miembros = club.getMiembros();
	    	for(indice=0; indice<miembros.size(); indice++) {
	    		if(miembros.get(indice).equals("usuario456")) {
	    			encontrado = true;
	    			indiceEncontrado = indice;
	    			indice = miembros.size();
	    		}
	    	}
	    	assert(encontrado);
	    }else {
	    	assert(false);
	    }
	}

	@When("^Deja el club$")
	public void deja_el_club() throws Throwable {
	    miembros.remove(indiceEncontrado);
	    club.setMiembros(miembros);
	    assert(dBClub.actualizaClub(club));
	}

	@Then("^No pertenece al club$")
	public void no_pertenece_al_club() throws Throwable {
		club = dBClub.leerClub("idEjemploClub", "usuario456");
	    if(club!=null) {
	    	encontrado = false;
	    	miembros = club.getMiembros();
	    	for(indice=0; indice<miembros.size(); indice++) {
	    		if(miembros.get(indice).equals("usuario456")) {
	    			encontrado = true;
	    			indiceEncontrado = indice;
	    			indice = miembros.size();
	    		}
	    	}
	    	assert(!encontrado);
	    }else {
	    	assert(false);
	    }
	}
	
}
