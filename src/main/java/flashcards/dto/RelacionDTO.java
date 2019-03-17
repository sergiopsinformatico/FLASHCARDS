package main.java.flashcards.dto;

import java.util.ArrayList;

public class RelacionDTO {
	
	String usuario;
	ArrayList<String> peticionesEnviadas;
	ArrayList<String> peticionesRecibidas;
	ArrayList<String> amigos;
	ArrayList<String> bloqueados;
	ArrayList<String> bloqueadoPor;
	
	public RelacionDTO(String usuario) {
		setUsuario(usuario);
		setPeticionesEnviadas(new ArrayList<String>());
		setPeticionesRecibidas(new ArrayList<String>());
		setAmigos(new ArrayList<String>());
		setBloqueados(new ArrayList<String>());
		setBloqueadoPor(new ArrayList<String>());
	}
	
	public RelacionDTO(String usuario,
					   ArrayList<String> peticionesEnviadas, 
					   ArrayList<String> peticionesRecibidas, 
					   ArrayList<String> amigos,
					   ArrayList<String> bloqueados, 
					   ArrayList<String> bloqueadoPor) {
		
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

	public ArrayList<String> getPeticionesEnviadas() {
		return peticionesEnviadas;
	}

	public void setPeticionesEnviadas(ArrayList<String> peticionesEnviadas) {
		this.peticionesEnviadas = peticionesEnviadas;
	}

	public ArrayList<String> getPeticionesRecibidas() {
		return peticionesRecibidas;
	}

	public void setPeticionesRecibidas(ArrayList<String> peticionesRecibidas) {
		this.peticionesRecibidas = peticionesRecibidas;
	}

	public ArrayList<String> getAmigos() {
		return amigos;
	}

	public void setAmigos(ArrayList<String> amigos) {
		this.amigos = amigos;
	}

	public ArrayList<String> getBloqueados() {
		return bloqueados;
	}

	public void setBloqueados(ArrayList<String> bloqueados) {
		this.bloqueados = bloqueados;
	}

	public ArrayList<String> getBloqueadoPor() {
		return bloqueadoPor;
	}

	public void setBloqueadoPor(ArrayList<String> bloqueadoPor) {
		this.bloqueadoPor = bloqueadoPor;
	}
	
}
