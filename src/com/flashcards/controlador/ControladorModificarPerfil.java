package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorModificarPerfil {
	
	@RequestMapping(value = "/mPerfil", method = RequestMethod.POST)
	public ModelAndView mPerfil(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario antiguo = gU.leerUsuario(request.getParameter("usuarioAntiguo"));
		Usuario nuevo = new Usuario(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombreApellidos"),
		               Integer.parseInt(request.getParameter("edad")), request.getParameter("ciudad"), 
		               request.getParameter("pais"), request.getParameter("genero"),
		               antiguo.isUsuario(), antiguo.isModerador(), antiguo.isAdministrador());
		ModelAndView vista = new ModelAndView("");;
		if(!nuevo.hayMayuscula() || !nuevo.hayMinuscula() || !nuevo.hayNumero() || !nuevo.longitudCorrecta()) {
			vista = new ModelAndView("modificarPerfil");
			vista.addObject("mensaje", "La clave no cumple con los requisitos indicados.");
		}else {
			if((nuevo.getEmail().equals(antiguo.getEmail())) && (!nuevo.getUsuario().equals(antiguo.getUsuario()))) {
				if(gU.existeUsername(nuevo.getUsuario())) {
					vista = new ModelAndView("modificarPerfil");
					vista.addObject("mensaje", "El usuario ya existe.");
				}else {
					gU.eliminaCuenta(antiguo.getUsuario());
					gU.registrarUsuario(nuevo);
					request.getSession().removeAttribute("usuario");
					request.getSession().setAttribute("usuario", nuevo);
					vista = new ModelAndView("miperfil");
				}
			}else if((!nuevo.getEmail().equals(antiguo.getEmail())) && (nuevo.getUsuario().equals(antiguo.getUsuario()))) {
				if(gU.existeEmail(nuevo.getEmail())) {
					vista = new ModelAndView("modificarPerfil");
					vista.addObject("mensaje", "El email ya existe.");
				}else {
					gU.eliminaCuenta(antiguo.getUsuario());
					gU.registrarUsuario(nuevo);
					request.getSession().removeAttribute("usuario");
					request.getSession().setAttribute("usuario", nuevo);
					vista = new ModelAndView("miperfil");
				}
			}else if((!nuevo.getEmail().equals(antiguo.getEmail())) && (!nuevo.getUsuario().equals(antiguo.getUsuario()))) {
				if(gU.existeUsername(nuevo.getUsuario())) {
					vista = new ModelAndView("modificarPerfil");
					vista.addObject("mensaje", "El usuario ya existe.");
				}else if(gU.existeEmail(nuevo.getEmail())) {
					vista = new ModelAndView("modificarPerfil");
					vista.addObject("mensaje", "El email ya existe.");
				}else {
					gU.eliminaCuenta(antiguo.getUsuario());
					gU.registrarUsuario(nuevo);
					request.getSession().removeAttribute("usuario");
					request.getSession().setAttribute("usuario", nuevo);
					vista = new ModelAndView("miperfil");
				}
			}else if((nuevo.getEmail().equals(antiguo.getEmail())) && (nuevo.getUsuario().equals(antiguo.getUsuario()))) {
				gU.eliminaCuenta(antiguo.getUsuario());
				gU.registrarUsuario(nuevo);
				request.getSession().removeAttribute("usuario");
				request.getSession().setAttribute("usuario", nuevo);
				vista = new ModelAndView("miperfil");
			}
		}
		return vista;
	}
}
