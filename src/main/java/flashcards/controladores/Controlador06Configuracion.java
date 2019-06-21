package main.java.flashcards.controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
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
public class Controlador06Configuracion {
	
	ModelAndView vista;
	UsuarioDTO userAntiguo, userNuevo;
	Fecha fecha;
	Email email;
	EliminarCuentaDTO elimina;
	
	@RequestMapping(value = "/configuracion", method = RequestMethod.GET)
	public ModelAndView modificarPerfil(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()!="") {
			vista = new ModelAndView("vistaConfiguracion");
		}else {
			vista = new ModelAndView("redirect:/inicio.html");
		}
		return vista;
	}
	
	@RequestMapping(value = "/modificaUsuario", method = RequestMethod.POST)
	public ModelAndView modificaUsuario(HttpServletRequest request, HttpServletResponse response) {
		userAntiguo = (UsuarioDTO)request.getSession().getAttribute("usuario");
		
		userNuevo = new UsuarioDTO(request.getParameter("inputUsername"), 
								   request.getParameter("inputEmail"), 
								   request.getParameter("inputClave"));
		userNuevo.setNombreApellidos(request.getParameter("inputNyA"));
		userNuevo.setCiudad(request.getParameter("inputCiudad"));
		userNuevo.setPais(request.getParameter("inputPais"));
		userNuevo.setEmailFoto(request.getParameter("inputEmailAvatar"));
		userNuevo.setRol(userAntiguo.getRol());
		userNuevo.setActivadaCuenta(userAntiguo.isActivadaCuenta());
		
		
		if(userNuevo.getEmailFoto()=="") {
			userNuevo.setFoto("https://www.gravatar.com/avatar/inventado.jpg");
		}else {
			userNuevo.setFoto("https://www.gravatar.com/avatar/"+DigestUtils.md5Hex(userNuevo.getEmailFoto())+".jpg");
		}
		
		if(Broker.getInstanciaUsuario().updateUsuario(userAntiguo, userNuevo)) {
			vista = new ModelAndView("redirect:/verPerfil.html");
			vista.addObject("usuario", userNuevo);
		}else {
			vista = new ModelAndView("redirect:/verPerfil.html");
			vista.addObject("mensaje", "Hubo un fallo y no se pudo modificar el perfil");
		}
		return vista;
	}
	
	@RequestMapping(value = "/modificaUsuario", method = RequestMethod.GET)
	public ModelAndView modificaUsuarioGet(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("redirect:/configuracion.html");
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
			
			vista = new ModelAndView("redirect:/inicio.html");
			vista.addObject("usuario", null);
			request.getSession().setAttribute("usuario", null);
			
		}else {
			vista = new ModelAndView("redirect:/inicio.html");
		}
		return vista;
	}	
}