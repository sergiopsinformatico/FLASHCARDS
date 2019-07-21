package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.FlashcardsDTO;

public interface InterfaceDAOFlashcards {
	
	public boolean crearFlashcards(FlashcardsDTO flashcards);
	public FlashcardsDTO leerFlashcard(String idFlashcard);
	public boolean eliminarFlashcard(String idFlashcard);
	public List<FlashcardsDTO> consultaSinEvaluar(String moderador);
	public boolean valoraPositivamente(String idFlashcard, String evaluador);
	public boolean valoraNegativamente(String idFlashcard);
	public List<FlashcardsDTO> listarTodasColecciones();
	public List<FlashcardsDTO> listarColeccionesVisibles(String username);
	public boolean existeIdColeccion(String idFlashcards);
	public List<FlashcardsDTO> coleccionesCreadasVisibles(String username);
	public List<FlashcardsDTO> coleccionesCreadasSinEvaluar (String username);
	public List<FlashcardsDTO> coleccionesClub(String id);
	public List<FlashcardsDTO> listarTodasColeccionesModerador();
	
}
