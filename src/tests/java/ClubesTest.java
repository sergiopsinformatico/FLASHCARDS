package tests.java;

import com.flashcards.dao.GestionClubes;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Club;
import com.flashcards.modelo.UsuarioDTO;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class ClubesTest {
	
	UsuarioDTO user1, user2;
	GestionUsuarios gU;
	GestionClubes gC;
	Club club;
	
	//Crear Club	
	@Given("^Un usuario crea un club$")
	public void un_usuario_crea_un_club() throws Throwable {
		user1=new UsuarioDTO("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
	    gU = new GestionUsuarios();
	    club = new Club("id", "Prueba", user1.getUsuario(), "Club de Prueba");
	    assert(gU.existeUsername(user1.getUsuario()));
	}
	
	@When("^Este usuario es el administrador$")
	public void este_usuario_es_el_administrador() throws Throwable {
	    gC = new GestionClubes();
	    gC.crearClub(club);
	    assert(club.getAdministrador().equals(user1.getUsuario()));
	}

	@Then("^El club se crea$")
	public void el_club_se_crea() throws Throwable {
	    assert(gC.existeClubIdentificador(club.getIdentificador()));
	}
	
	//Insertar Miembro en un Club
	@Given("^Un usuario quiere entrar a un club$")
	public void un_usuario_quiere_entrar_a_un_club() throws Throwable {
		user2=new UsuarioDTO("sergio1234", "Sergio123", "sergio13_yo@email.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU = new GestionUsuarios();
		gU.registrarUsuario(user2);
		assert(gU.existeUsername(user2.getUsuario()));
	}

	@When("^El administrador lo inserta$")
	public void el_administrador_lo_inserta() throws Throwable {
		user1=new UsuarioDTO("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gC = new GestionClubes();
		club = gC.leerClubConIdentificador("id");
		assert(club.getAdministrador().equals(user1.getUsuario()) && club.insertarMiembro(user2.getUsuario()));
	}

	@Then("^Forma parte del club$")
	public void forma_parte_del_club() throws Throwable {
	    gC.actualizarClub(club);
	    club = gC.leerClubConIdentificador("id");
		assert(club.existeMiembro(user2.getUsuario()));
	}

	//Eliminar Miembro de un Club
	@Given("^Un usuario quiere abandonar un club$")
	public void un_usuario_quiere_abandonar_un_club() throws Throwable {
		user2=new UsuarioDTO("sergio1234", "Sergio123", "sergio13_yo@email.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gU = new GestionUsuarios();
		gC = new GestionClubes();
		club = gC.leerClubConIdentificador("id");
		assert(gU.existeUsername(user2.getUsuario()) && club.existeMiembro(user2.getUsuario()));
	}

	@When("^Lo elimina del club$")
	public void lo_elimina_del_club() throws Throwable {
		user1=new UsuarioDTO("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		if(club.getAdministrador().equals(user1.getUsuario())) {
			club.eliminarMiembro(user2.getUsuario());
			gC.actualizarClub(club);
		}
		assert(!club.existeMiembro(user2.getUsuario()));
	}

	@Then("^No forma parte del club$")
	public void no_forma_parte_del_club() throws Throwable {
		club = gC.leerClubConIdentificador("id");
		assert(!club.existeMiembro(user2.getUsuario()));
	}

	//Cambiar Administrador en un Club
	@Given("^El administrador del club cambia$")
	public void el_administrador_del_club_cambia() throws Throwable {
		user1=new UsuarioDTO("sergio123", "Sergio123", "sergio13_yo@hotmail.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gC = new GestionClubes();
		club = gC.leerClubConIdentificador("id");
		assert(club.getAdministrador().equals(user1.getUsuario()));
	}

	@When("^Indica el nuevo administrador$")
	public void indica_el_nuevo_administrador() throws Throwable {
		user2=new UsuarioDTO("sergio1234", "Sergio123", "sergio13_yo@email.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		club.insertarMiembro(user2.getUsuario());
		club.setAdministrador(user2.getUsuario());
		assert(gC.actualizarClub(club));
	}

	@Then("^Ya no es administrador$")
	public void ya_no_es_administrador() throws Throwable {
		club = gC.leerClubConIdentificador("id");
		assert(club.getAdministrador().equals(user2.getUsuario()));
	}

	//Eliminar un Club
	@Given("^Un club se va a eliminar$")
	public void un_club_se_va_a_eliminar() throws Throwable {
		user2=new UsuarioDTO("sergio1234", "Sergio123", "sergio13_yo@email.com", "Sergio Perez Sanchez", 24, "Toledo", "España", "Hombre", "resources/img/profileHombre.jpg", true, false, false);
		gC = new GestionClubes();
		club = gC.leerClubConIdentificador("id");
		assert(gC.existeClubIdentificador(club.getIdentificador()));
	}

	@When("^El club se borra$")
	public void el_club_se_borra() throws Throwable {
	    if(user2.getUsuario().equals(club.getAdministrador())) {
	    	assert(gC.eliminarClub(club.getNombre()));
	    }else {
		    assert(false);
	    }
	}

	@Then("^El club deja de existir$")
	public void el_club_deja_de_existir() throws Throwable {
		gU = new GestionUsuarios();
		gU.eliminaCuenta(user2.getUsuario());
	    assert(!gC.existeClubIdentificador(club.getIdentificador()));
	}
}
