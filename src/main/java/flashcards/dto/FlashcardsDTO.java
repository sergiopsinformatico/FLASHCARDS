package main.java.flashcards.dto;

import java.util.List;

public class FlashcardsDTO {
	
	String idColeccion;
	String nombreColeccion;
	String temaColeccion;
	String fechaCreacion;
	String autorColeccion;
	List<TarjetaDTO> tarjetas;
	String tipoCompartir;
	String compartirCon;
	
	boolean evaluada;
	String evaluador;
			
	public FlashcardsDTO(String id, String nombre, String tema, String autor, 
			List<TarjetaDTO> tarjetas, String tipoCompartir, String compartirCon) {
		
		setIdColeccion(id);
		setNombreColeccion(nombre);
		setTemaColeccion(tema);
		setAutorColeccion(autor);
		setTarjetas(tarjetas);
		setTipoCompartir(tipoCompartir);
		setCompartirCon(compartirCon);
		
	}

	public String getIdColeccion() {
		return idColeccion;
	}

	public void setIdColeccion(String idColeccion) {
		this.idColeccion = idColeccion;
	}

	public String getNombreColeccion() {
		return nombreColeccion;
	}

	public void setNombreColeccion(String nombreColeccion) {
		this.nombreColeccion = nombreColeccion;
	}

	public String getTemaColeccion() {
		return temaColeccion;
	}

	public void setTemaColeccion(String temaColeccion) {
		this.temaColeccion = temaColeccion;
	}

	public String getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public String getAutorColeccion() {
		return autorColeccion;
	}

	public void setAutorColeccion(String autorColeccion) {
		this.autorColeccion = autorColeccion;
	}

	public List<TarjetaDTO> getTarjetas() {
		return tarjetas;
	}

	public void setTarjetas(List<TarjetaDTO> tarjetas) {
		this.tarjetas = tarjetas;
	}

	public String getTipoCompartir() {
		return tipoCompartir;
	}

	public void setTipoCompartir(String tipoCompartir) {
		this.tipoCompartir = tipoCompartir;
	}

	public String getCompartirCon() {
		return compartirCon;
	}

	public void setCompartirCon(String compartirCon) {
		this.compartirCon = compartirCon;
	}

	public boolean isEvaluada() {
		return evaluada;
	}

	public void setEvaluada(boolean evaluada) {
		this.evaluada = evaluada;
	}

	public String getEvaluador() {
		return evaluador;
	}

	public void setEvaluador(String evaluador) {
		this.evaluador = evaluador;
	}
}
