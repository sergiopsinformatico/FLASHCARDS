package main.java.flashcards.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import main.java.flashcards.auxiliares.GeneratorStrings;
import main.java.flashcards.auxiliares.PropertiesConfig;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.ActivaCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;


@RestController
@SessionAttributes("usuario")
public class Controlador01RegistroUsuarios {
	
	//Variables
	List<String> listaUsernames, listaEmails;
	ModelAndView vista;
	UsuarioDTO user, user2;
	Fecha fecha;
	String codigoActivacion;
	Email correo;
	
	//Registro	
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registroGet(HttpServletRequest request, HttpServletResponse response) {
		
		//Comprobar activaciones caducadas
		Broker.getInstanciaActivaCuenta().comprobarActivacionesCaducadas();
		
		//Eliminar cuentas pasados 14 dias
		Broker.getInstanciaEliminarCuenta().comprobarCuentasAEliminar();
		
		if(request.getSession().getAttribute("usuario")==null || 
		   ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()==null||
		   ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()=="") {
			
			return new ModelAndView("vistaRegistro");
			
		}else {
			
			return new ModelAndView("redirect:/");
			
		}
	}
	
	//Metodo auxiliar get usernames en vista registro
	@RequestMapping(value = "/getUsernames", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> listUsernames(){
		listaUsernames = Broker.getInstanciaUsuario().getListUsername();
		/*listaUsernames.add("Sergio123");
		listaUsernames.add("Sergio1232");*/
		return listaUsernames;
	}	
	
	//Metodo auxiliar get emails en vista registro
	@RequestMapping(value = "/getEmails", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> listEmails(){
		listaEmails = Broker.getInstanciaUsuario().getListEmail();
		/*listaEmails.add("correoInventado@email.com");
		listaEmails.add("correoInventado2@email.com");*/
		return listaEmails;
	}
	
	//Crear usuario - POST
	@RequestMapping(value = "/crearCuenta", method = RequestMethod.POST)
	public ModelAndView registrarUsuarioPost(HttpServletRequest request, HttpServletResponse response) {
		
		user = new UsuarioDTO(request.getParameter("inputUsername"),
							  request.getParameter("inputEmail"),
							  request.getParameter("inputClave"));
		
		user.setNombreApellidos("");
		user.setCiudad("");
		user.setPais("");
		user.setFoto("");
		user.setEmailFoto("");
		user.setRol("Usuario");
		user.setActivadaCuenta(false);
		
		fecha = new Fecha();
		codigoActivacion = GeneratorStrings.randomString(15);
		
		if(Broker.getInstanciaUsuario().insertUsuario(user) &&
		   Broker.getInstanciaActivaCuenta().insertaAC(new ActivaCuentaDTO(user.getUsername(), codigoActivacion, fecha.fechaActivarCuenta()))) {
			correo = new Email();
			correo.activarCuenta(user,PropertiesConfig.getProperties("baseURL")+"/activaCuenta.html?username="+user.getUsername()+"&codigo="+codigoActivacion);
			
			vista = new ModelAndView("vistaIniciarSesion");
			vista.addObject("mensaje", "Por favor, revise su email "+user.getEmail()+" para finalizar con su registro.");
			
		}else {
			
			vista = new ModelAndView("vistaRegistro");
			vista.addObject("mensaje", "Hubo un fallo en el registro. Por favor, vuelva a intentar registrarse pasado unos minutos.");
			
		}
		
		return vista;
	}
	
	//Crear usuario - GET
	@RequestMapping(value = "/crearCuenta", method = RequestMethod.GET)
	public ModelAndView registrarUsuarioGet(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("redirect:/");
		return vista;
	}
	
	//Activar Cuenta - GET
	@RequestMapping(value = "/activarCuenta", method = RequestMethod.GET)
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
		}else if(Broker.getInstanciaActivaCuenta().existeActivacionUsuario(username)) {
			vista = new ModelAndView("redirect:/");
			vista.addObject("mensaje", "Hay una activación pendiente para "+username+", pero ese codigo no es el correcto.");
		}else {
			user = Broker.getInstanciaUsuario().getUsuarioDTO(username);
			if(user!=null && user.isActivadaCuenta()) {
				vista = new ModelAndView("redirect:/");
				vista.addObject("mensaje", "Su cuenta ya fue activada");
			}else {
				vista = new ModelAndView("redirect:/");
				vista.addObject("mensaje", "Ha expirado la activacion de su cuenta. Es necesario que se vuelva a registrar.");
			}
		}
		return vista;
	}
	
	@RequestMapping(value = "/infoExtra", method = RequestMethod.POST)
	public ModelAndView activar(HttpServletRequest request, HttpServletResponse response){
		user = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("username"));
		user2 = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("username"));

		//Eleccion foto perfil
		if(request.getParameter("inputEmailAvatar")!=null && request.getParameter("inputEmailAvatar")!="") {
			user2.setEmailFoto(request.getParameter("inputEmailAvatar"));
			user2.setFoto("https://www.gravatar.com/avatar/"+DigestUtils.md5Hex(request.getParameter("inputEmailAvatar"))+".jpg");
		}else {
			user2.setEmailFoto(request.getParameter(""));
			user2.setFoto("https://www.gravatar.com/avatar/hashNoDisponible.jpg");
		}
		
		if(request.getParameter("inputNyA")!=null && request.getParameter("inputNyA")!="") {
			user2.setNombreApellidos(request.getParameter("inputNyA"));
		}
		if(request.getParameter("inputCiudad")!=null && request.getParameter("inputCiudad")!="") {
			user2.setCiudad(request.getParameter("inputCiudad"));
		}
		if(request.getParameter("inputPais")!=null && request.getParameter("inputPais")!="") {
			user2.setPais(request.getParameter("inputPais"));
		}
		Broker.getInstanciaUsuario().updateUsuario(user, user2);
		vista = new ModelAndView("redirect:/");
		vista.addObject("mensaje", "Registro completado con exito.");
		return vista;
	}
	
	@RequestMapping(value = "/infoExtra", method = RequestMethod.GET)
	public ModelAndView activarGet(HttpServletRequest request, HttpServletResponse response){
		vista = new ModelAndView("redirect:/");
		return vista;
	}
	
	
	/*Variables
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
	
	Constantes
	static final String USUARIO = "usuario";
	static final String INDEX = "index";
	static final String MENSAJE = "mensaje";
	static final String INPEMAILAVATAR = "inputEmailAvatar";
	static final String INPNYA = "inputNyA";
	static final String INPCIUDAD = "inputCiudad";
	static final String INPPAIS = "inputPais";
	
	Devuelve la vista para registrar a los usuarios
	
	
	
	Guardar a los nuevos usuarios
	
	
	
	
	*/
	
}
