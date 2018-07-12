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
	
	public LinkedList<String> leerBloqueados(String bloqueador) {
		return dB.getUsuariosBloqueados(bloqueador);
	}
	
	public LinkedList<String> leerBloqueadores(String bloqueado) {
		return dB.getUsuariosBloqueadores(bloqueado);
	}
	
	public boolean existe(Bloqueado bloqueado) {
		return dB.existBloqueado(bloqueado);
	}
	
	public boolean borrarBloqueado(Bloqueado bloqueado) {
		return dB.deleteBloqueado(bloqueado);
	}
	
}
