package main.java.flashcards.controladores;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.db.gestores.GestionEliminados;
import main.java.flashcards.db.gestores.GestorUsuarios;
import main.java.flashcards.dto.Eliminado;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
public class ControladorInicioSesionUsuarios {

	//Variables Globales
	
	GestorUsuarios gU;
	GestionEliminados gE;
	UsuarioDTO user;
	ModelAndView vista;
	
	//Controladores
	
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.POST)
	public ModelAndView loguear(HttpServletRequest request, HttpServletResponse response) {
		
		gU = new GestorUsuarios();
		gE = new GestionEliminados();
		
		Fecha fecha = new Fecha();
		LinkedList<Eliminado> eliminados = gE.buscarEliminados(fecha.fechaHoy());
		for(int indice = 0; indice<eliminados.size(); indice++) {
			user = gU.leerUsuario(eliminados.get(indice).getEmail());
			gE.borrarEliminado(user.getEmail());
			gU.eliminaCuenta(user.getUsername());
		}
		
		if(gU.login(request.getParameter("inputUsuario"), request.getParameter("inputClave"))){
			user = gU.leerUsuario(request.getParameter("inputUsuario"));
			if(gE.isUsuario(user.getEmail())) {
				gE.borrarEliminado(user.getEmail());
				Email email = new Email();
				email.reactivacionCuenta(user);
			}
			vista = new ModelAndView("principal");
			vista.addObject("usuario", user);
			request.getSession().setAttribute("usuario", user);
			try {
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+user.getUsername());
			} catch (IOException e) {
				return vista;
			}
		}else {
			vista = new ModelAndView("index");
			request.getSession().removeAttribute("usuario");
			request.getSession().setAttribute("usuario", null);
			vista.addObject("mensaje", "El usuario y/o la contraseña son incorrectos.");
		}
		return vista;
	}
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.GET)
	public ModelAndView iniciarSesionGet(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("principal");
		return vista;
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
		public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}

}