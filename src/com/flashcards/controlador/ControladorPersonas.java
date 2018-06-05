package com.flashcards.controlador;

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
import com.flashcards.dao.GestionPeticiones;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Amigos;
import com.flashcards.modelo.Bloqueado;
import com.flashcards.modelo.PeticionDeAmistad;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorPersonas {
	//Pagina
	ModelAndView gente;
	//Gestores
	GestionPeticiones gP;
	GestionBloqueados gB;
	GestionAmigos gA;
	GestionUsuarios gU;
	//Clases Modelo
	PeticionDeAmistad pA;
	Bloqueado bloqueado;
	Amigos amigos;
	LinkedList<PeticionDeAmistad>pendientes;
	LinkedList<Usuario>pendientesUsuario, amigosUsuario, bloqueados;
	LinkedList<String>amigosLeidos, bloqueadosLeidos;
	
	@RequestMapping(value = "/getPeople", method = RequestMethod.GET)
	public String getPeople(@RequestParam("usuario") String usuario) {
		return "hola";
	}
	
	@RequestMapping(value = "/peticionAmistad", method = RequestMethod.POST)
	public ModelAndView peticionAmistad(HttpServletRequest request, HttpServletResponse response) {
		pA = new PeticionDeAmistad(request.getParameter("usuario"),request.getParameter("peticion"));
		gP = new GestionPeticiones();
		gP.crearPeticiones(pA);
		gente = new ModelAndView("personas");
		gU=new GestionUsuarios();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		gA = new GestionAmigos();
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		gB = new GestionBloqueados();
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);
		return gente;	
	}

	
	@RequestMapping(value = "/bloquear", method = RequestMethod.POST)
	public ModelAndView bloquear(HttpServletRequest request, HttpServletResponse response) {
		bloqueado = new Bloqueado(request.getParameter("usuario"),request.getParameter("bloquear"));
		gB = new GestionBloqueados();
		gB.crearBloqueado(bloqueado);
		gente = new ModelAndView("personas");
		gU=new GestionUsuarios();
		gP=new GestionPeticiones();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		gA = new GestionAmigos();
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		gB = new GestionBloqueados();
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);		
		return gente;	
	}
	
	@RequestMapping(value = "/aceptar", method = RequestMethod.POST)
	public ModelAndView aceptar(HttpServletRequest request, HttpServletResponse response) {
		pA = new PeticionDeAmistad(request.getParameter("peticion"),request.getParameter("usuario"));
		gP = new GestionPeticiones();
		gP.eliminarPeticion(pA);
		amigos = new Amigos(request.getParameter("peticion"),request.getParameter("usuario"));
		gA = new GestionAmigos();
		gA.createAmigos(amigos);
		gente = new ModelAndView("personas");
		gU=new GestionUsuarios();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		gB = new GestionBloqueados();
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);
		return gente;
	}
	
	
	@RequestMapping(value = "/rechazar", method = RequestMethod.POST)
	public ModelAndView rechazar(HttpServletRequest request, HttpServletResponse response) {
		pA = new PeticionDeAmistad(request.getParameter("peticion"),request.getParameter("usuario"));
		gP = new GestionPeticiones();
		gP.eliminarPeticion(pA);
		gente = new ModelAndView("personas");
		gU=new GestionUsuarios();
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		LinkedList<PeticionDeAmistad>enviados = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviados);
		gA = new GestionAmigos();
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		gB = new GestionBloqueados();
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);
		return gente;
	}
	
	@RequestMapping(value = "/bloquearPeticion", method = RequestMethod.POST)
	public ModelAndView bloquearPeticion(HttpServletRequest request, HttpServletResponse response) {
		pA = new PeticionDeAmistad(request.getParameter("peticion"),request.getParameter("usuario"));
		gP = new GestionPeticiones();
		gP.eliminarPeticion(pA);
		bloqueado = new Bloqueado(request.getParameter("usuario"),request.getParameter("peticion"));
		gB = new GestionBloqueados();
		gB.crearBloqueado(bloqueado);
		gente = new ModelAndView("personas");
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		gU=new GestionUsuarios();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		gA = new GestionAmigos();
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);
		return gente;
	}
	
	@RequestMapping(value = "/eliminarAmigo", method = RequestMethod.POST)
	public ModelAndView eliminarAmigo(HttpServletRequest request, HttpServletResponse response) {
		amigos = new Amigos(request.getParameter("eliminar"),request.getParameter("usuario"));
		gA = new GestionAmigos();
		gA.deleteAmigos(amigos);
		gente = new ModelAndView("personas");
		gU=new GestionUsuarios();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		gP = new GestionPeticiones();
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		gA = new GestionAmigos();
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		gB = new GestionBloqueados();
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);
		return gente;
	}
	
	@RequestMapping(value = "/bloquearAmigo", method = RequestMethod.POST)
	public ModelAndView bloquearAmigo(HttpServletRequest request, HttpServletResponse response) {
		amigos = new Amigos(request.getParameter("bloquear"),request.getParameter("usuario"));
		gA = new GestionAmigos();
		gA.deleteAmigos(amigos);
		bloqueado = new Bloqueado(request.getParameter("usuario"),request.getParameter("bloquear"));
		gB = new GestionBloqueados();
		gB.crearBloqueado(bloqueado);
		gente = new ModelAndView("personas");
		gU=new GestionUsuarios();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		gP = new GestionPeticiones();
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		gA = new GestionAmigos();
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		gB = new GestionBloqueados();
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);
		return gente;
	}
	
	@RequestMapping(value = "/desbloquear", method = RequestMethod.POST)
	public ModelAndView desbloquear(HttpServletRequest request, HttpServletResponse response) {
		bloqueado = new Bloqueado(request.getParameter("usuario"),request.getParameter("bloqueado"));
		gB = new GestionBloqueados();
		gB.borrarBloqueado(bloqueado);
		gente = new ModelAndView("personas");
		gU=new GestionUsuarios();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		gP = new GestionPeticiones();
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		gA = new GestionAmigos();
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		gB = new GestionBloqueados();
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);
		return gente;
	}
	
	@RequestMapping(value = "/eliminarPeticion", method = RequestMethod.POST)
	public ModelAndView eliminarPeticion(HttpServletRequest request, HttpServletResponse response) {

		PeticionDeAmistad pA = new PeticionDeAmistad(request.getParameter("envia"), request.getParameter("recibe"));
		gP = new GestionPeticiones();
		gP.eliminarPeticion(pA);
		gente = new ModelAndView("personas");
		gU=new GestionUsuarios();
		gente.addObject("usuario", request.getParameter("usuario"));
		gente.addObject("usuarios",gU.gente(request.getParameter("usuario")));
		gP = new GestionPeticiones();
		LinkedList<PeticionDeAmistad>enviadas = gP.leerPeticionEnviada(request.getParameter("usuario"));
		gente.addObject("enviadas", enviadas);
		pendientes = gP.leerPeticion(request.getParameter("usuario"));
		pendientesUsuario = new LinkedList<Usuario>();
		for(int i=0; i<pendientes.size(); i++) {
			pendientesUsuario.add(gU.leerUsuario(pendientes.get(i).getEnvia()));
		}
		gente.addObject("pendientes", pendientesUsuario);
		gA = new GestionAmigos();
		amigosLeidos=gA.getAmigos(request.getParameter("usuario"));
		amigosUsuario = new LinkedList<Usuario>();
		for(int i=0; i<amigosLeidos.size(); i++) {
			amigosUsuario.add(gU.leerUsuario(amigosLeidos.get(i)));
		}
		gente.addObject("amigos", amigosUsuario);
		gB = new GestionBloqueados();
		bloqueadosLeidos = gB.leerBloqueados(request.getParameter("usuario"));
		bloqueados = new LinkedList<Usuario>();
		for(int i=0; i<bloqueadosLeidos.size(); i++) {
			bloqueados.add(gU.leerUsuario(bloqueadosLeidos.get(i)));
		}
		gente.addObject("bloqueados", bloqueados);
		return gente;
	}
	
}
