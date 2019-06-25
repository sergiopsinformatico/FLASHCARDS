package main.java.flashcards.controladores;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador02ControlSesion {
	
	ModelAndView vista;
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO user;
	EliminarCuentaDTO eliminado;
	Email email;
	
	//Constantes
	static final String CONST_USUARIO = "usuario";
	static final String CONST_MENSAJE = "mensaje";
	static final String CONST_VIEW_IS = "vistaIniciarSesion";
	static final String CONST_REDIRECT_INICIO = "redirect:/inicio.html";
	
	//Index o pagina principal logueado
	@RequestMapping(value = "/inicio", method = RequestMethod.GET)
	public ModelAndView inicio(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)==null || 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()==null||
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()=="") {
			vista = new ModelAndView("index");
			if(request.getParameter(CONST_MENSAJE)!= null && (!request.getParameter(CONST_MENSAJE).equals(""))) {
				vista.addObject(CONST_MENSAJE, request.getParameter(CONST_MENSAJE));
			}
		}else {
			vista =  new ModelAndView("vistaPrincipal");
			if(request.getParameter(CONST_MENSAJE)!= null && (!request.getParameter(CONST_MENSAJE).equals(""))) {
				vista.addObject(CONST_MENSAJE, request.getParameter(CONST_MENSAJE));
			}
		}
		return vista;
	}
	
	//Iniciar Sesion
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.GET)
	public ModelAndView iniciarSesion(HttpServletRequest request, HttpServletResponse response) {
		
		//Comprobaciones
		
		//1-Comprobar activaciones caducadas
		Broker.getInstanciaActivaCuenta().comprobarActivacionesCaducadas();
		
		//2-Eliminar cuentas pasados 14 dias
		Broker.getInstanciaEliminarCuenta().comprobarCuentasAEliminar();
		
		//3-Eliminar solicitudes de restablecimiento de Claves
		Broker.getInstanciaRecuperarCuenta().comprobarSolicitudesCaducadas();
		
		//Vista Iniciar Sesion
		
		if(request.getSession().getAttribute(CONST_USUARIO)==null || 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()==null||
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()=="") {
			
			vista =  new ModelAndView(CONST_VIEW_IS);
			
			if(request.getParameter(CONST_MENSAJE)!= null && (!request.getParameter(CONST_MENSAJE).equals(""))) {
				vista.addObject(CONST_MENSAJE, request.getParameter(CONST_MENSAJE));
			}
			
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
			
		}
		
		return vista;
	}
	
	//Acceder
	@RequestMapping(value = "/acceder", method = RequestMethod.POST)
	public ModelAndView loguearPost(HttpServletRequest request, HttpServletResponse response) {
		dBUsuario = Broker.getInstanciaUsuario();
		if(dBUsuario.login(request.getParameter("inputUsernameEmail"), request.getParameter("inputClave"))) {
			user = dBUsuario.getUsuarioDTO(request.getParameter("inputUsernameEmail"));
			
			if(user.isActivadaCuenta()) {
				eliminado = new EliminarCuentaDTO(user.getUsername());
				vista = new ModelAndView(CONST_REDIRECT_INICIO);
				if(Broker.getInstanciaEliminarCuenta().leerEliminado(eliminado)) {
					Broker.getInstanciaEliminarCuenta().eliminarEliminado(eliminado);
					vista.addObject(CONST_MENSAJE, "Su cuenta ha sido reactivada");
					email = new Email();
					email.reactivacionCuenta(user);
				}
				vista.addObject(CONST_USUARIO, user);
			}else {
				vista = new ModelAndView(CONST_VIEW_IS);
				vista.addObject(CONST_MENSAJE, "Su cuenta aun no ha sido activada. Por favor, revise su email para activar la cuenta.");
			}
		}else {
			vista = new ModelAndView(CONST_VIEW_IS);
			vista.addObject(CONST_MENSAJE, "El usuario y/o la clave son incorrectos.");
		}
		return vista;
	}
	
	@RequestMapping(value = "/acceder", method = RequestMethod.GET)
	public ModelAndView loguearGet(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("redirect:/iniciarSesion.html");
	}
	
	//Cerrar Sesion
	@RequestMapping(value = "/cerrarSesion", method = RequestMethod.GET)
	public ModelAndView cerrarSesion(HttpServletRequest request, HttpServletResponse response) {	
		vista = new ModelAndView(CONST_REDIRECT_INICIO);
		request.getSession().setAttribute(CONST_USUARIO, null);
		vista.addObject(CONST_USUARIO,null);
		return vista;
	}
}