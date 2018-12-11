package main.java.flashcards.controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.db.gestores.GestionEliminados;
import main.java.flashcards.db.gestores.GestorUsuarios;
import main.java.flashcards.dto.Eliminado;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
public class ControladorEliminarPerfil {
	
	@RequestMapping(value = "/eliminar", method = RequestMethod.GET)
	public ModelAndView eliminarGet(HttpServletRequest request, HttpServletResponse response) {
		Email em = new Email();
		GestorUsuarios gU = new GestorUsuarios();
		UsuarioDTO user = gU.leerUsuario(((UsuarioDTO)request.getSession().getAttribute("usuario")).getUsername());
		Eliminado pB = new Eliminado(user.getEmail());
		GestionEliminados gE = new GestionEliminados();
		gE.insertarEliminado(pB);
		request.getSession().removeAttribute("usuario");
		em.eliminarCuenta(user,  pB.getFecha());
		return new ModelAndView("index");
	}
}
