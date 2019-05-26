package main.java.flashcards.controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador04ModificarPerfil {
	
	//Variables
	ModelAndView vista;
	UsuarioDTO userAntiguo;
	
	//Constantes
	static final String USUARIO = "usuario";
	
	@RequestMapping(value = "/modificarPerfil", method = RequestMethod.GET)
	public ModelAndView modificarPerfil(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(USUARIO)!=null && ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()!=null && ((UsuarioDTO)(request.getSession().getAttribute(USUARIO))).getUsername()!="") {
			vista = new ModelAndView("vistaModificarPerfil");
		}else {
			vista = new ModelAndView("redirect:/inicio.html");
		}
		return vista;
	}
	
	@RequestMapping(value = "/modificaUsuario", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ModelAndView modificaUsuario(@RequestBody @Valid UsuarioDTO userNuevo, HttpServletRequest request, HttpServletResponse response) {
		userAntiguo = (UsuarioDTO)request.getSession().getAttribute(USUARIO);
		userNuevo.setRol(userAntiguo.getRol());
		userNuevo.setActivadaCuenta(userAntiguo.isActivadaCuenta());
		if(userNuevo.getEmailFoto()=="") {
			userNuevo.setFoto("https://www.gravatar.com/avatar/inventado.jpg");
		}else {
			userNuevo.setFoto("https://www.gravatar.com/avatar/"+DigestUtils.md5Hex(userNuevo.getEmailFoto())+".jpg");
		}
		
		if(Broker.getInstanciaUsuario().updateUsuario(userAntiguo, userNuevo)) {
			vista = new ModelAndView("redirect:/verPerfil.html");
			vista.addObject(USUARIO, userNuevo);
		}else {
			vista = new ModelAndView("redirect:/verPerfil.html");
			vista.addObject("mensaje", "Hubo un fallo y no se pudo modificar el perfil");
		}
		return vista;
	}
	
}
