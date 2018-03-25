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
public class ControladorEliminarPerfil {
	@RequestMapping(value = "/eliminar", method = RequestMethod.POST)
	public ModelAndView eliminar(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		if(gU.eliminaCuenta(request.getParameter("usuario"))) {
			return new ModelAndView("index");
		}else {
			return new ModelAndView("principal");
		}
	}
}
