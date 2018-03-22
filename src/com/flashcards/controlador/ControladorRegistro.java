package com.flashcards.controlador;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControladorRegistro {
	
	@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public ModelAndView registro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("genero"));
		return new ModelAndView("index");
	}
	
}