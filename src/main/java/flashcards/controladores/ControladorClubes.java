package main.java.flashcards.controladores;

import org.springframework.stereotype.Controller;

@Controller
public class ControladorClubes {
	/*GestorUsuarios gU = new GestorUsuarios();
	String identificador;
	Random r = new Random();
	Club club;
	GestionAcceso gA;
	SolicitudAcceso sA;
	
	@RequestMapping(value = "/crearClub", method = RequestMethod.POST)
	public void crearClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		do {
			identificador = r.nextInt(2000000)+request.getParameter("usuario")+"-"+"Club"+r.nextInt(2000000)+r.nextInt(2000000);
		}while(gC.existeClubIdentificador(identificador));
		club = new Club(identificador, request.getParameter("nClub"), request.getParameter("usuario"), request.getParameter("descripcionClub"));
		gC.crearClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/clubes.html?usuario="+request.getParameter("usuario"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/verClub", method = RequestMethod.GET)
	public ModelAndView verClub(@RequestParam("usuario") String usuario, @RequestParam("club") String identificador) {
		GestionClubes gC = new GestionClubes();
		ModelAndView verClub = new ModelAndView("vistaClub");
		club =  gC.leerClubConIdentificador(identificador);
		gA = new GestionAcceso();
		verClub.addObject("usuario", gU.leerUsuario(usuario));
		verClub.addObject("esAdministrador", gU.leerUsuario(usuario).isRolAdministrador());
		verClub.addObject("club", club);
		verClub.addObject("miembros", club.getColeccionMiembrosJSON());
		verClub.addObject("nombreAdministrador", gU.getNyA(club.getAdministrador()));
		//verClub.addObject("nuevosMiembros", gU.getNuevosMiembros(club));
		verClub.addObject("pertenece", gC.perteneceWithIdentificador(usuario, identificador));
		verClub.addObject("solicitudesAcceso", gA.leerSolicitudes(identificador));
		verClub.addObject("solicitado", gA.existeSolicitud(new SolicitudAcceso(gU.leerUsuario(usuario).getUsername(),club.getIdentificador())));
		return verClub;
	}
	
	@RequestMapping(value = "/incluirMiembro", method = RequestMethod.POST)
	public void incluirMiembro(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClubConIdentificador(request.getParameter("identificador"));
		club.insertarMiembro(request.getParameter("miembro"));
		gC.actualizarClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/aceptarSolicitud", method = RequestMethod.POST)
	public void aceptarSolicitud(HttpServletRequest request, HttpServletResponse response) {
		sA = new SolicitudAcceso(request.getParameter("miembro"),request.getParameter("identificador"));
		gA = new GestionAcceso();
		gA.eliminarSolicitud(sA);
		
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClubConIdentificador(request.getParameter("identificador"));
		club.insertarMiembro(request.getParameter("miembro"));
		gC.actualizarClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/denegarSolicitud", method = RequestMethod.POST)
	public void denegarSolicitud(HttpServletRequest request, HttpServletResponse response) {
		sA = new SolicitudAcceso(request.getParameter("miembro"),request.getParameter("identificador"));
		gA = new GestionAcceso();
		gA.eliminarSolicitud(sA);
		
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/nuevoAdministrador", method = RequestMethod.POST)
	public void nuevoAdministrador(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClubConIdentificador(request.getParameter("identificador"));
		club.setAdministrador(request.getParameter("miembro"));
		gC.actualizarClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/dejarClub", method = RequestMethod.POST)
	public void dejarClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClubConIdentificador(request.getParameter("identificador"));
		club.eliminarMiembro(request.getParameter("usuario"));
		gC.actualizarClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/clubes.html?usuario="+request.getParameter("usuario"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/solicitarAccesoClub", method = RequestMethod.POST)
	public void solicitarAccesoClub(HttpServletRequest request, HttpServletResponse response) {
		gA = new GestionAcceso();
		sA = new SolicitudAcceso(request.getParameter("usuario"), request.getParameter("identificador"));
		gA.insertarAcceso(sA);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {}
	}
	
	@RequestMapping(value = "/eliminarMiembro", method = RequestMethod.POST)
	public void eliminarMiembro(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		Club club = gC.leerClubConIdentificador(request.getParameter("identificador"));
		club.eliminarMiembro(request.getParameter("miembro"));
		gC.actualizarClub(club);
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/verClub.html?usuario="+request.getParameter("usuario")+"&club="+request.getParameter("identificador"));
		} catch (IOException e) {
			
		}
	}
	
	@RequestMapping(value = "/eliminarClub", method = RequestMethod.POST)
	public void eliminarClub(HttpServletRequest request, HttpServletResponse response) {
		GestionClubes gC = new GestionClubes();
		gC.eliminarClub(request.getParameter("identificador"));
		try {
			response.sendRedirect("https://sistemaflashcards.herokuapp.com/clubes.html?usuario="+request.getParameter("usuario"));
		} catch (IOException e) {
			
		}
	}
	*/
}