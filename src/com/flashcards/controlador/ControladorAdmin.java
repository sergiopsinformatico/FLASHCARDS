package com.flashcards.controlador;

import java.io.IOException;
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

import com.flashcards.db.gestores.GestorUsuarios;
import com.flashcards.modelo.UsuarioDTO;

@Controller
public class ControladorAdmin {
	
	GestorUsuarios gU = new GestorUsuarios();
	LinkedList<UsuarioDTO>usuarios;
	ModelAndView vista;
	UsuarioDTO user;
	String users, rol;
	
	@RequestMapping(value = "/gestionar", method = RequestMethod.GET)
	public ModelAndView gestionar(@RequestParam("usuario") String usuario) {
		users = "";
		usuarios = gU.todosUsuarios(usuario);
		for(int i=0; i<usuarios.size(); i++) {
			
			if(usuarios.get(i).isUsuario())rol="usuario";
			if(usuarios.get(i).isModerador())rol="moderador";
			if(usuarios.get(i).isAdministrador())rol="administrador";
			
			if(i==0) {
				users = usuarios.get(i).getNombreApellidos() + "///****elem****///"+ usuarios.get(i).getUsuario() + "///****elem****///" + rol;
			}else {
				users = users + "///****nuevoUsuario****///" + usuarios.get(i).getNombreApellidos() + "///****elem****///"+ usuarios.get(i).getUsuario() + "///****elem****///" + rol;
			}
		}
		vista = new ModelAndView("administrador");
		vista.addObject("usuarios", users);
		vista.addObject("admin", usuario);
		return vista;
	}
	
	@RequestMapping(value = "/adminEliminaCuenta", method = RequestMethod.POST)
	public ModelAndView adminEliminaCuenta(HttpServletRequest request, HttpServletResponse response) {
		gU = new GestorUsuarios();
		gU.eliminaCuenta(request.getParameter("usuario"));
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/gestionar.html?usuario="+request.getParameter("admin"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		users = "";
		usuarios = gU.todosUsuarios(request.getParameter("admin"));
		for(int i=0; i<usuarios.size(); i++) {
			
			if(usuarios.get(i).isUsuario())rol="usuario";
			if(usuarios.get(i).isModerador())rol="moderador";
			if(usuarios.get(i).isAdministrador())rol="administrador";
			
			if(i==0) {
				users = usuarios.get(i).getNombreApellidos() + "///****elem****///"+ usuarios.get(i).getUsuario() + "///****elem****///" + rol;
			}else {
				users = users + "///****nuevoUsuario****///" + usuarios.get(i).getNombreApellidos() + "///****elem****///"+ usuarios.get(i).getUsuario() + "///****elem****///" + rol;
			}
		}
		vista = new ModelAndView("administrador");
		vista.addObject("usuarios", users);
		vista.addObject("admin", request.getParameter("admin"));
		return vista;
	}
	
	@RequestMapping(value = "/adminCambiaRol", method = RequestMethod.POST)
	public ModelAndView adminCambiaRol(HttpServletRequest request, HttpServletResponse response) {
		gU = new GestorUsuarios();
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
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/gestionar.html?usuario="+request.getParameter("admin"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		gU = new GestorUsuarios();
		usuarios = gU.todosUsuarios(request.getParameter("admin"));
		vista = new ModelAndView("administrador");
		vista.addObject("usuarios", usuarios);
		vista.addObject("admin", request.getParameter("admin"));
		return vista;
	}
	
}
