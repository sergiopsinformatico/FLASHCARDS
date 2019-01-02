package main.java.flashcards.dto;

public class ActivaCuentaDTO {
	
	String username;
	String codigoActivacion;
	String fecha;
	
	public ActivaCuentaDTO(String username, String codigoActivacion, String fecha) {
		setUsername(username);
		setCodigoActivacion(codigoActivacion);
		setFecha(fecha);
	}
	
	public ActivaCuentaDTO(String username, String codigoActivacion) {
		setUsername(username);
		setCodigoActivacion(codigoActivacion);
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getCodigoActivacion() {
		return codigoActivacion;
	}

	public void setCodigoActivacion(String codigoActivacion) {
		this.codigoActivacion = codigoActivacion;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
}