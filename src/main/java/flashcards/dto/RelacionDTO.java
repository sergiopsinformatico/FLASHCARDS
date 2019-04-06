package main.java.flashcards.dto;

import java.util.ArrayList;
import java.util.List;

public class RelacionDTO {
	
	String usuario;
	List<String> peticionesEnviadas;
	List<String> peticionesRecibidas;
	List<String> amigos;
	List<String> bloqueados;
	List<String> bloqueadoPor;
	
	public RelacionDTO(String usuario) {
		setUsuario(usuario);
		setPeticionesEnviadas(new ArrayList<String>());
		setPeticionesRecibidas(new ArrayList<String>());
		setAmigos(new ArrayList<String>());
		setBloqueados(new ArrayList<String>());
		setBloqueadoPor(new ArrayList<String>());
	}
	
	public RelacionDTO(String usuario,
					   List<String> peticionesEnviadas, 
					   List<String> peticionesRecibidas, 
					   List<String> amigos,
					   List<String> bloqueados, 
					   List<String> bloqueadoPor) {
		
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

	public List<String> getPeticionesEnviadas() {
		return peticionesEnviadas;
	}

	public void setPeticionesEnviadas(List<String> peticionesEnviadas) {
		this.peticionesEnviadas = peticionesEnviadas;
	}

	public List<String> getPeticionesRecibidas() {
		return peticionesRecibidas;
	}

	public void setPeticionesRecibidas(List<String> peticionesRecibidas) {
		this.peticionesRecibidas = peticionesRecibidas;
	}

	public List<String> getAmigos() {
		return amigos;
	}

	public void setAmigos(List<String> amigos) {
		this.amigos = amigos;
	}

	public List<String> getBloqueados() {
		return bloqueados;
	}

	public void setBloqueados(List<String> bloqueados) {
		this.bloqueados = bloqueados;
	}

	public List<String> getBloqueadoPor() {
		return bloqueadoPor;
	}

	public void setBloqueadoPor(List<String> bloqueadoPor) {
		this.bloqueadoPor = bloqueadoPor;
	}
	
}
