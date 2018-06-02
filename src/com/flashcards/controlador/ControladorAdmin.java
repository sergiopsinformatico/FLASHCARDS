package com.flashcards.controlador;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorAdmin {
	
	GestionUsuarios gU = new GestionUsuarios();
	LinkedList<Usuario>usuarios;
	ModelAndView vista;
	Usuario user;
	List users;
	
	@RequestMapping(value = "/gestionar", method = RequestMethod.GET)
	public ModelAndView gestionar(@RequestParam("usuario") String usuario) {
		usuarios = gU.todosUsuarios(usuario);
		users = new ArrayList();
		for(int i=0; i<usuarios.size(); i++) {
			users.add(usuarios.get(i));
		}
		vista = new ModelAndView("administrador");
		//vista.addObject("usuarios", usuarios);
		vista.addObject("usuarios", users);
		vista.addObject("admin", usuario);
		return vista;
	}
	
	@RequestMapping(value = "/adminEliminaCuenta", method = RequestMethod.POST)
	public ModelAndView adminEliminaCuenta(HttpServletRequest request, HttpServletResponse response) {
		gU = new GestionUsuarios();
		gU.eliminaCuenta(request.getParameter("usuario"));
		usuarios = gU.gente(request.getParameter("admin"));
		vista = new ModelAndView("administrador");
		vista.addObject("usuarios", usuarios);
		vista.addObject("admin", request.getParameter("admin"));
		return vista;
	}
	
	@RequestMapping(value = "/adminCambiaRol", method = RequestMethod.POST)
	public ModelAndView adminCambiaRol(HttpServletRequest request, HttpServletResponse response) {
		gU = new GestionUsuarios();
		user = gU.leerUsuario(request.getParameter("usuario"));
		switch(request.getParameter("rol")) {
			case "usuario":
				user.setUsuario(true);
				user.setModerador(false);
				user.setAdministrador(false);
				break;
			case "moderador":
				user.setUsuario(false);
				user.setModerador(true);
				user.setAdministrador(false);
				break;
			case "administrador":
				user.setUsuario(false);
				user.setModerador(false);
				user.setAdministrador(true);
				break;
			default:
				break;
		}
		gU.modificarUsuario(user);
		gU = new GestionUsuarios();
		usuarios = gU.gente(request.getParameter("admin"));
		vista = new ModelAndView("administrador");
		vista.addObject("usuarios", usuarios);
		vista.addObject("admin", request.getParameter("admin"));
		return vista;
	}
	
}
