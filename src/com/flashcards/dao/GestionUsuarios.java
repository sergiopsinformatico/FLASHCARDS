package com.flashcards.dao;

import com.flashcards.db.DBUsuarios;
import com.flashcards.modelo.Usuario;

public class GestionUsuarios {
	
	DBUsuarios db;
	
	public GestionUsuarios() {
		db = new DBUsuarios();
	}
	
	public boolean creacionUsuario(Usuario user) {
		return db.createUsuario(user);
	}
	
}
