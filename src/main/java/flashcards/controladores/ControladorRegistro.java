package main.java.flashcards.controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;


@Controller
public class ControladorRegistro {

	//Declaracion de Variables
	ModelAndView vista;
	
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registroGet(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("vistaRegistro");
		/*broker = new Broker();
		dBUsuario = broker.getInstanciaUsuario();
		jsonUsername = new JSONObject(dBUsuario.getJSONArrayUsername());
		vista.addObject("listUsername", jsonUsername);
		jsonEmail = new JSONObject(dBUsuario.getJSONArrayEmail());
		vista.addObject("listEmail", jsonEmail);*/
		return vista;
	}
	
	@RequestMapping(value = "/createUser", method = RequestMethod.POST,consumes = {"application/json;charset=UTF-8"}, produces={"application/json;charset=UTF-8"})
	public @ResponseBody String registrarUsuarioPost(@RequestBody UsuarioDTO user) {
		Broker.getInstanciaUsuario().insertUsuario(user);
		return "keep";
	}
	
	//@RequestParam("usuario") String usuario
	
	
	
	
	/*
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registro(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("registro");
	}	
	@RequestMapping(value = "/registro", method = RequestMethod.POST)
	public ModelAndView registre(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("registro");
	}*/
	/*@RequestMapping(value = "/crear", method = RequestMethod.POST)
	public ModelAndView crear(HttpServletRequest request, HttpServletResponse response) {
		gU = new GestorUsuarios();
		user = new UsuarioDTO(request.getParameter("nombreUsuario"), request.getParameter("clave"), 
		               request.getParameter("email"), request.getParameter("nombreApellidos"),
		               request.getParameter("ciudad"), request.getParameter("pais"), "", 
		               true, false, false);
		if(user.getGenero().equalsIgnoreCase("hombre")){
			user.setPhoto("resources/img/profileHombre.jpg");
		}else {
			user.setPhoto("resources/img/profileMujer.jpg");
		}
		
		
		mensaje = "";
		if(!(user.cumpleNombreUsuario())) {
			mensaje = "Error. El nombre de usuario solo puede contener minusculas, mayusculas o numeros.";
		}
		if(!(mensaje.equalsIgnoreCase(""))) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", mensaje);
			user.setUsername("");
			vista.addObject("usuario", user);
			return vista;
		}
		if(user.getUsername().equals("sergio123") || gU.existeUsername(user.getUsername())) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "Error. El nombre de usuario ya existe.");
			user.setUsername("");
			vista.addObject("usuario", user);
			return vista;
		}
		if(user.getEmail().equals("sergio13_yo@hotmail.com") || gU.existeEmail(user.getEmail())) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "Error. El email con el que se desea registrarse, ya existe.");
			user.setEmail("");
			vista.addObject("usuario", user);
			return vista;
		}
		
		mensaje = "";
		if(user.tieneEspaciosClave()) {
			mensaje = "Error. La clave no debe contener espacios.";
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", mensaje);
			user.setClave("");
			vista.addObject("usuario", user);
			return vista;
		}
		if(!user.hayMayusculaEnClave()) {
			mensaje = "Error. La clave debe contener al menos una letra mayúscula.";
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", mensaje);
			user.setClave("");
			vista.addObject("usuario", user);
			return vista;
		}
		if(!user.hayMinusculaEnClave()) {
			mensaje = "Error. La clave debe contener al menos una letra minúscula.";
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", mensaje);
			user.setClave("");
			vista.addObject("usuario", user);
			return vista;
		}
		if (!user.hayNumeroEnClave()) {
			mensaje = "Error. La clave debe contener al menos un número.";
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", mensaje);
			user.setClave("");
			vista.addObject("usuario", user);
			return vista;
		}
		if(!user.correctaLongitudClave()) {
			mensaje = "Error. La longitud de la clave no es correcta.";
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", mensaje);
			user.setClave("");
			vista.addObject("usuario", user);
			return vista;
		}
		if(!(request.getParameter("clave").equals(request.getParameter("repiteClave")))) {
			vista = new ModelAndView("registro");
			vista.addObject("mensaje", "Error. Los campos clave y repite clave no coinciden.");
			user.setClave("");
			vista.addObject("usuario", user);
			return vista;
		}else {
			gU.registrarUsuario(user);
			Email registroEmail= new Email();
			registroEmail.crearCuenta(user);
			vista = new ModelAndView("index");
			vista.addObject("mensaje", "Registro Correcto");
			return vista;
		}
	}	*/
	
}
