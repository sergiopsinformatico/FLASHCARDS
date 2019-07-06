package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.ClubDTO;

public interface InterfaceDAOClub {
	
	public boolean insertaClub(ClubDTO club);
	public boolean existeIdClub(String idClub);
	public ClubDTO leerClub(String idClub);
	public boolean eliminaClub(String idClub);
	public boolean insertaUsuario(String idClub, String username);
	public boolean eliminaUsuario(String idClub, String username);
	public boolean actualizaClub(ClubDTO club);
	public List<String> getTodosClubes();
	public List<String> getMisClubes(String username);
	public List<String> getClubesPertenezco(String username);
	
}