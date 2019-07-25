package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.PuntosDTO;

public interface InterfaceDAOPuntos {
	public boolean sumoPuntos(PuntosDTO puntos);
	public boolean creoPuntos(PuntosDTO puntos);
	public boolean eliminoPuntos(String username);
	public int getPuntosUsuario(String username);
	public List<PuntosDTO> rankingPuntos(); 
}
