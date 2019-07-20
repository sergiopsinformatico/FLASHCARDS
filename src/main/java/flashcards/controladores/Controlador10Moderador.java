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
import main.java.flashcards.dto.FlashcardsDTO;
import main.java.flashcards.dto.TarjetaDTO;
import main.java.flashcards.dto.UsuarioDTO;

@Controller
@SessionAttributes("usuario")

public class Controlador10Moderador {
	
	//Variables
	ModelAndView vista;
	List<FlashcardsDTO> listaColecciones;
	String nombreColeccion;
	FlashcardsDTO flashcard;
		
	//Constantes
	static final String CONST_USUARIO = "usuario";
	static final String CONST_REDIRECT_INICIO = "redirect:/inicio.html";
	
	//Moderador Evalua Coleccion
	
	@RequestMapping(value = "/evaluarColecciones", method = RequestMethod.GET)
	public ModelAndView evaluarColecciones(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
		   ((((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) ||
			(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Moderador")))) {
			
			vista = new ModelAndView("vistaFlashcardsEvaluar");
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		return vista;
	}
	
	@RequestMapping(value = "/coleccionesSinEvaluar", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<FlashcardsDTO> coleccionesSinEvaluar(HttpServletRequest request, HttpServletResponse response){
		try {
			listaColecciones = Broker.getInstanciaFlashcards().consultaSinEvaluar(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		}catch(Exception ex) {
			listaColecciones = new LinkedList<>();
		}
		
		return listaColecciones;
	}
	
	@RequestMapping(value = "/evaluarColeccion", method = RequestMethod.GET)
	public ModelAndView evaluarColeccion(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="") {
			
			vista = new ModelAndView("vistaFlashcardsAnalizarColeccion");
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
	
	@RequestMapping(value = "/evaluacionPositiva", method = RequestMethod.GET)
	public ModelAndView evaluacionPositiva(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("vistaFlashcardsEvaluar");
		Broker.getInstanciaFlashcards().valoraPositivamente(id, ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername());
		vista.addObject("mensaje", "La coleccion se ha evaluado positivamente");
		return vista;
	}
	
	@RequestMapping(value = "/evaluacionNegativa", method = RequestMethod.GET)
	public ModelAndView evaluacionNegativa(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("vistaFlashcardsEvaluar");
		Broker.getInstanciaFlashcards().valoraNegativamente(id);
		vista.addObject("mensaje", "La coleccion se ha evaluado negativamente y por tanto ha sido eliminada");
		return vista;
	}
	
	@RequestMapping(value = "/getTarjetasColeccion", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<TarjetaDTO> getTarjetasColeccion(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response){
		
		return Broker.getInstanciaFlashcards().leerFlashcard(id).getTarjetas();
	}
	
	//Moderador Elimina Flashcards
	
	
	@RequestMapping(value = "/gestionarFlashcards", method = RequestMethod.GET)
	public ModelAndView gestionarFlashcards(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute(CONST_USUARIO)!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!=null && 
		   ((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getUsername()!="" &&
		   ((((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Administrador")) ||
			(((UsuarioDTO)(request.getSession().getAttribute(CONST_USUARIO))).getRol().equals("Moderador")))) {
			
			vista = new ModelAndView("vistaGestionFlashcards");
			
		
		}else {
			vista = new ModelAndView(CONST_REDIRECT_INICIO);
		}
		
		return vista;
	}
	
	
	@RequestMapping(value = "/getColeccionesModerador", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public List<FlashcardsDTO> getColeccionesModerador(HttpServletRequest request, HttpServletResponse response){
		try {
			listaColecciones = Broker.getInstanciaFlashcards().listarTodasColeccionesModerador();
		}catch(Exception ex) {
			listaColecciones = new LinkedList<>();
		}
		
		return listaColecciones;
	}
	
	
	@RequestMapping(value = "/eliminaColeccionModerador", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public ModelAndView eliminaColeccionModerador(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response){
		try {
			
			vista = new ModelAndView("vistaGestionFlashcards");
			nombreColeccion = Broker.getInstanciaFlashcards().leerFlashcard(id).getNombreColeccion();
			
			if(Broker.getInstanciaFlashcards().eliminarFlashcard(id)) {
				vista.addObject("mensaje", "Se ha eliminado la coleccion "+nombreColeccion);
			}else {
				vista.addObject("mensaje", "No se pudo eliminar la coleccion "+nombreColeccion);
			}
			
		}catch(Exception ex) {
			vista.addObject("mensaje", "Hubo un problema con la conexion");
		}
		
		return vista;
	}	
	
}
