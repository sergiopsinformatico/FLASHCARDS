package com.flashcards.dao;

import java.util.LinkedList;

import com.flashcards.db.DBAmigos;
import com.flashcards.modelo.Amigos;

public class GestionAmigos {
	DBAmigos dB;
	
	public GestionAmigos() {
		dB = new DBAmigos();
	}
	
	public boolean createAmigos(Amigos amigo) {
		return dB.createAmigos(amigo);
	}
	
	public LinkedList<String> getAmigos (String username) {
		return dB.getAmigos(username);
	}
	
	public boolean deleteAmigos(Amigos am) {
		return dB.deleteAmigos(am);
	}
	
	public boolean existeAmigos(Amigos am) {
		return dB.existeAmigos(am);
	}
}
