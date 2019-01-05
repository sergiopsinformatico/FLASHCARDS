package main.java.flashcards.dto;

public class EliminarCuentaDTO {
	
	public String username;
	public String fecha;
	
	public EliminarCuentaDTO(String username, String fecha) {
		setUsername(username);
		setFecha(fecha);
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
