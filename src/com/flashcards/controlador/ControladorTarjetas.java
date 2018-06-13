package com.flashcards.controlador;

import java.util.LinkedList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.flashcards.dao.GestionAmigos;
import com.flashcards.dao.GestionClubes;
import com.flashcards.dao.GestionUsuarios;
import com.flashcards.modelo.Flashcard;
import com.flashcards.modelo.Tarjeta;

@Controller
public class ControladorTarjetas {
	
	LinkedList<Tarjeta> tarjetas = new LinkedList<Tarjeta>();
	GestionClubes gC = new GestionClubes();
	GestionUsuarios gU = new GestionUsuarios();
	GestionAmigos gA = new GestionAmigos();
	JSONObject parser;
	ModelAndView vista;
	Tarjeta t;
	int i;
	Flashcard flash;
	
	public String readJSON(String json, String tag) {
		parser = new JSONObject(json);
		return parser.getString(tag);
	}
	
	@RequestMapping(value = "/crearColeccion", method = RequestMethod.GET)
	public ModelAndView crearColeccion(@RequestParam("usuario") String usuario) {
		vista = new ModelAndView("creaTarjeta");
		vista.addObject("clubes", gC.leerClubesUsuarioJSON(usuario));
		vista.addObject("amigos", gA.getAmigosJSON(usuario));
		return vista;
	}
	
	@RequestMapping(value = "/tarjeta", method = RequestMethod.POST)
	public void insertarTarjeta(@RequestBody String json) {
		tarjetas.add(new Tarjeta(readJSON(json, "enunciado"), readJSON(json, "respuesta")));
	}
	
	@RequestMapping(value = "/eliminarTarjeta", method = RequestMethod.POST)
	public void eliminaTarjeta(@RequestBody String json) {
		for(i=0; i<tarjetas.size(); i++) {
			t = tarjetas.get(i);
			if(t.getEnunciado().equals(readJSON(json, "enunciado")) && t.getRespuesta().equals(readJSON(json, "respuesta"))) {
				tarjetas.remove(i);
				i=0;
			}
		}
	}

	@RequestMapping(value = "/guardarFlashcard", method = RequestMethod.POST)
	public ModelAndView guardarFlashcard(HttpServletRequest request, HttpServletResponse response) {
		flash = new Flashcard(tarjetas, request.getParameter("creador"), request.getParameter("nombre"), request.getParameter("shareWith"));
		if(flash.getColeccion().size()==0) {
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
		}
	}
	
}
