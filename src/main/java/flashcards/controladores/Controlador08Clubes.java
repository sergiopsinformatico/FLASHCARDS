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

public class Controlador08Clubes {
	
	ModelAndView vista;
	
	//Constantes
	static final String CONST_USUARIO = "usuario";
	static final String CONST_REDIRECT_INICIO = "redirect:/inicio.html";
	
	@RequestMapping(value = "/verClubes", method = RequestMethod.GET)
	public ModelAndView getClubes(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) {
			
			vista = new ModelAndView("vistaClubes");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
}
