package com.flashcards.dao;

import java.util.LinkedList;

import com.flashcards.db.DBBloqueado;
import com.flashcards.modelo.Bloqueado;

public class GestionBloqueados {
	DBBloqueado dB;
	
	public GestionBloqueados() {
		dB = new DBBloqueado();
	}
	
	public boolean crearBloqueado(Bloqueado bloqueado) {
		return dB.createBloqueado(bloqueado);
	}
	
	public LinkedList<String> obtenerBloqueador(String bloqueador) {
		return dB.getUsuariosBloqueados(bloqueador);
	}
	
	public boolean borrarBloqueado(Bloqueado bloqueado) {
		return dB.deleteBloqueado(bloqueado);
	}
	
}
