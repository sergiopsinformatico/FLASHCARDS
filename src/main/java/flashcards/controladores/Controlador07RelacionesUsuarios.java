package main.java.flashcards.controladores;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador07RelacionesUsuarios {
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacion dBRelacion;
	
	
	@RequestMapping(value = "/personas", method = RequestMethod.GET)
	public ModelAndView personas(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("vistaPersonas");
	}	
	
	
	@RequestMapping(value = "/allPeople", method = RequestMethod.GET)
	public List<UsuarioDTO> allPeople(@RequestParam("username") String username) {
		dBUsuario = Broker.getInstanciaUsuario();
		return dBUsuario.getAllUsersSystem(username);
	}
	
	@RequestMapping(value = "/amigos", method = RequestMethod.GET)
	public List<String> getAmigos(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getAmigos();
	}
	
	@RequestMapping(value = "/pdaEnv", method = RequestMethod.GET)
	public List<String> getPdAEnv(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getPeticionesEnviadas();
	}
	
	@RequestMapping(value = "/pdaRec", method = RequestMethod.GET)
	public List<String> getPdARec(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getPeticionesRecibidas();
	}
	
	@RequestMapping(value = "/bloqueados", method = RequestMethod.GET)
	public List<String> getBloqueados(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getBloqueados();
	}
	
	@RequestMapping(value = "/bloqueadores", method = RequestMethod.GET)
	public List<String> getBloqueadores(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getBloqueadoPor();
	}
	
}