package main.java.flashcards.controladores;

import java.util.List;

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
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.ActivaCuentaDTO;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador02ControlSesion {

	//Variables Globales
	Broker broker;
	InterfaceDAOUsuario dBUsuario;
	UsuarioDTO user;
	ModelAndView vista;
	List<ActivaCuentaDTO> listaAC;
	List<EliminarCuentaDTO> listaEl;
	int indice;
	Fecha fecha;
	String compara;
	EliminarCuentaDTO eliminado;
	Email email;
	
	//Devuelve la vista para Iniciar Sesion
	@RequestMapping(value = "/iniciarSesion", method = RequestMethod.GET)
	public ModelAndView iniciarSesionGet(HttpServletRequest request, HttpServletResponse response) {
		
		//Eliminar cuentas no activadas
		listaAC = Broker.getInstanciaActivaCuenta().leerTodas();
		fecha = new Fecha();
		for(indice=0; indice<listaAC.size(); indice++) {
			compara = fecha.compararFechas(listaAC.get(indice).getFecha(), fecha.fechaHoy());
			if(compara!=null && Integer.parseInt(compara)<0) {
				Broker.getInstanciaActivaCuenta().eliminaAC(listaAC.get(indice));
			}
		}
		
		//Eliminar cuentas pasados 14 dias
		listaEl = Broker.getInstanciaEliminarCuenta().leerTodos();
		fecha = new Fecha();
		for(indice=0; indice<listaEl.size(); indice++) {
			compara = fecha.compararFechas(listaEl.get(indice).getFecha(), fecha.fechaHoy());
			if(compara!=null && Integer.parseInt(compara)<0) {
				Broker.getInstanciaEliminarCuenta().eliminarEliminado(listaEl.get(indice));
				user = Broker.getInstanciaUsuario().getUsuarioDTO(listaEl.get(indice).getUsername());
				Broker.getInstanciaUsuario().deleteUsuario(user);
			}
		}
		
		//Vista Iniciar Sesion
		
		if(request.getSession().getAttribute("usuario")==null || ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()==null||((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()=="") {
			return new ModelAndView("vistaIniciarSesion");
		}else {
			return new ModelAndView("redirect:/principal.html");
		}
	}
	
	//Iniciar Sesion	
	@RequestMapping(value = "/loguear", method = RequestMethod.POST)
	public ModelAndView loguearPost(HttpServletRequest request, HttpServletResponse response) {
		dBUsuario = Broker.getInstanciaUsuario();
		if(dBUsuario.login(request.getParameter("inputUsernameEmail"), request.getParameter("inputClave"))) {
			user = dBUsuario.getUsuarioDTO(request.getParameter("inputUsernameEmail"));
			if(user.isActivadaCuenta()) {
				eliminado = new EliminarCuentaDTO(user.getUsername());
				vista = new ModelAndView("redirect:/");
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView inicio(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("usuario")==null || ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()==null||((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()=="") {
			vista = new ModelAndView("index");
			/*if(request.getAttribute("mensaje")!=null && request.getAttribute("mensaje").toString()!="") {
				vista.addObject("mensaje", request.getAttribute("mensaje").toString());
			}*/
		}else {
			vista =  new ModelAndView("vistaPrincipal");
			/*if(request.getAttribute("mensaje")!=null && request.getAttribute("mensaje").toString()!="") {
				vista.addObject("mensaje", request.getAttribute("mensaje").toString());
			}*/
		}
		return vista;
	}
	
	@RequestMapping(value = "/cerrarSesion", method = RequestMethod.GET)
	public ModelAndView cerrarSesion(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("redirect:/");
		vista.addObject("usuario",new UsuarioDTO());
		return vista;
	}

}