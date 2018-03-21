package com.flashcards.dao;

import com.flashcards.db.DBUsuarios;
import com.flashcards.modelo.Usuario;

public class GestionUsuarios {
	
	DBUsuarios db;
	
	public GestionUsuarios() {
		db = new DBUsuarios();
	}
	
	public boolean registrarUsuario(Usuario user) {
		if(!existeEmail(user.getEmail())) {
			return db.createUsuario(user);
		}else {
			return false;
		}
	}
	
	public boolean existeEmail(String email) {
		return db.existeEmail(email);
	}
	
}
