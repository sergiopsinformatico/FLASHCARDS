package com.flashcards.controlador;

import java.io.IOException;
import java.util.LinkedList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.db.gestores.GestionAmigos;
import com.flashcards.db.gestores.GestionClubes;
import com.flashcards.db.gestores.GestionFlashcards;
import com.flashcards.db.gestores.GestionSolicitudModerador;
import com.flashcards.db.gestores.GestorUsuarios;
import com.flashcards.modelo.Flashcard;
import com.flashcards.modelo.SolicitudModerador;
import com.flashcards.modelo.Tarjeta;
import com.flashcards.modelo.UsuarioDTO;

@Controller
public class ControladorTarjetas {
	
	LinkedList<Tarjeta> tarjetas = new LinkedList<Tarjeta>();
	GestionClubes gC = new GestionClubes();
	GestorUsuarios gU = new GestorUsuarios();
	GestionAmigos gA = new GestionAmigos();
	GestionFlashcards gF = new GestionFlashcards();
	GestionSolicitudModerador gSM;
	JSONObject parser;
	ModelAndView vista;
	Tarjeta t;
	int i;
	Flashcard flash;
	UsuarioDTO user;
	String identificador;
	Random r = new Random();
	
	public String readJSON(String json, String tag) {
		parser = new JSONObject(json);
		return parser.getString(tag);
	}
	
	@RequestMapping(value = "/crearColeccion", method = RequestMethod.GET)
	public ModelAndView crearColeccion(HttpServletRequest request, HttpServletResponse response) {
		vista = new ModelAndView("creaColeccion");
		tarjetas = new LinkedList<Tarjeta>();
		user = (UsuarioDTO)request.getSession().getAttribute("usuario");
		vista.addObject("clubes", gC.leerClubesUsuarioJSON(user.getUsuario()));
		vista.addObject("amigos", gA.getAmigosJSON(user.getUsuario()));
		vista.addObject("usuario", user);
		return vista;
	}
	
	@RequestMapping(value = "/tarjeta", method = RequestMethod.POST)
	public void insertarTarjeta(@RequestBody String json) {
		tarjetas.add(new Tarjeta(readJSON(json, "anverso"), readJSON(json, "reverso")));
	}
	
	@RequestMapping(value = "/eliminarTarjeta", method = RequestMethod.POST)
	public void eliminaTarjeta(@RequestBody String json) {
		for(i=0; i<tarjetas.size(); i++) {
			t = tarjetas.get(i);
			if(t.getAnverso().equals(readJSON(json, "anverso")) && t.getReverso().equals(readJSON(json, "reverso"))) {
				tarjetas.remove(i);
				i = tarjetas.size();
			}
		}
	}
	
	@RequestMapping(value = "/serModerador", method = RequestMethod.POST)
	public void serModerador(HttpServletRequest request, HttpServletResponse response) {
		gSM = new GestionSolicitudModerador();
		gSM.insertarSolicitud(new SolicitudModerador(request.getParameter("usuario")));
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/flashcards.html?usuario="+request.getParameter("usuario"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/verFlashcard", method = RequestMethod.GET)
	public ModelAndView verFlashcard(@RequestParam("usuario") String usuario, @RequestParam("coleccion") String coleccion) {
		gU = new GestorUsuarios();
		gF = new GestionFlashcards();
		vista = new ModelAndView("verFlashcard");
		flash = gF.leerFlashcard(coleccion);
		String tarjeta = flash.getColeccionJSON();
		vista.addObject("usuario", gU.leerUsuario(usuario));
		vista.addObject("nombre", flash.getNombreColeccion());
		vista.addObject("coleccion", tarjeta);
		return vista;
	}

