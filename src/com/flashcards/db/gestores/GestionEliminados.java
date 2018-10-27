package com.flashcards.db.gestores;

import java.util.LinkedList;

import com.flashcards.db.dao.DBEliminados;
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
	
	public boolean isUsuario (String email) {
		return dB.isUsuario(email);
	}
	
	public boolean borrarEliminado(String email) {
		return dB.deleteEmail(email);
	}
	
	public LinkedList<Eliminado> buscarEliminados(String fechaHoy) {
		return dB.searchEliminados(fechaHoy);
	}
	
}
