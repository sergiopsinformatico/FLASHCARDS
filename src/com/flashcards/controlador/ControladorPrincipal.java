package com.flashcards.controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionAmigos;
import com.flashcards.dao.GestionBloqueados;
import com.flashcards.dao.GestionClubes;
import com.flashcards.dao.GestionFlashcards;
import com.flashcards.dao.GestionPeticiones;
import com.flashcards.dao.GestionSolicitudModerador;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.PeticionDeAmistad;
import com.flashcards.modelo.SolicitudModerador;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorPrincipal {
	
	Usuario user, userPerfil;
	GestionUsuarios gU = new GestionUsuarios();
	GestionPeticiones gP = new GestionPeticiones();
	GestionAmigos gA = new GestionAmigos();
	GestionBloqueados gB = new GestionBloqueados();
	GestionSolicitudModerador gSM;
	GestionFlashcards gF;
	ModelAndView vista;
	LinkedList<Usuario> usuarios;
	LinkedList<String> users;
	LinkedList<PeticionDeAmistad>peticiones;
	String jsonPeople, jsonAmigos, jsonPdAEn, jsonPdARe, jsonBlo;
	String usuario, nUsuario;
	int indice;
	PeticionDeAmistad pA;
	
	//Inicio (Logueado)
	
	@RequestMapping(value = "/inicio", method = RequestMethod.GET)
	public ModelAndView inicio(@RequestParam("usuario") String usuario) {
		user = gU.leerUsuario(usuario);
		vista = new ModelAndView("principal");
		vista.addObject("usuario", user);
		if(user.isUsuario()) {
			vista.addObject("rol", "Usuario");
		}else if(user.isModerador()) {
			vista.addObject("rol", "Moderador");
		}else {
			vista.addObject("rol", "Administrador");
		}
		return vista;
	}
	
	//Ver Perfil
	
	@RequestMapping(value = "/miPerfil", method = RequestMethod.GET)
	public ModelAndView miperfil(@RequestParam("usuario") String usuario, @RequestParam("perfil") String perfil) {
		user = gU.leerUsuario(usuario);
		vista = new ModelAndView("perfil");
		vista.addObject("usuario", user);
		if(usuario.equals(perfil)) {
			userPerfil = gU.leerUsuario(usuario);
			vista.addObject("modificar", true);
		}else {
			userPerfil = gU.leerUsuario(perfil);
			vista.addObject("modificar", false);
		}
		vista.addObject("perfil", userPerfil);
		if(userPerfil.isUsuario()) {
			vista.addObject("rol", "Usuario");
		}else if(userPerfil.isModerador()) {
			vista.addObject("rol", "Moderador");
		}else {
			vista.addObject("rol", "Administrador");
		}
		return vista;
	}
	
	//Configuracion
	
	@RequestMapping(value = "/configuracion", method = RequestMethod.GET)
	public ModelAndView configurcion(@RequestParam("usuario") String usuario) {
		user = gU.leerUsuario(usuario);
		vista = new ModelAndView("configuracion");
		vista.addObject("usuario", user);
		return vista;
	}
	
	//Modificar Mi Perfil
	
	@RequestMapping(value = "/modificarMiPerfil", method = RequestMethod.POST)
	public ModelAndView modificar(HttpServletRequest request, HttpServletResponse response) {
		user = gU.leerUsuario(request.getParameter("usuario"));
		vista = new ModelAndView("modificarPerfil");
		vista.addObject("usuario", user);
		vista.addObject("usuarioM", user);
		return vista;
	}
	
	//Flashcards
	
	@RequestMapping(value = "/flashcards", method = RequestMethod.GET)
	public ModelAndView flashcards(@RequestParam("usuario") String usuario) {
		user = gU.leerUsuario(usuario);
		gSM = new GestionSolicitudModerador();
		gF = new GestionFlashcards();
		vista = new ModelAndView("flashcards");
		vista.addObject("usuario", user);
		/*vista.addObject("solicitado", gSM.existeSolicitud(new SolicitudModerador(user.getUsuario())));
		vista.addObject("listaFlashcards", gF.listaJSONFlashcards(user.getUsuario()));
		vista.addObject("evaluarFlashcards", gF.evaluaJSONFlashcards(user.getUsuario()));*/
		return vista;
	}
	
	@RequestMapping(value = "/gente", method = RequestMethod.GET)
	public ModelAndView gente(@RequestParam("usuario") String usuario) {
		vista = new ModelAndView("personas");
		gU=new GestionUsuarios();
		vista.addObject("usuario", gU.leerUsuario(usuario));
		int check;
		jsonPeople = gU.gente(usuario);
		vista.addObject("people", jsonPeople);
		
		jsonAmigos = "";
		users = gA.getAmigos(usuario);
		check = 0;
		for(indice = 0; indice<users.size(); indice++) {
			nUsuario = users.get(indice);
			if(check==0) {
				jsonAmigos = gU.getNyA(nUsuario)+"///-///"+nUsuario;
				check++;
			}else {
				jsonAmigos = jsonAmigos+"///****nuevaP****///"+gU.getNyA(nUsuario)+"///-///"+nUsuario;
			}
		}
		vista.addObject("friends", jsonAmigos);
		
		jsonPdAEn = "";
		peticiones = gP.leerPeticionEnviada(usuario);
		check = 0;
		for(indice = 0; indice<peticiones.size(); indice++) {
			pA = peticiones.get(indice);
			if(check==0) {
				jsonPdAEn = gU.getNyA(pA.getRecibe())+"///-///"+pA.getRecibe();
				check++;
			}else {
				jsonPdAEn = jsonPdAEn+"///****nuevaP****///"+gU.getNyA(pA.getRecibe())+"///-///"+pA.getRecibe();
			}
		}
		vista.addObject("pDAe", jsonPdAEn);
		
		jsonPdARe = "";
		peticiones = gP.leerPeticionRecibida(usuario);
		check = 0;
		for(indice = 0; indice<peticiones.size(); indice++) {
			pA = peticiones.get(indice);
			if(check==0) {
				jsonPdARe = gU.getNyA(pA.getEnvia())+"///-///"+pA.getEnvia();
				check++;
			}else {
				jsonPdARe = jsonPdARe+"///****nuevaP****///"+gU.getNyA(pA.getEnvia())+"///-///"+pA.getEnvia();
			}
		}
		vista.addObject("pDAr", jsonPdARe);
		
		jsonBlo = "";
		users = gB.leerBloqueados(usuario);
		check = 0;
		for(indice = 0; indice<users.size(); indice++) {
			nUsuario= users.get(indice);
			if(check==0) {
				jsonBlo = gU.getNyA(nUsuario)+"///-///"+nUsuario;
				check++;
			}else {
				jsonBlo = jsonBlo+"///****nuevaP****///"+gU.getNyA(nUsuario)+"///-///"+nUsuario;
			}
		}
		vista.addObject("bloq", jsonBlo);
		
		return vista;
	}
	
	//Vista Clubes
	@RequestMapping(value = "/clubes", method = RequestMethod.GET)
	public ModelAndView clubes(@RequestParam("usuario") String usuario) {
		ModelAndView clubes = new ModelAndView("vistaClubes");
		
		clubes.addObject("usuario", gU.leerUsuario(usuario));
		
		GestionClubes gC = new GestionClubes();
		ArrayList<String> lista = gC.leerClubes();
		String listaClubes="";
		int check=0;
		int indice=0;
		for(indice=0; indice<lista.size(); indice++) {
			if(check==0) {
				listaClubes=lista.get(indice);
				check++;
			}else {
				listaClubes = listaClubes + "///****nuevoCLUB****///" + lista.get(indice);
			}
		}
		clubes.addObject("clubes", listaClubes);
		
		lista = gC.leerClubesUsuario(usuario);
		String listaMisClubes="";
		check=0;
		indice=0;
		for(indice=0; indice<lista.size(); indice++) {
			if(check==0) {
				listaMisClubes=lista.get(indice);
				check++;
			}else {
				listaMisClubes = listaMisClubes + "///****nuevoCLUB****///" + lista.get(indice);
			}
		}
		
		clubes.addObject("misClubes", listaMisClubes);
		
		return clubes;
	}
	
	@RequestMapping(value = "/principalLogueado", method = RequestMethod.POST)
	public ModelAndView principalLogueado(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user = gU.leerUsuario(request.getParameter("usuario"));
		ModelAndView vista = new ModelAndView("principal");
		vista.addObject("nUsuario", request.getParameter("usuario"));
		vista.addObject("administrador", user.isAdministrador());
		vista.addObject("usuario", user);
		return vista;
	}
	
	@RequestMapping(value = "/cerrarSesion", method = RequestMethod.GET)
	public ModelAndView cerrarSesion(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("usuario");
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com");
		} catch (IOException e) {
			e.printStackTrace();
		}
		vista = new ModelAndView("index");
		return vista;
	}
}
