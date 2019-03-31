package main.java.flashcards.controladores;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAORelacion;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.RelacionDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")
public class Controlador07RelacionesUsuarios {
	
	ModelAndView vista;
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacion dBRelacion;
	JSONArray jsonArray;
	String json;
	RelacionDTO relacion;
	RelacionDTO relacionUsername;
	RelacionDTO relacionLogueado;
	ArrayList<String> lista;
	List<UsuarioDTO> listaInicial;
	List<UsuarioDTO> listaDefinitiva;
	
	@RequestMapping(value = "/personas", method = RequestMethod.GET)
	public ModelAndView personas(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("vistaPersonas");
		vista.addObject("logueado", ((UsuarioDTO)request.getSession().getAttribute("usuario")).getUsername());
		return vista;
	}	
	
	
	@RequestMapping(value = "/allPeople", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> allPeople(@RequestParam("username") String username) {
		dBUsuario = Broker.getInstanciaUsuario();
		return dBUsuario.getUsuariosRelacion(username);
	}
	
	@RequestMapping(value = "/verUsuario", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ModelAndView verUsuario(@RequestParam("username") String username, @RequestParam("logueado") String logueado) {
		dBRelacion = Broker.getInstanciaRelacion();
		vista = new ModelAndView("vistaUsuario");
		vista.addObject("perfil", dBUsuario.getUsuarioDTO(username));
		vista.addObject("logueado", logueado);		
		return vista;
	}
	
	@RequestMapping(value = "/relacion", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public String relacion(@RequestParam("username") String username, @RequestParam("logueado") String logueado) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.getTipoRelacion(logueado, username);
	}
	
	@RequestMapping(value = "/eliminaAmigo", method = RequestMethod.POST)
	public boolean eliminaAmigo(@RequestParam("username") String username, @RequestParam("logueado") String logueado) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.eliminarAmigo(logueado, username);
	}
	
	@RequestMapping(value = "/bloqueaUsuario", method = RequestMethod.POST)
	public boolean bloqueaUsuario(@RequestParam("username") String username, @RequestParam("logueado") String logueado) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.bloqueaUsuario(logueado, username);
	}
	
	@RequestMapping(value = "/desbloqueaUsuario", method = RequestMethod.POST)
	public boolean desbloqueaUsuario(@RequestParam("username") String username, @RequestParam("logueado") String logueado) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.desbloqueaUsuario(logueado, username);
	}
	
	@RequestMapping(value = "/aceptaPdA", method = RequestMethod.POST)
	public boolean aceptaPdA(@RequestParam("username") String username, @RequestParam("logueado") String logueado) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.aceptaPdA(logueado, username);
	}
	
	@RequestMapping(value = "/rechazaPdA", method = RequestMethod.POST)
	public boolean rechazaPdA(@RequestParam("username") String username, @RequestParam("logueado") String logueado) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.rechazaPdA(logueado, username);
	}
	
	@RequestMapping(value = "/enviarPdA", method = RequestMethod.POST)
	public boolean enviarPdA(@RequestParam("username") String username, @RequestParam("logueado") String logueado) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.enviarPdA(logueado, username);
	}
	
}