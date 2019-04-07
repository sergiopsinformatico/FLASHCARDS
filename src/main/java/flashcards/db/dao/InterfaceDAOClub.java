package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.ClubDTO;

public interface InterfaceDAOClub {
	public boolean crearClub(ClubDTO club);
	public List<String> getIdClubes();
	public ClubDTO leerClub(String idClub);
}