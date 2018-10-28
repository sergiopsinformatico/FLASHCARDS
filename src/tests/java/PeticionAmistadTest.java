package tests.java;

import java.util.LinkedList;

import com.flashcards.db.gestores.GestionAmigos;
import com.flashcards.db.gestores.GestionBloqueados;
import com.flashcards.db.gestores.GestionPeticiones;
import com.flashcards.db.gestores.GestorUsuarios;
import com.flashcards.modelo.Amigos;
import com.flashcards.modelo.Bloqueado;
import com.flashcards.modelo.PeticionDeAmistad;
import com.flashcards.modelo.UsuarioDTO;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class PeticionAmistadTest {
	
	PeticionDeAmistad pA;
	GestionPeticiones gP;
	UsuarioDTO user1, user2;
	GestorUsuarios gU;
	GestionAmigos gA;
	Amigos am;
	Bloqueado bloqueado;
	GestionBloqueados gB;
	LinkedList<String>bloqueados;
	LinkedList<UsuarioDTO>usuarios;
	
	//CREAR PETICION DE AMISTAD
	
	@Given("^Un usuario quiere tener amigos$")
	public void un_usuario_quiere_tener_amigos() throws Throwable {
	    user1=new UsuarioDTO("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
	    gU = new GestorUsuarios();
	    assert(gU.existeUsername(user1.getUsuario()));
	}

	@When("^Localiza a otro usuario$")
	public void localiza_a_otro_usuario() throws Throwable {
		user2=new UsuarioDTO("sergio1234", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
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
		user2=new UsuarioDTO("sergio1234", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gP = new GestionPeticiones();
		assert(gP.leerPeticionRecibida(user2.getUsuario()).size()==1);
	}

	@When("^Conoce al usuario$")
	public void conoce_al_usuario() throws Throwable {
		pA = gP.leerPeticionRecibida(user2.getUsuario()).get(0);
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
		user2=new UsuarioDTO("sergio1234", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gP = new GestionPeticiones();
		assert(gP.leerPeticionRecibida(user2.getUsuario()).size()==1);
	}

	@When("^No conoce al usuario$")
	public void no_conoce_al_usuario() throws Throwable {
		pA = gP.leerPeticionRecibida(user2.getUsuario()).get(0);
		assert(pA.getEnvia().equalsIgnoreCase("sergio123"));
	}

	@Then("^Rechaza la peticion de amistad$")
	public void rechaza_la_peticion_de_amistad() throws Throwable {
		assert(gP.eliminarPeticion(pA));
	}
	
	//BLOQUEAR A UN USUARIO
	
	@Given("^Un usuario ve un usuario$")
	public void un_usuario_ve_un_usuario() throws Throwable {
		user1=new UsuarioDTO("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
	    gU = new GestorUsuarios();
	    user2=new UsuarioDTO("sergio1234", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
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
		bloqueados = gB.leerBloqueados(user1.getUsuario());
		gB.borrarBloqueado(bloqueado);
	    assert(bloqueados.get(0).equals(user2.getUsuario()));
	}
}
