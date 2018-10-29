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
		
		ModelAndView vista = new ModelAndView();
		
		String mensaje = "";
		if(!(nuevo.cumpleNombreUsuario())) {
			mensaje = "Error. El nombre de usuario solo puede contener minusculas, mayusculas o numeros.";
		}
		if(!(mensaje.equalsIgnoreCase(""))) {
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", mensaje);
			nuevo.setNombreUsuario("");
			vista.addObject("usuario", nuevo);
			return vista;
		}
		if(nuevo.getNombreUsuario().equals("sergio123")) {
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", "Error. El nombre de usuario ya existe.");
			nuevo.setNombreUsuario("");
			vista.addObject("usuario", nuevo);
			return vista;
		}
		if(nuevo.getEmail().equals("sergio13_yo@hotmail.com")) {
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", "Error. El email con el que se desea registrarse, ya existe.");
			nuevo.setEmail("");
			vista.addObject("usuario", nuevo);
			return vista;
		}
		
		mensaje = "";
		if(nuevo.tieneEspaciosClave()) {
			mensaje = "Error. La clave no debe contener espacios.";
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", mensaje);
			nuevo.setClave("");
			vista.addObject("usuario", nuevo);
			return vista;
		}
		if(!nuevo.hayMayusculaEnClave()) {
			mensaje = "Error. La clave debe contener al menos una letra mayúscula.";
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", mensaje);
			nuevo.setClave("");
			vista.addObject("usuario", nuevo);
			return vista;
		}
		if(!nuevo.hayMinusculaEnClave()) {
			mensaje = "Error. La clave debe contener al menos una letra minúscula.";
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", mensaje);
			nuevo.setClave("");
			vista.addObject("usuario", nuevo);
			return vista;
		}
		if (!nuevo.hayNumeroEnClave()) {
			mensaje = "Error. La clave debe contener al menos un número.";
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", mensaje);
			nuevo.setClave("");
			vista.addObject("usuario", nuevo);
			return vista;
		}
		if(!nuevo.correctaLongitudClave()) {
			mensaje = "Error. La longitud de la clave no es correcta.";
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", mensaje);
			nuevo.setClave("");
			vista.addObject("usuario", nuevo);
			return vista;
		}
		if(!(request.getParameter("clave").equals(request.getParameter("repiteClave")))) {
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", "Error. Los campos clave y repite clave no coinciden.");
			nuevo.setClave("");
			vista.addObject("usuario", nuevo);
			return vista;
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
