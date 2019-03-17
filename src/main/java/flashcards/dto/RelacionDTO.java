package main.java.flashcards.dto;

import java.util.LinkedList;

public class RelacionDTO {
	
	String usuario;
	LinkedList<String> peticionesEnviadas;
	LinkedList<String> peticionesRecibidas;
	LinkedList<String> amigos;
	LinkedList<String> bloqueados;
	LinkedList<String> bloqueadoPor;
	
	public RelacionDTO(String usuario) {
		setUsuario(usuario);
		setPeticionesEnviadas(new LinkedList<String>());
		setPeticionesRecibidas(new LinkedList<String>());
		setAmigos(new LinkedList<String>());
		setBloqueados(new LinkedList<String>());
		setBloqueadoPor(new LinkedList<String>());
	}
	
	public RelacionDTO(String usuario,
					   LinkedList<String> peticionesEnviadas, 
			           LinkedList<String> peticionesRecibidas, 
			           LinkedList<String> amigos,
			           LinkedList<String> bloqueados, 
			           LinkedList<String> bloqueadoPor) {
		
		setUsuario(usuario);
		setPeticionesEnviadas(peticionesEnviadas);
		setPeticionesRecibidas(peticionesRecibidas);
		setAmigos(amigos);
		setBloqueados(bloqueados);
		setBloqueadoPor(bloqueadoPor);
		
	}
	
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public LinkedList<String> getPeticionesEnviadas() {
		return peticionesEnviadas;
	}

	public void setPeticionesEnviadas(LinkedList<String> peticionesEnviadas) {
		this.peticionesEnviadas = peticionesEnviadas;
	}

	public LinkedList<String> getPeticionesRecibidas() {
		return peticionesRecibidas;
	}

	public void setPeticionesRecibidas(LinkedList<String> peticionesRecibidas) {
		this.peticionesRecibidas = peticionesRecibidas;
	}

	public LinkedList<String> getAmigos() {
		return amigos;
	}

	public void setAmigos(LinkedList<String> amigos) {
		this.amigos = amigos;
	}

	public LinkedList<String> getBloqueados() {
		return bloqueados;
	}

	public void setBloqueados(LinkedList<String> bloqueados) {
		this.bloqueados = bloqueados;
	}

	public LinkedList<String> getBloqueadoPor() {
		return bloqueadoPor;
	}

	public void setBloqueadoPor(LinkedList<String> bloqueadoPor) {
		this.bloqueadoPor = bloqueadoPor;
	}
	
}
