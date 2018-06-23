package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.auxiliares.Email;
import com.flashcards.dao.GestionEliminados;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Eliminado;
import com.flashcards.modelo.Usuario;

@Controller
public class ControladorEliminarPerfil {
	//Variables
	Email em = new Email();
	
	@RequestMapping(value = "/eliminar", method = RequestMethod.GET)
	public ModelAndView eliminarGet(HttpServletRequest request, HttpServletResponse response) {
		GestionUsuarios gU = new GestionUsuarios();
		Usuario user = gU.leerUsuario(((Usuario)request.getSession().getAttribute("usuario")).getUsuario());
		Eliminado pB = new Eliminado(user.getEmail());
		GestionEliminados gE = new GestionEliminados();
		gE.insertarEliminado(pB);
		request.getSession().removeAttribute("usuario");
		em.eliminarCuenta(user,  pB.getFecha());
		return new ModelAndView("index");
	}
}
