package main.java.flashcards.controladores;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
public class Controlador02IniciarSesion {

	//Variables Globales
	Broker broker;
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO user;
	ModelAndView vista;
	
	//Devuelve la vista para Iniciar Sesion
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.GET)
	public ModelAndView iniciarSesionGet(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("vistaIniciarSesion");
		return vista;
	}
	
	//Iniciar Sesion	
	@RequestMapping(value = "/loguear", method = RequestMethod.POST)
	public ModelAndView loguearPost(HttpServletRequest request, HttpServletResponse response) {
		dBUsuario = Broker.getInstanciaUsuario();
		if(dBUsuario.login(request.getParameter("inputUsernameEmail"), request.getParameter("inputClave"))) {
			user = dBUsuario.getUsuarioDTO(request.getParameter("inputUsernameEmail"));
			vista = new ModelAndView("vistaPrincipal");
			vista.addObject("usuario", user.getUsername());
			
			request.getSession().setAttribute("usuario", user);
			
			/*try {
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+user.getUsername());
			} catch (IOException e) {
				return vista;
			}*/
		}else {
			vista = new ModelAndView("vistaIniciarSesion");
			request.getSession().removeAttribute("usuario");
			request.getSession().setAttribute("usuario", null);
			vista.addObject("mensaje", "El usuario y/o la contraseña son incorrectos.");
		}
		return vista;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//Controladores
	/*
	@RequestMapping(value = "/logueando", method = RequestMethod.POST)
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
			vista.addObject("mensaje", "El usuario y/o la contraseÃ±a son incorrectos.");
		}
		return vista;
	}*/
	


}