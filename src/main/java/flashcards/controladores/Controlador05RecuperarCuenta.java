package main.java.flashcards.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.ActivaCuentaDTO;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador05RecuperarCuenta {
	
	//Variables
	Fecha fecha;
	ModelAndView vista;
	UsuarioDTO user;
	List<ActivaCuentaDTO> listaAC;
	List<EliminarCuentaDTO> listaEl;
	int indice;
	String compara;
	Email email;
	
	//Constantes
	static final String USUARIO = "usuario";
	
	@RequestMapping(value = "/recuperaClave", method = RequestMethod.POST)
	public ModelAndView recuperaClave(HttpServletRequest request, HttpServletResponse response) {
		user = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("inputUsernameEmail"));
		vista = new ModelAndView("vistaIniciarRecuperarSesion");
		if(user==null || user.getUsername()==null || user.getUsername()=="") {
			vista.addObject("mensaje", "No existe dicha cuenta.");
			return vista;
		}else {
			email = new Email();
			email.recuperarClave(user);
			vista.addObject("mensaje", "Se ha enviado un email a " + user.getEmail() +" con la clave");
			return vista;
		}
	}
	
	@RequestMapping(value = "/recuperaClave", method = RequestMethod.GET)
	public ModelAndView recuperaClaveGet(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("redirect:/inicioRecSesion.html.html");
	}
}
