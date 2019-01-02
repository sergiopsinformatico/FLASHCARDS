package main.java.flashcards.controladores;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.ActivaCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;


@RestController
@SessionAttributes("usuario")
public class Controlador01RegistroUsuarios {
	
	Email correo;
	List<String> listaUsernames, listaEmails;
	SecureRandom random;
	String codActivacion;
	Fecha fecha;
	ModelAndView vista;
	UsuarioDTO user;
	
	//Devuelve la vista para registrar a los usuarios
	
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registroGet(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")==null || ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()==null||((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()=="") {
			return new ModelAndView("vistaRegistro");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	//Guardar a los nuevos usuarios
	
	@RequestMapping(value = "/guardarUsuario", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public boolean registrarUsuarioPost(@RequestBody @Valid UsuarioDTO user) {
		user.setNombreApellidos("");
		user.setCiudad("");
		user.setPais("");
		user.setFoto("");
		user.setRolAdministrador(false);
		user.setRolModerador(false);
		user.setRolUsuario(true);
		user.setActivadaCuenta(false);
		
		random = new SecureRandom();
		codActivacion = new BigInteger(130, random).toString(32);
		fecha = new Fecha();
		
		if(Broker.getInstanciaUsuario().insertUsuario(user) &&
		   Broker.getInstanciaActivaCuenta().insertaAC(new ActivaCuentaDTO(user.getUsername(), codActivacion, fecha.fechaActivarCuenta()))) {
			correo = new Email();
			correo.confirmaCreaCuenta(user,"https://sistemaflashcards.herokuapp.com/activaCuenta.html?username="+user.getUsername()+"&codigo="+codActivacion);
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value = "/getUsernames", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> listUsernames(){
		listaUsernames = Broker.getInstanciaUsuario().getListUsername();
		listaUsernames.add("Sergio123");
		return listaUsernames;
	}	
	
	@RequestMapping(value = "/getEmails", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> listEmails(){
		listaEmails = Broker.getInstanciaUsuario().getListEmail();
		listaEmails.add("sergio13_yo@hotmail.com");
		return listaEmails;
	}
	
	@RequestMapping(value = "/activaCuenta", method = RequestMethod.GET)
	public ModelAndView activaCuenta(@RequestParam("username") String username, @RequestParam("codigo") String codigo){
		if(Broker.getInstanciaActivaCuenta().activacionCuenta(new ActivaCuentaDTO(username, codigo))) {
			//poner a true la activacion
			//llamar a la vista para que acabe de rellenar los campos que faltan
		}else {
			user = Broker.getInstanciaUsuario().getUsuarioDTO(username);
			if(user!=null && user.isActivadaCuenta()) {
				//Mensaje --> Su cuenta ya fue activada
			}else {
				//Mensaje --> Esta cuenta no existe o expiró la activación. Es necesario que se vuelva a registrar (un boton a registrar)
			}
		}
		
		
		vista = new ModelAndView("vistaActivarCuenta");
		
		//añadir a la vista el usuario a activar para guardar lo que seleccione en la vista
		return vista;
	}
	
	@RequestMapping(value = "/activar", method = RequestMethod.POST)
	public ModelAndView activar(HttpServletRequest request, HttpServletResponse response){
		user = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("username"));
		user.setFoto(request.getParameter("foto"));
		if(request.getParameter("inputNyA")!=null && request.getParameter("inputNyA")!="") {
			user.setNombreApellidos(request.getParameter("inputNyA"));
		}
		if(request.getParameter("inputCiudad")!=null && request.getParameter("inputCiudad")!="") {
			user.setCiudad(request.getParameter("inputCiudad"));
		}
		if(request.getParameter("inputPais")!=null && request.getParameter("inputPais")!="") {
			user.setPais(request.getParameter("inputPais"));
		}
		return new ModelAndView("redirect:/");
	}
	
}
