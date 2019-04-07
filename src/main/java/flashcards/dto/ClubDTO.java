package main.java.flashcards.dto;

import java.util.List;

public class ClubDTO {
	String idClub;
	String nombreClub;
	String administrador;
	List<String> miembros;
	String fechaCreacion;
	
	public ClubDTO(String idClub, String nombreClub, String administrador, List<String> miembros, String fechaCreacion) {
		setIdClub(idClub);
		setNombreClub(nombreClub);
		setAdministrador(administrador);
		setMiembros(miembros);
		setFechaCreacion(fechaCreacion);
	}

	public String getIdClub() {
		return idClub;
	}

	public void setIdClub(String idClub) {
		this.idClub = idClub;
	}

	public String getAdministrador() {
		return administrador;
	}
	
	public void setAdministrador(String administrador) {
		this.administrador = administrador;
	}
	
	public List<String> getMiembros() {
		return miembros;
	}
	
	public void setMiembros(List<String> miembros) {
		this.miembros = miembros;
	}
	
	public String getFechaCreacion() {
		return fechaCreacion;
	}
	
	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	
	public String getNombreClub() {
		return nombreClub;
	}
	
	public void setNombreClub(String nombreClub) {
		this.nombreClub = nombreClub;
	}
}
