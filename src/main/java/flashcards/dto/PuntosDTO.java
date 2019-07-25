package main.java.flashcards.dto;

public class PuntosDTO {
	String usuario;
	int puntos;
	
	public PuntosDTO(String usuario, int puntos) {
		setUsuario(usuario);
		setPuntos(puntos);
	}
	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public int getPuntos() {
		return puntos;
	}
	public void setPuntos(int puntos) {
		this.puntos = puntos;
	}
	
}
