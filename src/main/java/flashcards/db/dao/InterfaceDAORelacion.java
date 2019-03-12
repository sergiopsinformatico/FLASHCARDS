package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.RelacionDTO;

public interface InterfaceDAORelacion {
	public boolean insertarRelacion(RelacionDTO relacion);
	public List<RelacionDTO> getPeticionesEnviadas(String username);
}
