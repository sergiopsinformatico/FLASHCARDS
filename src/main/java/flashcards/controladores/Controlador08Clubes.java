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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.auxiliares.GeneratorStrings;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.dto.ClubDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")

public class Controlador08Clubes {
	
	ModelAndView vista;
	ClubDTO club;
	InterfaceDAOClub dBClub;
	String idClub;
	Fecha fecha;
	List<String> miembros;
	
	//Constantes
	static final String CONST_USUARIO = "usuario";
	static final String CONST_REDIRECT_INICIO = "redirect:/inicio.html";
	
	@RequestMapping(value = "/verClubes", method = RequestMethod.GET)
	public ModelAndView getClubes(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaClubes");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
	//Metodo auxiliar get usernames en vista registro
	@RequestMapping(value = "/getTodosClubes", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<ClubDTO> getTodosClubes(HttpServletRequest request, HttpServletResponse response){
		dBClub = Broker.getInstanciaClub();
		return dBClub.getTodosClubes(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
	}
	
	@RequestMapping(value = "/getClubesCreados", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<ClubDTO> getClubesCreados(HttpServletRequest request, HttpServletResponse response){
		dBClub = Broker.getInstanciaClub();
		return dBClub.getMisClubes(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
	}
	
	@RequestMapping(value = "/getClubesPertenezco", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<ClubDTO> getClubesPertenezco(HttpServletRequest request, HttpServletResponse response){
		dBClub = Broker.getInstanciaClub();
		return dBClub.getClubesPertenezco(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
	}
	
	@RequestMapping(value = "/crearClub", method = RequestMethod.POST)
	public ModelAndView crearClubes(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			dBClub = Broker.getInstanciaClub();
			fecha = new Fecha();
			
			do {
				
				idClub = GeneratorStrings.randomString(10);
				
			}while(dBClub.existeIdClub(idClub));
			
			miembros = new LinkedList<String>();
			miembros.add(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
			
			club = new ClubDTO(idClub, request.getParameter("nombre"), request.getParameter("tema"),
					((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), 
					miembros, fecha.fechaHoy());
			
			vista = new ModelAndView("vistaClubes");
			
			if(dBClub.insertaClub(club)) {
				vista.addObject("mensaje", "Se ha creado el club "+club.getNombreClub()+" correctamente");
			}else {
				vista.addObject("mensaje", "Error al crear el club");
			}
			
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
}
