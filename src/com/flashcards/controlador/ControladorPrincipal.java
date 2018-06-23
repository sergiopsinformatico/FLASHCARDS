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
	
	Usuario user;
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
	String usuario;
	int indice;
	PeticionDeAmistad pA;
	
	//Inicio (Logueado)
	
	@RequestMapping(value = "/inicio", method = RequestMethod.GET)
	public ModelAndView inicio(@RequestParam("usuario") String usuario) {
		user = gU.leerUsuario(usuario);
		vista = new ModelAndView("principal");
		vista.addObject("usuario", user);
		return vista;
	}
	
	//Ver Mi Perfil
	
	@RequestMapping(value = "/miPerfil", method = RequestMethod.GET)
	public ModelAndView miperfil(@RequestParam("usuario") String usuario) {
		user = gU.leerUsuario(usuario);
		vista = new ModelAndView("miperfil");
		vista.addObject("usuario", user);
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
		vista.addObject("solicitado", gSM.existeSolicitud(new SolicitudModerador(user.getUsuario())));
		vista.addObject("listaFlashcards", gF.listaJSONFlashcards(user.getUsuario()));
		vista.addObject("evaluarFlashcards", gF.evaluaJSONFlashcards(user.getUsuario()));
		return vista;
	}
	
	@RequestMapping(value = "/gente", method = RequestMethod.GET)
	public ModelAndView gente(@RequestParam("usuario") String usuario) {
		vista = new ModelAndView("personas");
		gU=new GestionUsuarios();
		vista.addObject("usuario", gU.leerUsuario(usuario));
		
		jsonPeople = gU.gente(usuario);
		vista.addObject("people", jsonPeople);
		
		jsonAmigos = "";
		users = gA.getAmigos(usuario);
		for(indice = 0; indice<users.size(); indice++) {
			usuario = users.get(indice);
			if(indice==0) {
				jsonAmigos = gU.getNyA(usuario)+"///-///"+usuario;
			}else {
				jsonAmigos = jsonAmigos+"///****nuevaP****///"+gU.getNyA(usuario)+"///-///"+usuario;
			}
		}
		vista.addObject("friends", jsonAmigos);
		
		jsonPdAEn = "";
		peticiones = gP.leerPeticionEnviada(usuario);
		for(indice = 0; indice<peticiones.size(); indice++) {
			pA = peticiones.get(indice);
			if(indice==0) {
				jsonPdAEn = gU.getNyA(pA.getRecibe())+"///-///"+pA.getRecibe();
			}else {
				jsonPdAEn = jsonPdAEn+"///****nuevaP****///"+gU.getNyA(pA.getRecibe())+"///-///"+pA.getRecibe();
			}
		}
		vista.addObject("pDAe", jsonPdAEn);
		
		jsonPdARe = "";
		peticiones = gP.leerPeticionRecibida(usuario);
		for(indice = 0; indice<peticiones.size(); indice++) {
			pA = peticiones.get(indice);
			if(indice==0) {
				jsonPdARe = gU.getNyA(pA.getEnvia())+"///-///"+pA.getEnvia();
			}else {
				jsonPdARe = jsonPdARe+"///****nuevaP****///"+gU.getNyA(pA.getEnvia())+"///-///"+pA.getEnvia();
			}
		}
		vista.addObject("pDAr", jsonPdARe);
		
		jsonBlo = "";
		users = gB.leerBloqueados(usuario);
		for(indice = 0; indice<users.size(); indice++) {
			usuario= users.get(indice);
			if(indice==0) {
				jsonBlo = gU.getNyA(usuario)+"///-///"+usuario;
			}else {
				jsonBlo = jsonBlo+"///****nuevaP****///"+gU.getNyA(usuario)+"///-///"+usuario;
			}
		}
		vista.addObject("bloq", jsonBlo);
		
		return vista;
	}
	
	//Clubes
	@RequestMapping(value = "/clubes", method = RequestMethod.GET)
	public ModelAndView clubes(@RequestParam("usuario") String usuario) {
		ModelAndView clubes = new ModelAndView("clubes");
		clubes.addObject("usuario", gU.leerUsuario(usuario));
		GestionClubes gC = new GestionClubes();
		ArrayList<String> lista = gC.leerClubes();
		String listaClubes="";
		for(int indice=0; indice<lista.size(); indice++) {
			if(indice==0) {
				listaClubes=lista.get(indice);
			}else {
				listaClubes = listaClubes + "///****nuevoCLUB****///" + lista.get(indice);
			}
		}
		clubes.addObject("clubes", listaClubes);
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
