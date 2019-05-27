package main.java.flashcards.dto;

public class RecuperarCuentaDTO {
	
	String username;
	String key;
	String fechaExpira;
	
	public RecuperarCuentaDTO(String username, String key, String fechaExpira) {
		setUsername(username);
		setKey(key);
		setFechaExpira(fechaExpira);
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getKey() {
		return key;
	}
	
	public void setKey(String key) {
		this.key = key;
	}
	
	public String getFechaExpira() {
		return fechaExpira;
	}
	
	public void setFechaExpira(String fechaExpira) {
		this.fechaExpira = fechaExpira;
	}
	
}
