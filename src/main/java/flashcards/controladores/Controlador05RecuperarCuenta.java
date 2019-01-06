package main.java.flashcards.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Email;
import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.dto.ActivaCuentaDTO;
import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador05RecuperarCuenta {
	
	Fecha fecha;
	ModelAndView vista;
	UsuarioDTO user;
	List<ActivaCuentaDTO> listaAC;
	List<EliminarCuentaDTO> listaEl;
	int indice;
	String compara;
	Email email;
	
	@RequestMapping(value = "/recuperarCuenta", method = RequestMethod.GET)
	public ModelAndView recuperarCuenta(HttpServletRequest request, HttpServletResponse response) {
		
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
		
		if(request.getSession().getAttribute("usuario")==null || ((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()==null||((UsuarioDTO)(request.getSession().getAttribute("usuario"))).getUsername()=="") {
			return new ModelAndView("vistaRecuperarCuenta");
		}else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value = "/recuperaClave", method = RequestMethod.POST)
	public ModelAndView recuperaClave(HttpServletRequest request, HttpServletResponse response) {
		user = Broker.getInstanciaUsuario().getUsuarioDTO(request.getParameter("inputUsernameEmail"));
		if(user==null || user.getUsername()==null || user.getUsername()=="") {
			vista = new ModelAndView("index");
			vista.addObject("mensaje", "No existe dicha cuenta.");
			return vista;
		}else {
			email = new Email();
			email.recuperarClave(user);
			vista = new ModelAndView("index");
			vista.addObject("mensaje", "Se ha enviado un email a " + user.getEmail() +" con la clave");
			return vista;
		}
	}
}
