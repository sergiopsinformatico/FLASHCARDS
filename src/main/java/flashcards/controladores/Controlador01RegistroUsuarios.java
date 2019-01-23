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
import main.java.flashcards.auxiliares.MD5Gravatar;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.ActivaCuentaDTO;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;


@RestController
@SessionAttributes("usuario")
public class Controlador01RegistroUsuarios {
	
	Email correo;
	List<String> listaUsernames;
	List<String> listaEmails;
	SecureRandom random;
	String codActivacion;
	Fecha fecha;
	ModelAndView vista;
	UsuarioDTO user;
	UsuarioDTO user2;
	List<ActivaCuentaDTO> listaAC;
	List<EliminarCuentaDTO> listaEl;
	int indice;
	String compara;
	static final String USUARIO = "usuario";
	static final String INDEX = "index";
	static final String MENSAJE = "mensaje";
	static final String INPEMAILAVATAR = "inputEmailAvatar";
	static final String INPNYA = "inputNyA";
	static final String INPCIUDAD = "inputCiudad";
	static final String INPPAIS = "inputPais";
	
	//Devuelve la vista para registrar a los usuarios
	
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registroGet(HttpServletRequest request, HttpServletResponse response) {
		
		//Comprobar activaciones caducadas
		Broker.getInstanciaActivaCuenta().comprobarActivacionesCaducadas();
		
		//Eliminar cuentas pasados 14 dias
		Broker.getInstanciaEliminarCuenta().comprobarCuentasAEliminar();
		
		if(request.getSession().getAttribute(USUARIO)==null || ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()==null||((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()=="") {
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
		user.setEmailFoto("");
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
			correo.activarCuenta(user,"https://sistemaflashcards.herokuapp.com/activaCuenta.html?username="+user.getUsername()+"&codigo="+codActivacion);
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
		listaUsernames.add("Sergio1232");
		return listaUsernames;
	}	
	
	@RequestMapping(value = "/getEmails", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> listEmails(){
		listaEmails = Broker.getInstanciaUsuario().getListEmail();
		listaEmails.add("correoInventado@email.com");
		listaEmails.add("correoInventado2@email.com");
		return listaEmails;
	}
	
	@RequestMapping(value = "/activaCuenta", method = RequestMethod.GET)
	public ModelAndView activaCuenta(@RequestParam("username") String username, @RequestParam("codigo") String codigo){
		if(Broker.getInstanciaActivaCuenta().activacionCuenta(new ActivaCuentaDTO(username, codigo))) {
			user = Broker.getInstanciaUsuario().getUsuarioDTO(username);
			user2 = Broker.getInstanciaUsuario().getUsuarioDTO(username);
			user2.setActivadaCuenta(true);
			Broker.getInstanciaUsuario().updateUsuario(user, user2);
			Broker.getInstanciaActivaCuenta().eliminaAC(new ActivaCuentaDTO(username, codigo));
			vista = new ModelAndView("vistaActivarCuenta");
			vista.addObject("activa", user2);
			correo = new Email();
			correo.confirmaCuentaCreada(user2);
		}else {
			user = Broker.getInstanciaUsuario().getUsuarioDTO(username);
			if(user!=null && user.isActivadaCuenta()) {
				vista = new ModelAndView(INDEX);
				vista.addObject(MENSAJE, "Su cuenta ya fue activada");
			}else {
				vista = new ModelAndView(INDEX);
				vista.addObject(MENSAJE, "Ha expirado la activacion de su cuenta. Es necesario que se vuelva a registrar.");
			}
		}
		return vista;
	}
	
	@RequestMapping(value = "/activar", method = RequestMethod.POST)
	public ModelAndView activar(HttpServletRequest request, HttpServletResponse response){
		user = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("username"));
		user2 = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("username"));

		//Eleccion foto perfil
		if(request.getParameter(INPEMAILAVATAR)!=null && request.getParameter(INPEMAILAVATAR)!="") {
			user2.setEmailFoto(request.getParameter(INPEMAILAVATAR));
			random = new SecureRandom();
			user2.setFoto("https://www.gravatar.com/avatar/"+MD5Gravatar.md5Hex(request.getParameter(INPEMAILAVATAR), new BigInteger(130, random).toString(32) + "\nMD5\nCP1252\n" + new BigInteger(130, random).toString(32))+".jpg");
		}else {
			user2.setEmailFoto(request.getParameter(""));
			user2.setFoto("https://www.gravatar.com/avatar/hashNoDisponible.jpg");
		}
		
		if(request.getParameter(INPNYA)!=null && request.getParameter(INPNYA)!="") {
			user2.setNombreApellidos(request.getParameter(INPNYA));
		}
		if(request.getParameter(INPCIUDAD)!=null && request.getParameter(INPCIUDAD)!="") {
			user2.setCiudad(request.getParameter(INPCIUDAD));
		}
		if(request.getParameter(INPPAIS)!=null && request.getParameter(INPPAIS)!="") {
			user2.setPais(request.getParameter(INPPAIS));
		}
		Broker.getInstanciaUsuario().updateUsuario(user, user2);
		vista = new ModelAndView(INDEX);
		vista.addObject(MENSAJE, "Registro completado con exito.");
		return vista;
	}
	
	@RequestMapping(value = "/activar", method = RequestMethod.GET)
	public ModelAndView activarGet(HttpServletRequest request, HttpServletResponse response){
		vista = new ModelAndView("redirect:/");
		return vista;
	}
	
}
