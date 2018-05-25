package com.flashcards.controlador;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.auxiliares.Email;
import com.flashcards.dao.GestionEliminados;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorInicial {
	//Variables
	GestionUsuarios gU = new GestionUsuarios();
	Email email = new Email();
	Usuario user;
	ModelAndView vista;
	
									//CONTROLADORES DE INICIAR SESIÓN
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView principalOne(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("");
	}
	
	@RequestMapping(value = "*", method = RequestMethod.GET)
	public ModelAndView principalTwo(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("");
	}*/
	
	//INICIAR SESIÓN
	
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.POST)
	public ModelAndView loguear(HttpServletRequest request, HttpServletResponse response) {
		gU.eliminarCuentas();
		if(gU.login(request.getParameter("inputUsuario"), request.getParameter("inputClave"))){
			user = gU.leerUsuario(request.getParameter("inputUsuario"));
			GestionEliminados gE = new GestionEliminados();
			vista = new ModelAndView("principal");
			vista.addObject("usuario", user);
			request.getSession().setAttribute("usuario", user);
			if(gE.isUsuario(user.getEmail())) {
				gE.borrarEliminado(user.getEmail());
				email.reactivacionCuenta(user);
			}
			try {
				response.sendRedirect("https://sistemaflashcards.herokuapp.com/inicio.html?usuario="+user.getUsuario());
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
	
	//ACCEDER A LOGIN CON GET
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}
	
	//ACCEDER A LOGIN CON POST
	
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public ModelAndView loginPost(HttpServletRequest request, HttpServletResponse response) {
			return new ModelAndView("index");
		}
	
									//CONTROLADORES DE RECUPERACIÓN DE CREDENCIALES
	
	//POST DE ACCEDER A LA RECUPERACION DE LAS CREDENCIALES
	
	@RequestMapping(value = "/recovery", method = RequestMethod.POST)
	public ModelAndView recoveryPass(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("recoveryPassword");
	}
	
	//GET DE ACCEDER A LA RECUPERAIÓN DE LAS CREDENCIALES
	
	@RequestMapping(value = "/recovery", method = RequestMethod.GET)
	public ModelAndView recovery(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("recoveryPassword");
	}
	
	// DEVUELVE LAS CREDENCIALES DEL USUARIO
	
	@RequestMapping(value = "/recuperar", method = RequestMethod.POST)
	public ModelAndView recuperar(HttpServletRequest request, HttpServletResponse response) {
		user = gU.leerUsuario(request.getParameter("usuario"));
		if(user!=null) {
			if(email.recuperarClave(user)) {
				vista = new ModelAndView("index");
				vista.addObject("mensaje", "Se ha enviado un email a "+user.getEmail()+" con los datos de acceso.");
			}else {
				vista = new ModelAndView("recoveryPassword");
				vista.addObject("mensaje", "Ha habido un problema al enviar el email. Por favor, vuelva a intentarlo.");
			}
		}else {
			vista = new ModelAndView("recoveryPassword");
			vista.addObject("mensaje", "El nombre de usuario o email introducido, no existe en el sistema.");
		}
		return vista;
	}
	
										//CONTROLADORES DE REGISTRO DE USUARIOS
	
	//ACCEDER AL REGISTRO
	
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("registro");
	}
	
	//ACCEDER AL REGISTRO
	
	@RequestMapping(value = "/registro", method = RequestMethod.POST)
	public ModelAndView registre(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("registro");
	}
	
	//CREAR USUARIO: POST
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public ModelAndView crear(HttpServletRequest request, HttpServletResponse response) {
		Usuario user = new Usuario(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombreApellidos"),
		               Integer.parseInt(request.getParameter("edad")), request.getParameter("ciudad"), 
		               request.getParameter("pais"), request.getParameter("genero"), true, false, false);
		ModelAndView vista;
		GestionUsuarios gU = new GestionUsuarios();
		
		if(gU.existeUsername(user.getUsuario())) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "El nombre de usuario ya existe. Use otro.");
			user.setUsuario("");
			vista.addObject("usuario", user);
			return vista;
		}else {
			if(!user.hayMayuscula() || !user.hayMinuscula() || !user.hayNumero() || !user.longitudCorrecta()) {
				vista = new ModelAndView("registro");
				vista.addObject("mensaje", "La clave no cumple con los requisitos indicados.");
				user.setClave("");
				vista.addObject("usuario", user);
				return vista;
			}else {
				if(gU.existeEmail(user.getEmail())) {
					vista = new ModelAndView("registro");
					vista.addObject("mensaje", "El email con el que se desea registrarse, ya existe.");
					user.setEmail("");
					vista.addObject("usuario", user);
					return vista;
				}
				else {
					if(!(request.getParameter("clave").equals(request.getParameter("repiteClave")))) {
						vista = new ModelAndView("registro");
						vista.addObject("mensaje", "Los campos clave y repite clave no coinciden.");
						user.setClave("");
						vista.addObject("usuario", user);
						return vista;
					}else {
						gU.registrarUsuario(user);
						email.crearCuenta(user);
						vista = new ModelAndView("index");
						vista.addObject("mensaje", "Registro Correcto");
						return vista;
					}
				}
			}
		}
	}
}
