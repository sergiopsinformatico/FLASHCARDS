package main.java.flashcards.db.dao;

import java.util.ArrayList;

import main.java.flashcards.dto.RelacionDTO;

public interface InterfaceDAORelacion {
	public boolean createRelacionUsuario(RelacionDTO relacion);
	public RelacionDTO readRelacionUsuario(String usuario);
	public boolean updateRelacionUsuario(RelacionDTO relacion);
	public boolean deleteRelacionUsuario(String usuario);
	public String getTipoRelacion(String user1, String user2);
	public boolean eliminarAmigo(String user1, String user2);
}
