package main.java.flashcards.controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador03Principal {
	
	//Variables
	ModelAndView vista;
	EliminarCuentaDTO elimina;
	Fecha fecha;
	Email email;
	UsuarioDTO user;
	
	//Constantes
	static final String USUARIO = "usuario";
	static final String REDIRECT = "redirect:/";
	
	//Pagina Principal
	
	@RequestMapping(value = "/principal", method = RequestMethod.GET)
	public ModelAndView principal(HttpServletRequest request, HttpServletResponse response) {
		
		if(request.getSession().getAttribute(USUARIO)!=null && ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()!="") {
			vista = new ModelAndView("vistaPrincipal");
			user = (UsuarioDTO)(request.getSession().getAttribute(USUARIO));
			if(user.getRol().equals("Administrador")) {
				vista.addObject("isAdmin",true);
			}else {
				vista.addObject("isAdmin",false);
			}
		}else {
			vista = new ModelAndView(REDIRECT);
		}
		
		return vista;
	}
	
	//Ver Perfil
	
	@RequestMapping(value = "/verPerfil", method = RequestMethod.GET)
	public ModelAndView verPerfil(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(USUARIO)!=null && ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()!="") {
			vista = new ModelAndView("vistaPerfil");
			vista.addObject("perfil", ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))));
		}else {
			vista = new ModelAndView(REDIRECT);
		}
		return vista;
	}
	
	//Eliminar Cuenta
	
	@RequestMapping(value = "/eliminarCuenta", method = RequestMethod.GET)
	public ModelAndView eliminarCuenta(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(USUARIO)!=null && ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()!="") {
			
			fecha = new Fecha();
			elimina = new EliminarCuentaDTO(((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername(), fecha.fechaEliminarCuenta());
			
			Broker.getInstanciaEliminarCuenta().insertaEliminado(elimina);
			
			email = new Email();
			email.eliminarCuenta(elimina, ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getEmail());
			
			vista = new ModelAndView(REDIRECT);
			vista.addObject(USUARIO,new UsuarioDTO());
			
		}else {
			vista = new ModelAndView(REDIRECT);
		}
		return vista;
	}
	
	
	
}
