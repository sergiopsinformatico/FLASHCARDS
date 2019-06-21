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
	
	//Index o pagina principal logueado
	@RequestMapping(value = "/inicio", method = RequestMethod.GET)
	public ModelAndView inicio(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")==null || 
		   ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()==null||
		   ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()=="") {
			vista = new ModelAndView("index");
		}else {
			vista =  new ModelAndView("vistaPrincipal");
			if(request.getParameter("mensaje")!= null && (!request.getParameter("mensaje").equals(""))) {
				vista.addObject("mensaje", request.getParameter("mensaje"));
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
		
		if(request.getSession().getAttribute("usuario")==null || 
		   ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()==null||
		   ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()=="") {
			
			vista =  new ModelAndView("vistaIniciarSesion");
			
		}else {
			vista = new ModelAndView("redirect:/inicio.html");
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
				vista = new ModelAndView("redirect:/inicio.html");
				if(Broker.getInstanciaEliminarCuenta().leerEliminado(eliminado)) {
					Broker.getInstanciaEliminarCuenta().eliminarEliminado(eliminado);
					vista.addObject("mensaje", "Su cuenta ha sido reactivada");
					email = new Email();
					email.reactivacionCuenta(user);
				}
				vista.addObject("usuario", user);
			}else {
				vista = new ModelAndView("vistaIniciarSesion");
				vista.addObject("mensaje", "Su cuenta aun no ha sido activada. Por favor, revise su email para activar la cuenta.");
			}
		}else {
			vista = new ModelAndView("vistaIniciarSesion");
			vista.addObject("mensaje", "El usuario y/o la clave son incorrectos.");
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
		vista = new ModelAndView("redirect:/inicio.html");
		request.getSession().setAttribute("usuario", null);
		vista.addObject("usuario",null);
		return vista;
	}
}