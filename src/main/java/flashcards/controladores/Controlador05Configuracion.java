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
public class Controlador05Configuracion {
	
	ModelAndView vista;
	UsuarioDTO userAntiguo;
	UsuarioDTO userNuevo;
	Fecha fecha;
	Email email;
	EliminarCuentaDTO elimina;
	
	//Constantes
	static final String CONST_USUARIO = "usuario";
	static final String CONST_REDIRECT_INICIO = "redirect:/inicio.html";
	static final String CONST_MENSAJE = "mensaje";
	
	@RequestMapping(value = "/configuracion", method = RequestMethod.GET)
	public ModelAndView modificarPerfil(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaConfiguracion");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
	@RequestMapping(value = "/modificaUsuario", method = RequestMethod.POST)
	public ModelAndView modificaUsuario(HttpServletRequest request, HttpServletResponse response) {
		userAntiguo = (UsuarioDTO)request.getSession().getAttribute(CONST_USUARIO);
		
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
			vista = new ModelAndView("redirect:/verPerfil.html?usuarioPerfil="+userNuevo.getUsername());
			vista.addObject(CONST_MENSAJE, "Perfil Actualizado");
			vista.addObject(CONST_USUARIO, userNuevo);
		}else {
			vista = new ModelAndView("redirect:/verPerfil.html?usuarioPerfil="+userNuevo.getUsername());
			vista.addObject(CONST_MENSAJE, "Hubo un fallo y no se pudo modificar el perfil");
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
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		  ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		  ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			fecha = new Fecha();
			elimina = new EliminarCuentaDTO(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), fecha.fechaEliminarCuenta());
			
			Broker.getInstanciaEliminarCuenta().insertaEliminado(elimina);
			
			email = new Email();
			email.eliminarCuenta(elimina, ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getEmail());
			
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
			vista.addObject(CONST_MENSAJE,"Su cuenta se eliminara de forma definitiva en 14 dias.");
			vista.addObject(CONST_USUARIO, null);
			request.getSession().setAttribute(CONST_USUARIO, null);
			
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}	
}