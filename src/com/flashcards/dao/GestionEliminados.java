package com.flashcards.dao;

import com.flashcards.db.DBEliminados;
import com.flashcards.modelo.Eliminado;

public class GestionEliminados {
	
	DBEliminados dB;
	
	public GestionEliminados() {
		dB = new DBEliminados();
	}
	
	public boolean insertarEliminado(Eliminado eliminado) {
		return dB.insertEliminado(eliminado);
	}
	
	public String leerFecha (String email) {
		return dB.getDate(email);
	}
	
	public boolean borrarEliminado(String email) {
		return dB.deleteEmail(email);
	}
	
}
