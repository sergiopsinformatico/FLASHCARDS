package main.java.flashcards.controladores;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")

public class Controlador06Administrador {
	
	ModelAndView vista;
	List<UsuarioDTO> listaUsuarios;
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO userAntiguo;
	UsuarioDTO userNuevo;
	
	//Constantes
	static final String CONST_USUARIO = "usuario";
	static final String CONST_REDIRECT_INICIO = "redirect:/inicio.html";
		
	@RequestMapping(value = "/panelAdministrador", method = RequestMethod.GET)
	public ModelAndView getPanelAdministrador(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) {
			
			vista = new ModelAndView("vistaPanelAdministrador");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
	@RequestMapping(value = "/gestionUsuariosAdmin", method = RequestMethod.GET)
	public ModelAndView getGestionUsuariosAdmin(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) {
			
			vista = new ModelAndView("vistaGestionUsuarios");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
		
	@RequestMapping(value = "/getUsuariosAdmin", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> getUsuariosAdmin(@RequestParam("username") String username, HttpServletRequest request){
		
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) {
			
			dBUsuario = Broker.getInstanciaUsuario();
			listaUsuarios = dBUsuario.getAllUsuarios(username);
			
		}else {
			listaUsuarios = new LinkedList<>();
		}
		
		return listaUsuarios;
		
	}
	
	@RequestMapping(value = "/administradorCambiaRol", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public boolean administradorCambiaRol(@RequestParam("username") String username, @RequestParam("rol") String rol,
			HttpServletRequest request){
		
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) {
			
			dBUsuario = Broker.getInstanciaUsuario();
			userAntiguo = dBUsuario.getUsuarioDTO(username);
			if(userAntiguo!=null) {
				userNuevo = userAntiguo;
				userNuevo.setRol(rol);
				return dBUsuario.updateUsuario(userAntiguo, userNuevo);
			}else {
				return false;
			}
			
		}else {
			return false;
		}
		
	}
	
	@RequestMapping(value = "/administradorEliminaUsuario", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public boolean administradorEliminaUsuario(@RequestParam("username") String username, HttpServletRequest request){
		
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
				   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) {
			
			dBUsuario = Broker.getInstanciaUsuario();
			userAntiguo = dBUsuario.getUsuarioDTO(username);
			if(userAntiguo!=null) {
				return dBUsuario.deleteUsuario(userAntiguo);
			}else {
				return false;
			}
			
		}else {
			return false;
		}
		
	}
	
	@RequestMapping(value = "/gestionClubesAdmin", method = RequestMethod.GET)
	public ModelAndView gestionClubesAdmin(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) {
			
			vista = new ModelAndView("vistaGestionClubes");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
}
