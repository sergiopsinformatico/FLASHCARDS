package main.java.flashcards.controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador03Principal {
	
	ModelAndView vista;
	
	@RequestMapping(value = "/principal", method = RequestMethod.GET)
	public ModelAndView principal(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!="") {
			return new ModelAndView("vistaPrincipal");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value = "/verPerfil", method = RequestMethod.GET)
	public ModelAndView verPerfil(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!="") {
			vista = new ModelAndView("vistaPerfil");
			vista.addObject("perfil", ((UsuarioDTO)(request.getSession().getAttribute("usuario"))));
		}else {
			vista = new ModelAndView("redirect:/");
		}
		return vista;
	}
	
	
	
}
