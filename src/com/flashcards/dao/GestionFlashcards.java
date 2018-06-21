package com.flashcards.dao;

import com.flashcards.db.DBFlashcards;
import com.flashcards.modelo.Flashcard;

public class GestionFlashcards {
	DBFlashcards dB;
	
	public GestionFlashcards() {
		dB = new DBFlashcards();
	}
	
	public Flashcard leerFlashcard(String id) {
		return dB.readFlashcard(id);
	}
	
	public boolean insertarFlashcard(Flashcard flash) {
		return dB.insertFlashcard(flash);
	}
	
	public boolean existeIdentificador(String identificador) {
		return dB.existIdentificador(identificador);
	}
}
