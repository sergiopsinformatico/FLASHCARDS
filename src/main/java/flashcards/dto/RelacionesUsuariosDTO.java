package main.java.flashcards.dto;

import java.util.List;

public class RelacionesUsuariosDTO {
	String username;
	List<String> peticionesAmistadEnviadas;
	List<String> peticionesAmistadRecibidas;
	List<String> amigos;
	List<String> bloqueados;
	List<String> bloqueadores;
	
	public RelacionesUsuariosDTO(String username, List<String> pdaEnviadas,  List<String> pdaRecibidas,
			 List<String> amigos,  List<String> bloqueados,  List<String> bloqueadores) {
		
		setUsername(username);
		setPeticionesAmistadEnviadas(pdaEnviadas);
		setPeticionesAmistadRecibidas(pdaRecibidas);
		setAmigos(amigos);
		setBloqueados(bloqueados);
		setBloqueadores(bloqueadores);
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<String> getPeticionesAmistadEnviadas() {
		return peticionesAmistadEnviadas;
	}

	public void setPeticionesAmistadEnviadas(List<String> peticionesAmistadEnviadas) {
		this.peticionesAmistadEnviadas = peticionesAmistadEnviadas;
	}

	public List<String> getPeticionesAmistadRecibidas() {
		return peticionesAmistadRecibidas;
	}

	public void setPeticionesAmistadRecibidas(List<String> peticionesAmistadRecibidas) {
		this.peticionesAmistadRecibidas = peticionesAmistadRecibidas;
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

	public List<String> getBloqueadores() {
		return bloqueadores;
	}

	public void setBloqueadores(List<String> bloqueadores) {
		this.bloqueadores = bloqueadores;
	}
}
