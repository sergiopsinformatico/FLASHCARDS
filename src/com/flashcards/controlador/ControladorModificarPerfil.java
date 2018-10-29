package com.flashcards.controlador;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.db.gestores.GestorUsuarios;
import com.flashcards.modelo.UsuarioDTO;

@Controller
public class ControladorModificarPerfil {
	
	@RequestMapping(value = "/mPerfil", method = RequestMethod.POST)
	public ModelAndView mPerfil(HttpServletRequest request, HttpServletResponse response) {
		GestorUsuarios gU = new GestorUsuarios();
		UsuarioDTO antiguo = gU.leerUsuario(request.getParameter("usuarioAntiguo"));
		UsuarioDTO nuevo = new UsuarioDTO(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombreApellidos"),
		               Integer.parseInt(request.getParameter("edad")), request.getParameter("ciudad"), 
		               request.getParameter("pais"), request.getParameter("genero"), "",
		               antiguo.isUsuario(), antiguo.isModerador(), antiguo.isAdministrador());
		if(nuevo.getGenero().equalsIgnoreCase("hombre")){
			nuevo.setPhoto("resources/img/profileHombre.jpg");
		}else {
			nuevo.setPhoto("resources/img/profileMujer.jpg");
		}
		ModelAndView vista = new ModelAndView("");
		if(!(request.getParameter("clave").equals(request.getParameter("repiteClave")))) {
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", "Los campos clave y repite clave deben coincidir.");
			vista.addObject("usuario", antiguo);
			nuevo.setNombreUsuario("");
			vista.addObject("usuarioM", nuevo);
		}else if(nuevo.getNombreUsuario().contains(" ")) {
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", "El nombre de usuario no puede contener espacios.");
			vista.addObject("usuario", antiguo);
			nuevo.setNombreUsuario("");
			vista.addObject("usuarioM", nuevo);
		}else if(nuevo.getEmail().contains(" ")){
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", "El email no puede contener espacios.");
			vista.addObject("usuario", antiguo);
			nuevo.setEmail("");
			vista.addObject("usuarioM", nuevo);
		}else if(!nuevo.hayMayusculaEnClave() || !nuevo.hayMinusculaEnClave() || !nuevo.hayNumeroEnClave() || !nuevo.correctaLongitudClave()) {
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", "La clave no cumple con los requisitos indicados.");
			vista.addObject("usuario", antiguo);
			nuevo.setClave("");
			vista.addObject("usuarioM", nuevo);
		}else {
			if((nuevo.getEmail().equals(antiguo.getEmail())) && (!nuevo.getNombreUsuario().equals(antiguo.getNombreUsuario()))) {
				if(gU.existeUsername(nuevo.getNombreUsuario())) {
					vista = new ModelAndView("modificarPerfil");
					vista.addObject("mensaje", "El usuario ya existe.");
					vista.addObject("usuario", antiguo);
					nuevo.setNombreUsuario("");
					vista.addObject("usuarioM", nuevo);
				}else {
					gU.eliminaCuenta(antiguo.getNombreUsuario());
					gU.registrarUsuario(nuevo);
					request.getSession().removeAttribute("usuario");
					request.getSession().setAttribute("usuario", nuevo);
					vista = new ModelAndView("perfil");
					try {
						response.sendRedirect("https://sistemaflashcards.herokuapp.com/miPerfil.html?usuario="+nuevo.getNombreUsuario());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}else if((!nuevo.getEmail().equals(antiguo.getEmail())) && (nuevo.getNombreUsuario().equals(antiguo.getNombreUsuario()))) {
				if(gU.existeEmail(nuevo.getEmail())) {
					vista = new ModelAndView("modificarPerfil");
					vista.addObject("mensaje", "El email ya existe.");
					vista.addObject("usuario", antiguo);
					nuevo.setEmail("");
					vista.addObject("usuarioM", nuevo);
				}else {
					gU.eliminaCuenta(antiguo.getNombreUsuario());
					gU.registrarUsuario(nuevo);
					request.getSession().removeAttribute("usuario");
					request.getSession().setAttribute("usuario", nuevo);
					vista = new ModelAndView("perfil");
					try {
						response.sendRedirect("https://sistemaflashcards.herokuapp.com/miPerfil.html?usuario="+nuevo.getNombreUsuario());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}else if((!nuevo.getEmail().equals(antiguo.getEmail())) && (!nuevo.getNombreUsuario().equals(antiguo.getNombreUsuario()))) {
				if(gU.existeUsername(nuevo.getNombreUsuario())) {
					vista = new ModelAndView("modificarPerfil");
					vista.addObject("mensaje", "El usuario ya existe.");
					vista.addObject("usuario", antiguo);
					nuevo.setNombreUsuario("");
					vista.addObject("usuarioM", nuevo);
				}else if(gU.existeEmail(nuevo.getEmail())) {
					vista = new ModelAndView("modificarPerfil");
					vista.addObject("mensaje", "El email ya existe.");
					vista.addObject("usuario", antiguo);
					nuevo.setEmail("");
					vista.addObject("usuarioM", nuevo);
				}else {
					gU.eliminaCuenta(antiguo.getNombreUsuario());
					gU.registrarUsuario(nuevo);
					request.getSession().removeAttribute("usuario");
					request.getSession().setAttribute("usuario", nuevo);
					vista = new ModelAndView("perfil");
					try {
						response.sendRedirect("https://sistemaflashcards.herokuapp.com/miPerfil.html?usuario="+nuevo.getNombreUsuario()+"&perfil="+nuevo.getNombreUsuario());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}else if((nuevo.getEmail().equals(antiguo.getEmail())) && (nuevo.getNombreUsuario().equals(antiguo.getNombreUsuario()))) {
				gU.eliminaCuenta(antiguo.getNombreUsuario());
				gU.registrarUsuario(nuevo);
				request.getSession().removeAttribute("usuario");
				request.getSession().setAttribute("usuario", nuevo);
				vista = new ModelAndView("perfil");
				try {
					response.sendRedirect("https://sistemaflashcards.herokuapp.com/miPerfil.html?usuario="+nuevo.getNombreUsuario()+"&perfil="+nuevo.getNombreUsuario());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return vista;
	}
}