	@RequestMapping(value = "/guardarFlashcard", method = RequestMethod.POST)
	public ModelAndView guardarFlashcard(HttpServletRequest request, HttpServletResponse response) {
		flash = new Flashcard();
		user = (UsuarioDTO)request.getSession().getAttribute("usuario");
		flash.setCreador(user.getUsuario());
		flash.setColeccion(tarjetas);
		flash.setNombreColeccion(request.getParameter("nombre"));
		flash.setDescripcion(request.getParameter("descripcion"));
		flash.setEvaluado(false);
		flash.setEvaluador("");
		flash.setCompartido(request.getParameter("shareWith"));
		switch(flash.getCompartido()) {
			case "publico":
				do {
					identificador = "publico-"+flash.getCreador()+ r.nextInt(2000000)+ r.nextInt(2000000);
				}while(gF.existeIdentificador(identificador));
				flash.setIdentificador(identificador);
				flash.setNombreCompartido("todos");
				break;
			case "privado":
				do {
					identificador = "privado-"+flash.getCreador()+ r.nextInt(2000000)+ r.nextInt(2000000);
				}while(gF.existeIdentificador(identificador));
				flash.setIdentificador(identificador);
				flash.setNombreCompartido(user.getUsuario());
				break;
			case "club":
				do {
					identificador = "club-"+flash.getCreador()+ r.nextInt(2000000)+ r.nextInt(2000000);
				}while(gF.existeIdentificador(identificador));
				flash.setIdentificador(identificador);
				if(request.getParameter("selectClub")==null || request.getParameter("selectClub").equals("")) {
					vista = new ModelAndView("creaColeccion");
					user = (UsuarioDTO)request.getSession().getAttribute("usuario");
					vista.addObject("usuario", user);
					vista.addObject("clubes", gC.leerClubesUsuarioJSON(user.getUsuario()));
					vista.addObject("amigos", gA.getAmigosJSON(user.getUsuario()));
					vista.addObject("crea", flash.getCreador());
					vista.addObject("name", flash.getNombreColeccion());
					vista.addObject("description", flash.getDescripcion());
					vista.addObject("shareWith", "club");
					vista.addObject("cards", flash.getColeccionJSON());
					vista.addObject("mensaje", "No ha seleccionado el nombre del club");
					return vista;
				}else {
					flash.setNombreCompartido(request.getParameter("selectClub"));
				}
				
				break;
			case "usuario":
				do {
					identificador = "usuario-"+flash.getCreador()+ r.nextInt(2000000)+ r.nextInt(2000000);
				}while(gF.existeIdentificador(identificador));
				flash.setIdentificador(identificador);
				if(request.getParameter("selectUsuario")==null || request.getParameter("selectUsuario").equals("")) {
					vista = new ModelAndView("creaColeccion");
					user = (UsuarioDTO)request.getSession().getAttribute("usuario");
					vista.addObject("usuario", user);
					vista.addObject("clubes", gC.leerClubesUsuarioJSON(user.getUsuario()));
					vista.addObject("amigos", gA.getAmigosJSON(user.getUsuario()));
					vista.addObject("crea", flash.getCreador());
					vista.addObject("name", flash.getNombreColeccion());
					vista.addObject("description", flash.getDescripcion());
					vista.addObject("shareWith", "usuario");
					vista.addObject("cards", flash.getColeccionJSON());
					vista.addObject("mensaje", "No ha seleccionado a un usuario");
					return vista;
				}else {
					flash.setNombreCompartido(request.getParameter("selectUsuario"));
				}
				break;
		}
		
		if(tarjetas.size()==0) {
			vista = new ModelAndView("creaColeccion");
			user = (UsuarioDTO)request.getSession().getAttribute("usuario");
			vista.addObject("usuario",user);
			vista.addObject("clubes", gC.leerClubesUsuarioJSON(user.getUsuario()));
			vista.addObject("amigos", gA.getAmigosJSON(user.getUsuario()));
			vista.addObject("crea", flash.getCreador());
			vista.addObject("name", flash.getNombreColeccion());
			vista.addObject("description", flash.getDescripcion());
			vista.addObject("shareWith", flash.getCompartido());
			vista.addObject("shareOptionWith", flash.getNombreCompartido());
			vista.addObject("mensaje", "La colección debe estar formada por al menos una tarjeta");
			return vista;
		}else {
			gF.insertarFlashcard(flash);
			vista = new ModelAndView("flashcards");
			user = (UsuarioDTO)request.getSession().getAttribute("usuario");
			vista.addObject("mensaje", "Coleccion Creada Correctamente");
			vista.addObject("usuario",user);
			return vista;
		}
		
		/*if(flash.getColeccion().size()==0) {
			vista = new ModelAndView("creaTarjeta");
			vista.addObject("flashcard", flash);
			vista.addObject("mensaje", "La colección debe contener al menos 1 tarjeta.");
			return vista;
		}else {
			if(flash.getNombreColeccion()==null || flash.getNombreColeccion()=="") {
				vista = new ModelAndView("creaTarjeta");
				vista.addObject("flashcard", flash);
				vista.addObject("mensaje", "El campo nombre de colección, no puede estar vacío.");
				return vista;
			}else {
				if(flash.getCompartido().equals("club") && (request.getParameter("nClub")==null || request.getParameter("nClub")=="")) {
					vista = new ModelAndView("creaTarjeta");
					vista.addObject("flashcard", flash);
					vista.addObject("mensaje", "El campo nombre del club, no puede estar vacío.");
					return vista;
				}else if(flash.getCompartido().equals("usuario") && (request.getParameter("nUsuario")==null || request.getParameter("nUsuario")=="")) {
					vista = new ModelAndView("creaTarjeta");
					vista.addObject("flashcard", flash);
					vista.addObject("mensaje", "El campo nombre del usuario, no puede estar vacío.");
					return vista;
				}else {
					if(flash.getCompartido().equals("club")) {
						if(gC.existeClub(request.getParameter("nClub"))) {
							flash.setNombreCompartido(request.getParameter("nClub"));
						}else {
							vista = new ModelAndView("creaTarjeta");
							vista.addObject("flashcard", flash);
							vista.addObject("mensaje", "El nombre del club que ha introducido, no existe.");
							return vista;
						}
					}else if(flash.getCompartido().equals("usuario")) {
						if(gU.existeUsername(request.getParameter("nUsuario")) || gU.existeEmail(request.getParameter("nUsuario"))) {
							flash.setNombreCompartido(request.getParameter("nUsuario"));
						}else {
							vista = new ModelAndView("creaTarjeta");
							vista.addObject("flashcard", flash);
							vista.addObject("mensaje", "El nombre del usuario que ha introducido, no existe.");
							return vista;
						}						
					}
					//GUARDAR TARJETA DB
					vista = new ModelAndView("principal");
					vista.addObject("mensaje", "Se ha creado la colección correctamente.");
					return vista;
				}
			}
		}*/
	}
	
}
