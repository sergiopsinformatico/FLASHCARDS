package main.java.flashcards.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.auxiliares.GeneratorStrings;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.ActivaCuentaDTO;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.RecuperarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador05RecuperarCuenta {
	
	//Variables
	Fecha fecha;
	ModelAndView vista;
	UsuarioDTO user;
	UsuarioDTO userAntiguo;
	UsuarioDTO userNuevo;
	List<ActivaCuentaDTO> listaAC;
	List<EliminarCuentaDTO> listaEl;
	int indice;
	String compara;
	String keySecure;
	GeneratorStrings gS;
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
			gS = new GeneratorStrings();
			fecha = new Fecha();
			keySecure = gS.randomString(10);
			Broker.getInstanciaRecuperarCuenta().insertaRC(new RecuperarCuentaDTO(user.getUsername(), keySecure, fecha.fechaRecuperarCuenta()));
			email.recuperarClave(user,keySecure);
			vista.addObject("mensaje", "Se ha enviado un email a " + user.getEmail() +" con la clave");
			return vista;
		}
	}
	
	@RequestMapping(value = "/recuperaClave", method = RequestMethod.GET)
	public ModelAndView recuperaClaveGet(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("redirect:/inicioRecSesion.html");
	}
	
	@RequestMapping(value = "/restableceClave", method = RequestMethod.GET)
	public ModelAndView restableceClave(@RequestParam("username") String username, @RequestParam("keySecurity") String keySecurity) {
		if(Broker.getInstanciaRecuperarCuenta().leerRC(username, keySecurity)) {
			vista = new ModelAndView("vistaRestablecimientoClave");
			vista.addObject("username", username);
		}else {
			vista = new ModelAndView("vistaIniciarRecuperarSesion");
			vista.addObject("mensaje", "Enlace no válido. Por favor, vuelva a solicitar la recuperación de la clave");
		}
		return vista;
	}
	
	@RequestMapping(value = "/cambioClave", method = RequestMethod.POST)
	public ModelAndView cambioClave(@RequestParam("username") String username, @RequestParam("clave") String clave) {
		vista = new ModelAndView("vistaIniciarRecuperarSesion");
		userAntiguo = Broker.getInstanciaUsuario().getUsuarioDTO(username);
		userNuevo = userAntiguo;
		userNuevo.setClave(clave);
		if(Broker.getInstanciaUsuario().updateUsuario(userAntiguo, userNuevo)) {
			vista.addObject("mensaje", "Se ha actualizado su clave correctamente");
		}else {
			vista.addObject("mensaje", "Error. No se pudo actualizar su clave");
		}
		return vista;
	}
}
