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
	
	ModelAndView vista;
	EliminarCuentaDTO elimina;
	Fecha fecha;
	Email email;
	
	//Pagina Principal
	
	@RequestMapping(value = "/principal", method = RequestMethod.GET)
	public ModelAndView principal(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!="") {
			return new ModelAndView("vistaPrincipal");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	//Ver Perfil
	
	@RequestMapping(value = "/verPerfil", method = RequestMethod.GET)
	public ModelAndView verPerfil(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!="") {
			vista = new ModelAndView("vistaPerfil");
			vista.addObject("perfil", ((UsuarioDTO)(request.getSession().getAttribute("usuario"))));
		}else {
			vista = new ModelAndView("redirect:/");
		}
		return vista;
	}
	
	//Eliminar Cuenta
	
	@RequestMapping(value = "/eliminarCuenta", method = RequestMethod.GET)
	public ModelAndView eliminarCuenta(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!="") {
			
			fecha = new Fecha();
			elimina = new EliminarCuentaDTO(((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername(), fecha.fechaEliminarCuenta());
			
			Broker.getInstanciaEliminarCuenta().insertaEliminado(elimina);
			
			email = new Email();
			email.eliminarCuenta(elimina, ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getEmail());
			
			vista = new ModelAndView("redirect:/");
			vista.addObject("usuario",new UsuarioDTO());
			
		}else {
			vista = new ModelAndView("redirect:/");
		}
		return vista;
	}
	
	
	
}
