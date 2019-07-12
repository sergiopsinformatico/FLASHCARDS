package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.ClubDTO;

public interface InterfaceDAOClub {
	
	public boolean insertaClub(ClubDTO club);
	public boolean existeIdClub(String idClub);
	public ClubDTO leerClub(String idClub, String username);
	public boolean eliminaClub(String idClub);
	public boolean insertaUsuario(String idClub, String username);
	public boolean eliminaUsuario(String idClub, String username);
	public boolean actualizaClub(ClubDTO club);
	public List<ClubDTO> getTodosClubes(String username);
	public List<ClubDTO> getMisClubes(String username);
	public List<ClubDTO> getClubesPertenezco(String username);
	public List<ClubDTO> todosClubesCreados();
	
}