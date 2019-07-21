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

import main.java.flashcards.auxiliares.Fecha;
import main.java.flashcards.auxiliares.GeneratorStrings;
import main.java.flashcards.brokers.Broker;
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.db.dao.InterfaceDAOFlashcards;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.dto.ClubDTO;
import main.java.flashcards.dto.FlashcardsDTO;
import main.java.flashcards.dto.TarjetaDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")

public class Controlador09Flashcards {
	
	//Variables
	ModelAndView vista;
	InterfaceDAOClub dBClub;
	InterfaceDAORelacionesUsuarios dBRelaciones;
	InterfaceDAOFlashcards dBFlashcards;
	List<TarjetaDTO> tarjetas;
	FlashcardsDTO flashcard;
	int indice;
	String idFlashcards;
	Fecha hoy;
	List<FlashcardsDTO> listaColecciones;
	List<ClubDTO> listaClubes;
	List<String[]> tarjetasArray;
	String[] tarjeta;
	
	//Constantes
	static final String CONST_USUARIO = "usuario";
	static final String CONST_REDIRECT_INICIO = "redirect:/inicio.html";
	static final String CONST_TIPO_COMPARTIR = "tipoCompartir";
	
	@RequestMapping(value = "/flashcards", method = RequestMethod.GET)
	public ModelAndView flashcards(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaFlashcards");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
	@RequestMapping(value = "/crearColeccion", method = RequestMethod.GET)
	public ModelAndView crearColeccion(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaFlashcardsCrear");
			tarjetas = new LinkedList<>();
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
	//Metodo auxiliar get usernames en vista registro
	@RequestMapping(value = "/getClubesFlashcards", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<ClubDTO> getClubesFlashcards(HttpServletRequest request, HttpServletResponse response){
		dBClub = Broker.getInstanciaClub();
		return dBClub.getClubesPertenezco(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
	}
	
	//Metodo auxiliar get usernames en vista registro
	@RequestMapping(value = "/getAmigosFlashcards", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<String> getAmigosFlashcards(HttpServletRequest request, HttpServletResponse response){
		dBRelaciones = Broker.getInstanciaRelaciones();
		return dBRelaciones.getAmigos(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
	}
	
	//Metodo auxiliar get usernames en vista registro
	@RequestMapping(value = "/addTarjeta", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public boolean addTarjeta(@RequestParam("anverso") String anverso, @RequestParam("reverso") String reverso, HttpServletRequest request, HttpServletResponse response){
		try {
			tarjetas.add(new TarjetaDTO(anverso, reverso));
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	//Metodo auxiliar get usernames en vista registro
	@RequestMapping(value = "/deleteTarjeta", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public boolean deleteTarjeta(@RequestParam("anverso") String anverso, @RequestParam("reverso") String reverso, HttpServletRequest request, HttpServletResponse response){
		try {
			for(indice=0; indice<tarjetas.size(); indice++) {
				if(tarjetas.get(indice).getAnverso().equals(anverso) &&
				   tarjetas.get(indice).getReverso().equals(reverso)) {
					tarjetas.remove(indice);
					indice = tarjetas.size();
				}
			}
			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	
	@RequestMapping(value = "/guardarColeccionFlashcards", method = RequestMethod.POST)
	public ModelAndView guardarColeccionFlashcards(HttpServletRequest request, HttpServletResponse response) {
		
		dBFlashcards = Broker.getInstanciaFlashcards();
		idFlashcards = GeneratorStrings.randomString(12);
		
		while(dBFlashcards.existeIdColeccion(idFlashcards)) {
			idFlashcards = GeneratorStrings.randomString(12);
		}
		
		hoy = new Fecha();
		
		if(request.getParameter(CONST_TIPO_COMPARTIR).equals("publico") || request.getParameter(CONST_TIPO_COMPARTIR).equals("privado")) {
			flashcard = new FlashcardsDTO(idFlashcards, request.getParameter("nombreColeccion"), request.getParameter("temaColeccion"), 
					((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), tarjetas, request.getParameter(CONST_TIPO_COMPARTIR), "");
		}else {
			flashcard = new FlashcardsDTO(idFlashcards, request.getParameter("nombreColeccion"), request.getParameter("temaColeccion"),
					((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername(), tarjetas, request.getParameter(CONST_TIPO_COMPARTIR), request.getParameter("compartirCon"));
		}
		
		flashcard.setFechaCreacion(hoy.fechaHoy());
		flashcard.setEvaluada(false);
		flashcard.setEvaluador("");
		
		vista = new ModelAndView("vistaFlashcards");
		
		if(dBFlashcards.crearFlashcards(flashcard)) {
			vista.addObject("mensaje", "Se ha creado correctamente la coleccion "+flashcard.getNombreColeccion()+". Pendiente de evaluar por un moderador.");
		}else {
			vista.addObject("mensaje", "Ups! Hubo un error al crear la coleccion "+flashcard.getNombreColeccion());
		}
		
		return vista;
	}
	
	
	@RequestMapping(value = "/guardarColeccionFlashcards", method = RequestMethod.GET)
	public ModelAndView guardarColeccionFlashcardsGet(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaFlashcardsCrear");
			tarjetas = new LinkedList<>();
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
	
	
	@RequestMapping(value = "/verColecciones", method = RequestMethod.GET)
	public ModelAndView verColecciones(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaFlashcardsColecciones");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}	
	
	
	
	@RequestMapping(value = "/coleccionesVisiblesParaMi", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<FlashcardsDTO> coleccionesVisiblesParaMi(HttpServletRequest request, HttpServletResponse response){
		try {
			listaColecciones = Broker.getInstanciaFlashcards().listarColeccionesVisibles(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		}catch(Exception ex) {
			listaColecciones = new LinkedList<>();
		}
		
		return listaColecciones;
	}
	
	@RequestMapping(value = "/coleccionesCreadasEvaluadas", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<FlashcardsDTO> coleccionesCreadasEvaluadas(HttpServletRequest request, HttpServletResponse response){
		try {
			listaColecciones = Broker.getInstanciaFlashcards().coleccionesCreadasVisibles(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		}catch(Exception ex) {
			listaColecciones = new LinkedList<>();
		}
		
		return listaColecciones;
	}
	
	@RequestMapping(value = "/coleccionesCreadasPendienteEvaluar", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<FlashcardsDTO> coleccionesCreadasPendienteEvaluar(HttpServletRequest request, HttpServletResponse response){
		try {
			listaColecciones = Broker.getInstanciaFlashcards().coleccionesCreadasSinEvaluar(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		}catch(Exception ex) {
			listaColecciones = new LinkedList<>();
		}
		
		return listaColecciones;
	}
	
	@RequestMapping(value = "/clubesFlashcards", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<ClubDTO> clubesFlashcards(HttpServletRequest request, HttpServletResponse response){
		try {
			listaClubes = Broker.getInstanciaClub().todosClubesCreados();
		}catch(Exception ex) {
			listaClubes = new LinkedList<>();
		}
		
		return listaClubes;
	}
	
	@RequestMapping(value = "/verColeccion", method = RequestMethod.GET)
	public ModelAndView verColeccion(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaFlashcardsVisualizar");
			flashcard = Broker.getInstanciaFlashcards().leerFlashcard(id);
			
			if(flashcard.getTipoCompartir().equals("club")) {
				flashcard.setCompartirCon(Broker.getInstanciaClub().leerClub(flashcard.getCompartirCon(), ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()).getNombreClub());
			}
			vista.addObject("flashcard", flashcard);
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
}
