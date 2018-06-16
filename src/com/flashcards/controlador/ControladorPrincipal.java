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
import com.flashcards.dao.GestionPeticiones;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.PeticionDeAmistad;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorPrincipal {
	
	Usuario user;
	GestionUsuarios gU = new GestionUsuarios();
	GestionPeticiones gP = new GestionPeticiones();
	ModelAndView vista;
	LinkedList<Usuario> usuarios;
	String jsonPeople;
	int indice;
	
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
		vista = new ModelAndView("flashcards");
		vista.addObject("usuario", user);
		return vista;
	}
	
	@RequestMapping(value = "/gente", method = RequestMethod.GET)
	public ModelAndView gente(@RequestParam("usuario") String usuario) {
		vista = new ModelAndView("personas");
		gU=new GestionUsuarios();
		vista.addObject("usuario", gU.leerUsuario(usuario));
		jsonPeople = gU.gente(usuario);
		vista.addObject("people", jsonPeople);
		return vista;
	}
	/*
	@RequestMapping(value = "/gente", method = RequestMethod.GET)
	public ModelAndView gente(@RequestParam("usuario") String usuario) {
		vista = new ModelAndView("personas");
		gU=new GestionUsuarios();
		gP=new GestionPeticiones();
		vista.addObject("usuario", gU.leerUsuario(usuario));
		vista.addObject("usuarios",gU.gente(usuario));
		LinkedList<PeticionDeAmistad> pendientes = gP.leerPeticion(usuario);
		LinkedList<Usuario> pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		vista.addObject("pendientes", pendientesUsuario);
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(usuario);
		vista.addObject("enviadas", enviadas);
		GestionAmigos gA = new GestionAmigos();
		LinkedList<String> amigosLeidos=gA.getAmigos(usuario);
		LinkedList<Usuario> amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		vista.addObject("amigos", amigosUsuario);
		GestionBloqueados gB = new GestionBloqueados();
		LinkedList<String>bloqueadosLeidos = gB.leerBloqueados(usuario);
		LinkedList<Usuario> bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		vista.addObject("bloqueados", bloqueados);		
		return vista;	
	}*/
	
	@RequestMapping(value = "/clubes", method = RequestMethod.GET)
	public ModelAndView clubes(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView clubes = new ModelAndView("clubes");
		clubes.addObject("usuario", request.getParameter("usuario"));
		GestionClubes gC = new GestionClubes();
		ArrayList<String> lista = gC.leerClubes();
		clubes.addObject("clubes", lista);
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
