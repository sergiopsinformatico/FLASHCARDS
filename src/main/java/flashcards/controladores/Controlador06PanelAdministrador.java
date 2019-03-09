package main.java.flashcards.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador06PanelAdministrador {
	
	//Variables
	ModelAndView vista;
	UsuarioDTO administrador;
	UsuarioDTO usuario;
	UsuarioDTO antiguo;
	UsuarioDTO nuevo;
	
	@RequestMapping(value = "/panelAdministrador", method = RequestMethod.GET)
	public ModelAndView modificarPerfil(HttpServletRequest request, HttpServletResponse response) {
		administrador = (UsuarioDTO)request.getSession().getAttribute("usuario");
		if(administrador.getRol().equals("Administrador")) {
			vista = new ModelAndView("vistaAdministrador");
		}else {
			vista = new ModelAndView("redirect:/");
		}
		return vista;
	}
	
	@RequestMapping(value = "/getUsersAdmin", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> getUsuarios() {
		return Broker.getInstanciaUsuario().getAllUsersSystem();
	}
	
	@RequestMapping(value = "/adminDeleteUser", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> administradorEliminaUsuario(@Value("username") String username) {
		usuario = Broker.getInstanciaUsuario().getUsuarioDTO(username);
		Broker.getInstanciaUsuario().deleteUsuario(usuario);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/adminCambiaRolUser", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> administradorModificaRol(@Value("username") String username, @Value("rol") String rol) {
		antiguo = Broker.getInstanciaUsuario().getUsuarioDTO(username);
		nuevo = Broker.getInstanciaUsuario().getUsuarioDTO(username);
		switch(rol){
			case "usuario":
				nuevo.setRol("Usuario");
				break;
			case "moderador":
				nuevo.setRol("Moderador");
				break;
			case "default":
				nuevo.setRol("Administrador");
				break;
		}
		Broker.getInstanciaUsuario().updateUsuario(antiguo, nuevo);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
}