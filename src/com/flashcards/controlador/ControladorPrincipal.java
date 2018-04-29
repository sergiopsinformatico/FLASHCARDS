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
	
	@RequestMapping(value = "/miPerfil", method = RequestMethod.POST)
	public ModelAndView perfil(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user = gU.leerUsuario(request.getParameter("usuario"));
		return new ModelAndView("miperfil", "usuario", user);
	}
	
	@RequestMapping(value = "/modificar", method = RequestMethod.POST)
	public ModelAndView modificar(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user = gU.leerUsuario(request.getParameter("usuario"));
		return new ModelAndView("modificarPerfil", "usuario", user);
	}
	
	@RequestMapping(value = "/gente", method = RequestMethod.POST)
	public ModelAndView gente(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView gente = new ModelAndView("personas");
		GestionUsuarios gU=new GestionUsuarios();
		GestionPeticiones gP=new GestionPeticiones();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		LinkedList<PeticionDeAmistad> pendientes = gP.leerPeticion(request.getParameter("usuario"));
		LinkedList<Usuario> pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		GestionAmigos gA = new GestionAmigos();
		LinkedList<String> amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		LinkedList<Usuario> amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		GestionBloqueados gB = new GestionBloqueados();
		LinkedList<String>bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		LinkedList<Usuario> bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);		
		return gente;	
	}
	
	@RequestMapping(value = "/clubes", method = RequestMethod.POST)
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
}
