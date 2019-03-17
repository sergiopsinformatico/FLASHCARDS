package main.java.flashcards.db.dao;

import main.java.flashcards.dto.RelacionDTO;

public interface InterfaceDAORelacion {
	public boolean insertarRelacionUsuario(RelacionDTO relacion);
	public RelacionDTO leerRelacionUsuario(String usuario);
	public boolean modificaRelacionUsuario(RelacionDTO relacion);
	public boolean eliminarRelacionUsuario(String usuario);
}
