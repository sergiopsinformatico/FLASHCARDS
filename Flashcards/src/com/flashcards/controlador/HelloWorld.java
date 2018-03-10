package com.flashcards.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorld {
	@RequestMapping("/welcome")
	public ModelAndView helloWorld() {
		String message = "<br><div style='text-align:center;'>"
				+ "<h3>********** FLASHCARDS</h3>P�gina de Inicio **********</div><br><br>";
		return new ModelAndView("welcome", "message", message);
	}
}
