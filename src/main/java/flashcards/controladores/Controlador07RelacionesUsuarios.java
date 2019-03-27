package main.java.flashcards.controladores;
import java.util.ArrayList;
import java.util.LinkedList;
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
	ArrayList<String> lista;
	List<UsuarioDTO> listaBas;
	List<UsuarioDTO> listaDef;
	UsuarioDTO user;
	int indice;
	int indiceDos;
	boolean encontrado;
	
	@RequestMapping(value = "/personas", method = RequestMethod.GET)
	public ModelAndView personas(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("vistaPersonas");
		return vista;
	}	
	
	
	@RequestMapping(value = "/allPeople", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<UsuarioDTO> allPeople(@RequestParam("username") String username) {
		dBUsuario = Broker.getInstanciaUsuario();
		dBRelacion = Broker.getInstanciaRelacion();
		
		listaBas = dBUsuario.getAllUsersSystem(username);
		
		relacion = dBRelacion.leerRelacionUsuario(username);
		lista = relacion.getBloqueadoPor();
		
		listaDef = new LinkedList<UsuarioDTO>();
		
		for(indice=0; indice<listaBas.size(); indice++) {
			user = listaBas.get(indice);
			encontrado = false;
			for(indiceDos=0; indiceDos<lista.size(); indiceDos++) {
				if(lista.get(indiceDos).equals(user.getUsername())) {
					encontrado = true;
				}
			}
		}
		return listaDef;
	}
	
	@RequestMapping(value = "/verUsuario", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ModelAndView verUsuario(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		dBUsuario = Broker.getInstanciaUsuario();
		
		relacion = dBRelacion.leerRelacionUsuario(username);
		
		vista = new ModelAndView("vistaPerfil");
		vista.addObject("perfil", dBUsuario.getUsuarioDTO(username));
		
		encontrado = false;
		
		lista = relacion.getAmigos();
		for(indice=0; indice<lista.size(); indice++) {
			if(lista.get(indice).equals(username)) {
				encontrado = true;
				vista.addObject("relacion", "amigos");
				break;
			}
		}
		
		if(!encontrado) {
			lista = relacion.getBloqueados();
			for(indice=0; indice<lista.size(); indice++) {
				if(lista.get(indice).equals(username)) {
					encontrado = true;
					vista.addObject("relacion", "bloqueado");
					break;
				}
			}
			if(!encontrado) {
				
				lista = relacion.getPeticionesEnviadas();
				for(indice=0; indice<lista.size(); indice++) {
					if(lista.get(indice).equals(username)) {
						encontrado = true;
						vista.addObject("relacion", "pdaEnvia");
						break;
					}
				}
				
				if(!encontrado) {
					lista = relacion.getPeticionesRecibidas();
					for(indice=0; indice<lista.size(); indice++) {
						if(lista.get(indice).equals(username)) {
							encontrado = true;
							vista.addObject("relacion", "pdaRecibe");
							break;
						}
					}
					
					if(!encontrado) {
						vista.addObject("relacion", "none");
					}
				}
			}
		}
		
		
		
		return vista;
	}
	
	/*@RequestMapping(value = "/amigos", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> getAmigos(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getAmigos();
	}
	
	@RequestMapping(value = "/pdaEnv", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> getPdAEnv(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getPeticionesEnviadas();
	}
	
	@RequestMapping(value = "/pdaRec", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> getPdARec(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getPeticionesRecibidas();
	}
	
	@RequestMapping(value = "/bloqueados", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> getBloqueados(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getBloqueados();
	}
	
	@RequestMapping(value = "/bloqueadores", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> getBloqueadores(@RequestParam("username") String username) {
		dBRelacion = Broker.getInstanciaRelacion();
		return dBRelacion.leerRelacionUsuario(username).getBloqueadoPor();
	}*/
	
}