package main.java.flashcards.db.dao;

import main.java.flashcards.dto.RelacionDTO;

public interface InterfaceDAORelacion {
	public boolean createRelacionUsuario(RelacionDTO relacion);
	public RelacionDTO readRelacionUsuario(String usuario);
	public boolean updateRelacionUsuario(RelacionDTO relacion);
	public boolean deleteRelacionUsuario(String usuario);
	public String getTipoRelacion(String user1, String user2);
	public boolean eliminarAmigo(String user1, String user2);
	public boolean bloqueaUsuario(String user1, String user2);
	public boolean desbloqueaUsuario(String user1, String user2);
	public boolean aceptaPdA(String user1, String user2);
	public boolean rechazaPdA(String user1, String user2);
	public boolean enviarPdA(String user1, String user2);
}
