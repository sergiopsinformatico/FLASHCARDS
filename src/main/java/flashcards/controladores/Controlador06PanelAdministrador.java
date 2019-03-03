package main.java.flashcards.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
		if(administrador.isRolAdministrador()) {
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
	
	@RequestMapping(value = "/adminDeleteUser", method = RequestMethod.POST)
	public void administradorEliminaUsuario(@RequestBody @Valid String nombreUsuario) {
		usuario = Broker.getInstanciaUsuario().getUsuarioDTO(nombreUsuario);
		Broker.getInstanciaUsuario().deleteUsuario(usuario);
	}
	
	@RequestMapping(value = "/adminCambiaRolUser", method = RequestMethod.POST)
	public void administradorModificaRol(@RequestBody @Valid String usuario, String rol) {
		antiguo = Broker.getInstanciaUsuario().getUsuarioDTO(usuario);
		nuevo = Broker.getInstanciaUsuario().getUsuarioDTO(usuario);
		switch(rol){
			case "usuario":
				nuevo.setRolUsuario(true);
				nuevo.setRolModerador(false);
				nuevo.setRolAdministrador(false);
				break;
			case "moderador":
				nuevo.setRolUsuario(false);
				nuevo.setRolModerador(true);
				nuevo.setRolAdministrador(false);
				break;
			case "administrador":
				nuevo.setRolUsuario(false);
				nuevo.setRolModerador(false);
				nuevo.setRolAdministrador(true);
				break;
		}
		Broker.getInstanciaUsuario().updateUsuario(antiguo, nuevo);
	}
	
}