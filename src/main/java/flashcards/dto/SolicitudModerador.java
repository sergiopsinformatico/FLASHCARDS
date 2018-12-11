package main.java.flashcards.dto;

public class SolicitudModerador {
	String usuario;
	
	public SolicitudModerador(String usuario) {
		setUsuario(usuario);
	}
	
	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
}
