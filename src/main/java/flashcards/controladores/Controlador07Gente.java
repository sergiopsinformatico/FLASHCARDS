package main.java.flashcards.controladores;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.dto.RelacionesUsuariosDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")

public class Controlador07Gente {
	
	//Variables
	ModelAndView vista;
	
	InterfaceDAOUsuario dBUsuario;
	InterfaceDAORelacionesUsuarios dBRelaciones;
	
	RelacionesUsuariosDTO relaciones;
	
	List<UsuarioDTO> lista;
	List<UsuarioDTO> listaTodos;
	
	List<String> amigos;
	List<String> bloqueadores;
	List<String> bloqueados;
	List<String> pdaEnv;
	List<String> pdaRec;
	
	UsuarioDTO eUsuario;
	String tipoRelacion;
	
	int indice;
	int indiceTodos;
	boolean encontrado;
	
	//Constantes
	static final String CONST_USUARIO = "usuario";
	static final String CONST_REDIRECT_INICIO = "redirect:/inicio.html";
	static final String CONST_REDIRECT_PERFIL = "redirect:/verPerfil.html?usuarioPerfil=";
	static final String CONST_MENSAJE = "mensaje";
	
	@RequestMapping(value = "/verGente", method = RequestMethod.GET)
	public ModelAndView gente(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaGente");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
	@RequestMapping(value = "/getTodosUsuarios", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> getTodosUsuarios(HttpServletRequest request, HttpServletResponse response){
		dBUsuario = Broker.getInstanciaUsuario();
		listaTodos = dBUsuario.getAllUsuarios(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		dBRelaciones = Broker.getInstanciaRelaciones();
		lista = new LinkedList<>();
		
		for(indice=0; indice<listaTodos.size(); indice++) {
			tipoRelacion = dBRelaciones.tipoRelacion(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), listaTodos.get(indice).getUsername());
			if(!(tipoRelacion.equals(""))) {
				eUsuario = listaTodos.get(indice);
				eUsuario.setTipoRelacion(tipoRelacion);
				lista.add(eUsuario);
			}
		}
		
		return lista;
	}
	
	@RequestMapping(value = "/getAmigos", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> getAmigos(HttpServletRequest request, HttpServletResponse response){
		dBUsuario = Broker.getInstanciaUsuario();
		dBRelaciones = Broker.getInstanciaRelaciones();
		
		amigos = dBRelaciones.getAmigos(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		
		lista = new LinkedList<>();
		
		for(indice=0; indice<amigos.size(); indice++) {
			eUsuario = dBUsuario.getUsuarioDTO(amigos.get(indice));
			eUsuario.setTipoRelacion("amigo");
			lista.add(eUsuario);
		}
		
		return lista;
	}
	
	@RequestMapping(value = "/getPdaRec", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> getPdaRec(HttpServletRequest request, HttpServletResponse response){
		dBUsuario = Broker.getInstanciaUsuario();
		dBRelaciones = Broker.getInstanciaRelaciones();
		
		pdaRec = dBRelaciones.getPeticionesRecibidas(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		
		lista = new LinkedList<>();
		
		for(indice=0; indice<pdaRec.size(); indice++) {
			eUsuario = dBUsuario.getUsuarioDTO(pdaRec.get(indice));
			eUsuario.setTipoRelacion("solRecibida");
			lista.add(eUsuario);
		}
		
		return lista;
	}
	
	@RequestMapping(value = "/getPdaEnv", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> getPdaEnv(HttpServletRequest request, HttpServletResponse response){
		dBUsuario = Broker.getInstanciaUsuario();
		dBRelaciones = Broker.getInstanciaRelaciones();
		
		pdaEnv = dBRelaciones.getPeticionesAmistadEnviadas(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		
		lista = new LinkedList<>();
		
		for(indice=0; indice<pdaEnv.size(); indice++) {
			eUsuario = dBUsuario.getUsuarioDTO(pdaEnv.get(indice));
			eUsuario.setTipoRelacion("solEnviada");
			lista.add(eUsuario);
		}
		
		return lista;
	}
	
	@RequestMapping(value = "/getBloqueados", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> getBloqueados(HttpServletRequest request, HttpServletResponse response){
		dBUsuario = Broker.getInstanciaUsuario();
		dBRelaciones = Broker.getInstanciaRelaciones();
		
		bloqueados = dBRelaciones.getBloqueados(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		
		lista = new LinkedList<>();
		
		for(indice=0; indice<bloqueados.size(); indice++) {
			eUsuario = dBUsuario.getUsuarioDTO(bloqueados.get(indice));
			eUsuario.setTipoRelacion("bloqueado");
			lista.add(eUsuario);
		}
		
		return lista;
	}
	
	@RequestMapping(value = "/eliminarAmigo", method = RequestMethod.GET)
	public ModelAndView eliminarAmigo(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response){
		
		vista = new ModelAndView(CONST_REDIRECT_PERFIL+username);
		
		dBRelaciones = Broker.getInstanciaRelaciones();
		dBRelaciones.eliminarAmigo(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), username);
		
		vista.addObject(CONST_MENSAJE, username+" ya no es su amigo");
			
		return vista;
	}
	
	@RequestMapping(value = "/aceptarAmistad", method = RequestMethod.GET)
	public ModelAndView aceptarAmistad(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response){
		
		vista = new ModelAndView(CONST_REDIRECT_PERFIL+username);
		
		dBRelaciones = Broker.getInstanciaRelaciones();
		dBRelaciones.aceptarInvitacion(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), username);
		
		vista.addObject(CONST_MENSAJE, username+" y tu sois amigos");
			
		return vista;
	}
	
	@RequestMapping(value = "/rechazarAmistad", method = RequestMethod.GET)
	public ModelAndView rechazarAmistad(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response){
		
		vista = new ModelAndView(CONST_REDIRECT_PERFIL+username);
		
		dBRelaciones = Broker.getInstanciaRelaciones();
		dBRelaciones.rechazarInvitacion(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), username);
		
		vista.addObject(CONST_MENSAJE, "Rechazada la solicitud de amistad de "+username);
		
		return vista;
	}
	
	@RequestMapping(value = "/enviarPeticion", method = RequestMethod.GET)
	public ModelAndView enviarPeticion(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response){
		
		vista = new ModelAndView(CONST_REDIRECT_PERFIL+username);
		
		dBRelaciones = Broker.getInstanciaRelaciones();
		dBRelaciones.enviarPeticionAmistad(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), username);
		
		vista.addObject(CONST_MENSAJE, "Ha enviado una solicitud de amistad a "+username);
		
		return vista;
	}
	
	@RequestMapping(value = "/bloquearUsuario", method = RequestMethod.GET)
	public ModelAndView bloquearUsuario(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response){
		
		vista = new ModelAndView(CONST_REDIRECT_PERFIL+username);
		
		dBRelaciones = Broker.getInstanciaRelaciones();
		dBRelaciones.bloquearUsuario(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), username);
		
		vista.addObject(CONST_MENSAJE, "Ha bloqueado a " + username);
		
		return vista;
	}
	
	@RequestMapping(value = "/desbloquearUsuario", method = RequestMethod.GET)
	public ModelAndView desbloquearUsuario(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response){
		
		vista = new ModelAndView(CONST_REDIRECT_PERFIL+username);
		
		dBRelaciones = Broker.getInstanciaRelaciones();
		dBRelaciones.desbloquearUsuario(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), username);
		
		vista.addObject(CONST_MENSAJE, "Ha desbloqueado a " + username);
		
		return vista;
	}
	
}
