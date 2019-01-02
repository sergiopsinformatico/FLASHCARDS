package main.java.flashcards.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.UsuarioDTO;


@RestController
public class Controlador01RegistroUsuarios {
	
	Email correo;
	List<String> listaUsernames, listaEmails;
	
	//Devuelve la vista para registrar a los usuarios
	
	@RequestMapping(value = "/registro", method = RequestMethod.GET)
	public ModelAndView registroGet(@ModelAttribute("usuario") UsuarioDTO userRegister, HttpServletRequest request, HttpServletResponse response) {
		if(userRegister==null) {
			return new ModelAndView("vistaRegistro");
		}else {
			if(userRegister.getUsername()==null || userRegister.getUsername()=="") {
				return new ModelAndView("vistaRegistro");
			}else {
				return new ModelAndView("redirect:/");
			}	
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
		user.setPhoto("");
		user.setHasRolAdministrador(false);
		user.setHasRolModerador(false);
		user.setHasRolUsuario(true);
		user.setActivadaCuenta(false);
		if(Broker.getInstanciaUsuario().insertUsuario(user)) {
			correo = new Email();
			correo.confirmaCreaCuenta(user);
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
	
}
