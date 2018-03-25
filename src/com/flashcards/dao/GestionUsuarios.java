package com.flashcards.dao;

import com.flashcards.db.DBUsuarios;
import com.flashcards.modelo.Usuario;

public class GestionUsuarios {
	
	DBUsuarios db;
	
	public GestionUsuarios() {
		db = new DBUsuarios();
	}
	
	public boolean registrarUsuario(Usuario user) {
		if((!(existeEmail(user.getEmail())))&&(!(existeUsername(user.getUsuario())))&&(user.cumpleRequisitosClave())) {
			return db.createUsuario(user);
		}else {
			return false;
		}
	}
	
	public boolean existeEmail(String email) {
		return db.existeEmail(email);
	}
	
	public boolean existeUsername(String username) {
		return db.existeUsername(username);
	}
	
	public boolean login(String usuario, String clave) {
		if(existeUsername(usuario)) {
			return db.loginByUsername(usuario, clave);
		}else if (existeEmail(usuario)) {
			return db.loginByEmail(usuario, clave);
		}else {
			return false;
		}
	}
	
	public Usuario leerUsuario(String usuario) {
		if(existeUsername(usuario)) {
			return db.usuarioByUsername(usuario);
		}else if (existeEmail(usuario)) {
			return db.usuarioByEmail(usuario);
		}else {
			return null;
		}
	}
	
	public boolean modificarUsuario(Usuario user) {
		return db.modificarUsuario(user);
	}
	
	public boolean eliminaCuenta(String usuario) {
		return db.eliminarCuenta(usuario);
	}
	
}
