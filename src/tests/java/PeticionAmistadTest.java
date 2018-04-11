package tests.java;

import java.util.LinkedList;

import com.flashcards.dao.GestionAmigos;
import com.flashcards.dao.GestionBloqueados;
import com.flashcards.dao.GestionPeticiones;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Amigos;
import com.flashcards.modelo.Bloqueado;
import com.flashcards.modelo.PeticionDeAmistad;
import com.flashcards.modelo.Usuario;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class PeticionAmistadTest {
	
	PeticionDeAmistad pA;
	GestionPeticiones gP;
	Usuario user1, user2;
	GestionUsuarios gU;
	GestionAmigos gA;
	Amigos am;
	Bloqueado bloqueado;
	GestionBloqueados gB;
	LinkedList<String>bloqueados;
	LinkedList<Usuario>usuarios;
	
	//CREAR PETICION DE AMISTAD
	
	@Given("^Un usuario quiere tener amigos$")
	public void un_usuario_quiere_tener_amigos() throws Throwable {
	    user1=new Usuario("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio", "Perez Sanchez", 24, "Toledo", "España", "Hombre", true, false, false);
	    gU = new GestionUsuarios();
	    assert(gU.existeUsername(user1.getUsuario()));
	}

	@When("^Localiza a otro usuario$")
	public void localiza_a_otro_usuario() throws Throwable {
		user2=new Usuario("sergio1234", "Sergio123", "sergio13_yo@hotmail.com", "Sergio", "Perez Sanchez", 24, "Toledo", "España", "Hombre", true, false, false);
	    assert(user1.getUsuario()!=user2.getUsuario());
	}

	@Then("^Envia una peticion de amistad$")
	public void envia_una_peticion_de_amistad() throws Throwable {
	    gP = new GestionPeticiones();
	    pA = new PeticionDeAmistad(user1.getUsuario(), user2.getUsuario());
	    assert(gP.crearPeticiones(pA));
	}

	//ACEPTAR PETICION DE AMISTAD
	
	@Given("^Un usuario recibe una peticion de amistad$")
	public void un_usuario_recibe_una_peticion_de_amistad() throws Throwable {
		user2=new Usuario("sergio1234", "Sergio123", "sergio13_yo@hotmail.com", "Sergio", "Perez Sanchez", 24, "Toledo", "España", "Hombre", true, false, false);
		gP = new GestionPeticiones();
		assert(gP.leerPeticion(user2.getUsuario()).size()==1);
	}

	@When("^Conoce al usuario$")
	public void conoce_al_usuario() throws Throwable {
		pA = gP.leerPeticion(user2.getUsuario()).get(0);
		assert(pA.getEnvia().equals("sergio123"));
	}

	@Then("^Acepta la peticion de amistad$")
	public void acepta_la_peticion_de_amistad() throws Throwable {
		am = new Amigos(pA.getEnvia(), pA.getRecibe());
		gA = new GestionAmigos();
		gA.createAmigos(am);
		boolean comp = gA.existeAmigos(am);
		gA.deleteAmigos(am);
	    assert(comp);
	}
	
	//RECHAZA PETICION DE AMISTAD

	@Given("^Un usuario ha recibido una peticion de amistad$")
	public void un_usuario_ha_recibido_una_peticion_de_amistad() throws Throwable {
		user2=new Usuario("sergio1234", "Sergio123", "sergio13_yo@hotmail.com", "Sergio", "Perez Sanchez", 24, "Toledo", "España", "Hombre", true, false, false);
		gP = new GestionPeticiones();
		assert(gP.leerPeticion(user2.getUsuario()).size()==1);
	}

	@When("^No conoce al usuario$")
	public void no_conoce_al_usuario() throws Throwable {
		pA = gP.leerPeticion(user2.getUsuario()).get(0);
		assert(pA.getEnvia().equalsIgnoreCase("sergio123"));
	}

	@Then("^Rechaza la peticion de amistad$")
	public void rechaza_la_peticion_de_amistad() throws Throwable {
		assert(gP.eliminarPeticion(pA));
	}
	
	//BLOQUEAR A UN USUARIO
	
	@Given("^Un usuario ve un usuario$")
	public void un_usuario_ve_un_usuario() throws Throwable {
		user1=new Usuario("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio", "Perez Sanchez", 24, "Toledo", "España", "Hombre", true, false, false);
	    gU = new GestionUsuarios();
	    user2=new Usuario("sergio1234", "Sergio123", "sergio13_yo@hotmail.com", "Sergio", "Perez Sanchez", 24, "Toledo", "España", "Hombre", true, false, false);
	    assert(user1.getUsuario()!=user2.getUsuario());
	}

	@When("^Quiere bloquearle$")
	public void quiere_bloquearle() throws Throwable {
	    gB = new GestionBloqueados();
	    bloqueado=new Bloqueado(user1.getUsuario(), user2.getUsuario());
	    assert(gB.crearBloqueado(bloqueado));
	}

	@Then("^No aparece$")
	public void no_aparece() throws Throwable {
		bloqueados = gB.obtenerBloqueador(user1.getUsuario());
		gB.borrarBloqueado(bloqueado);
	    assert(bloqueados.get(0).equals(user2.getUsuario()));
	}
}
