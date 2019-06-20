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
public class Controlador03RecuperarCuenta {
	
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
	Email email;
	
	@RequestMapping(value = "/recuperaCuenta", method = RequestMethod.GET)
	public ModelAndView recuperaCuenta(HttpServletRequest request, HttpServletResponse response) {
		
		//Comprobaciones
		
		//1-Comprobar activaciones caducadas
		Broker.getInstanciaActivaCuenta().comprobarActivacionesCaducadas();
		
		//2-Eliminar cuentas pasados 14 dias
		Broker.getInstanciaEliminarCuenta().comprobarCuentasAEliminar();
		
		//3-Eliminar solicitudes de restablecimiento de Claves
		Broker.getInstanciaRecuperarCuenta().comprobarSolicitudesCaducadas();
				
		return new ModelAndView("vistaRecuperarCuenta");
	}
	
	@RequestMapping(value = "/recuperaClave", method = RequestMethod.POST)
	public ModelAndView recuperaClave(HttpServletRequest request, HttpServletResponse response) {
		user = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("inputUsernameEmail"));
		vista = new ModelAndView("vistaRecuperarCuenta");
		if(user==null || user.getUsername()==null || user.getUsername()=="") {
			vista.addObject("mensaje", "No existe ninguna cuenta cuyo username o email sea "+request.getParameter("inputUsernameEmail"));
			return vista;
		}else {
			email = new Email();
			fecha = new Fecha();
			keySecure = GeneratorStrings.randomString(10);
			Broker.getInstanciaRecuperarCuenta().insertaRC(new RecuperarCuentaDTO(user.getUsername(), keySecure, fecha.fechaRecuperarCuenta()));
			email.recuperarClave(user,keySecure);
			vista.addObject("mensaje", "Se ha enviado un email a " + user.getEmail() +" con la clave");
			return vista;
		}
	}
	
	@RequestMapping(value = "/recuperaClave", method = RequestMethod.GET)
	public ModelAndView recuperaClaveGet(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("redirect:/recuperaCuenta.html");
	}
	
	@RequestMapping(value = "/restableceClave", method = RequestMethod.GET)
	public ModelAndView restableceClave(@RequestParam("username") String username, @RequestParam("keySecurity") String keySecurity) {
		if(Broker.getInstanciaRecuperarCuenta().leerRC(username, keySecurity)) {
			vista = new ModelAndView("vistaRestablecimientoClave");
			vista.addObject("username", username);
		}else if(Broker.getInstanciaRecuperarCuenta().existeSolicitudUsuario(username)) {
			vista = new ModelAndView("vistaRecuperarCuenta");
			vista.addObject("mensaje", "Solicitó un restablecimiento de la clave, pero el código no es válido");
		}else {
			vista = new ModelAndView("vistaRecuperarCuenta");
			vista.addObject("mensaje", "El enlace ha expirado. Por favor, vuelva a solicitar la recuperacion de la clave");
		}
		return vista;
	}
	
	@RequestMapping(value = "/cambioClave", method = RequestMethod.POST)
	public ModelAndView cambioClave(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("vistaRecuperarCuenta");
		userAntiguo = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("username"));
		userNuevo = userAntiguo;
		userNuevo.setClave(request.getParameter("inputNuevaClave"));
		if(Broker.getInstanciaUsuario().updateUsuario(userAntiguo, userNuevo)) {
			Broker.getInstanciaRecuperarCuenta().eliminarRC(request.getParameter("username"));
			vista.addObject("mensaje", "Se ha actualizado su clave correctamente");
		}else {
			vista.addObject("mensaje", "Error. No se pudo actualizar su clave");
		}
		return vista;
	}
	
	@RequestMapping(value = "/cambioClave", method = RequestMethod.GET)
	public ModelAndView cambioClaveGet(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("redirect:/inicio.html");
	}
}
