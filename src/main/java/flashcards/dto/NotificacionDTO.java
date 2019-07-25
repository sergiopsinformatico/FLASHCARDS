package main.java.flashcards.dto;

import java.util.List;

public class NotificacionDTO {
	
	String usuario;
	List<String> notificaciones;
	
	public NotificacionDTO(String usuario, List<String> notificaciones) {
		setUsuario(usuario);
		setNotificaciones(notificaciones);
	}
	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public List<String> getNotificaciones() {
		return notificaciones;
	}
	public void setNotificaciones(List<String> notificaciones) {
		this.notificaciones = notificaciones;
	}

}
