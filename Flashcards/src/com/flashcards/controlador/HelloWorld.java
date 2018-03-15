package com.flashcards.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorld {
	@RequestMapping("/welcome")
	public ModelAndView helloWorld() {
		String message = "<br><div style='text-align:center;'>"
				+ "<h3>********** FLASHCARDS</h3>Página de Inicio. Prueba Superada **********</div><br><br>";
		return new ModelAndView("welcome", "message", message);
	}
}


//@RequestMapping("/welcome.htm")
//@RequestMapping(value = "welcome", method = RequestMethod.GET)
//HttpServletRequest request, HttpServletResponse response, Model model