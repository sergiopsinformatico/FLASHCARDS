package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionEliminados;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Eliminado;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorEliminarPerfil {
	@RequestMapping(value = "/eliminar", method = RequestMethod.POST)
	public ModelAndView eliminar(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user = gU.leerUsuario(request.getParameter("usuario"));
		Eliminado pB = new Eliminado(user.getEmail());
		GestionEliminados gE = new GestionEliminados();
		gE.insertarEliminado(pB);
		return new ModelAndView("index");
	}
}
