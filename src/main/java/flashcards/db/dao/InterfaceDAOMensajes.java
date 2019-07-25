package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.MensajeDTO;

public interface InterfaceDAOMensajes {
	public List<MensajeDTO> mensajesRecibidos(String username);
	public List<MensajeDTO> mensajesEnviados(String username);
	public boolean enviarMensaje(MensajeDTO mensaje);
	public boolean eliminarMensaje(String idMensaje);
	public MensajeDTO leerMensaje(String idMensaje);
}
