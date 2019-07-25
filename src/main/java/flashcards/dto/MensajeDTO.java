package main.java.flashcards.dto;

public class MensajeDTO {
	
	String idMensaje;
	String envia;
	String recibe;
	String mensaje;
	
	public MensajeDTO(String idMensaje, String envia, String recibe, String mensaje) {
		setIdMensaje(idMensaje);
		setEnvia(envia);
		setRecibe(recibe);
		setMensaje(mensaje);
	}
	
	public String getIdMensaje() {
		return idMensaje;
	}

	public void setIdMensaje(String idMensaje) {
		this.idMensaje = idMensaje;
	}

	public String getEnvia() {
		return envia;
	}
	
	public void setEnvia(String envia) {
		this.envia = envia;
	}
	
	public String getRecibe() {
		return recibe;
	}
	
	public void setRecibe(String recibe) {
		this.recibe = recibe;
	}
	
	public String getMensaje() {
		return mensaje;
	}
	
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	
}
