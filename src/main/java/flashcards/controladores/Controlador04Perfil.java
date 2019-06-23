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
public class Controlador04Perfil {
	
	//Variables
	ModelAndView vista;
	UsuarioDTO userAntiguo;
	
	//Ver Perfil
	@RequestMapping(value = "/verPerfil", method = RequestMethod.GET)
	public ModelAndView verPerfil(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!="") {
			vista = new ModelAndView("vistaPerfil");
			vista.addObject("perfil", ((UsuarioDTO)(request.getSession().getAttribute("usuario"))));
			if(request.getParameter("mensaje")!= null && (!request.getParameter("mensaje").equals(""))) {
				vista.addObject("mensaje", request.getParameter("mensaje"));
			}
		}else {
			vista = new ModelAndView("redirect:/inicio.html");
		}
		return vista;
	}
	
}
