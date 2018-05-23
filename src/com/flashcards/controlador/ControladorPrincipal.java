package com.flashcards.controlador;

import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	//Inicio (Logueado)
	
	@RequestMapping(value = "/inicio", method = RequestMethod.GET)
	public ModelAndView inicio(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("sesion", request.getAttribute("sesion"));
		return new ModelAndView("principal");
	}
	
	@RequestMapping(value = "/inicio", method = RequestMethod.POST)
	public ModelAndView inicioPost(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("sesion", request.getAttribute("sesion"));
		return new ModelAndView("principal");
	}
	
	
	
	
	
	
	
	
	
		
	
	
	@RequestMapping(value = "/miPerfil", method = RequestMethod.GET)
	public ModelAndView miperfil(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("miperfil");
	}
	
	@RequestMapping(value = "/modificar", method = RequestMethod.GET)
	public ModelAndView modificar(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("modificarPerfil");
	}
	
	@RequestMapping(value = "/gente", method = RequestMethod.GET)
	public ModelAndView gente(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView gente = new ModelAndView("personas");
		GestionUsuarios gU=new GestionUsuarios();
		GestionPeticiones gP=new GestionPeticiones();
		gente.addObject("usuario", gU.leerUsuario(request.getSession().getAttribute("usuario").toString()));
		gente.addObject("usuarios",gU.gente(request.getSession().getAttribute("usuario").toString()));
		LinkedList<PeticionDeAmistad> pendientes = gP.leerPeticion(request.getSession().getAttribute("usuario").toString());
		LinkedList<Usuario> pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getSession().getAttribute("usuario").toString());
		gente.addObject("enviadas", enviadas);
		GestionAmigos gA = new GestionAmigos();
		LinkedList<String> amigosLeidos=gA.getAmigos(request.getSession().getAttribute("usuario").toString());
		LinkedList<Usuario> amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		GestionBloqueados gB = new GestionBloqueados();
		LinkedList<String>bloqueadosLeidos = gB.leerBloqueados(request.getSession().getAttribute("usuario").toString());
		LinkedList<Usuario> bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);		
		return gente;	
	}
	
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
		ModelAndView vista = new ModelAndView("index");
		return vista;
	}
}
