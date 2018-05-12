package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControladorTarjetas {
	@RequestMapping(value = "/crearColeccion", method = RequestMethod.POST)
	public ModelAndView crearColeccion(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView vista = new ModelAndView("creaTarjeta");
		return vista;
	}

}
