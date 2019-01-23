package main.java.flashcards.dto;

public class EliminarCuentaDTO {
	
	private String username;
	private String fecha;
	
	public EliminarCuentaDTO(String username, String fecha) {
		setUsername(username);
		setFecha(fecha);
	}
	
	public EliminarCuentaDTO(String username) {
		setUsername(username);
		setFecha("");
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

}
