package com.flashcards.dao;

import java.util.LinkedList;

import com.flashcards.auxiliares.Fecha;
import com.flashcards.db.DBUsuarios;
import com.flashcards.modelo.Eliminado;
import com.flashcards.modelo.Usuario;

public class GestionUsuarios {
	
	DBUsuarios db;
	GestionEliminados gE;
	Fecha fecha;
	LinkedList<Eliminado> lista;
	Eliminado el;
	Usuario user;
	
	public GestionUsuarios() {
		db = new DBUsuarios();
	}
	
	public boolean registrarUsuario(Usuario user) {
		if((!(existeEmail(user.getEmail())))&&(!(existeUsername(user.getUsuario())))
				&&(user.hayMayuscula())&&(user.hayMinuscula())&&(user.hayNumero())&&(user.longitudCorrecta())) {
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
	
	public LinkedList<Usuario> gente(String usuario) {
		return db.gente(usuario);
	}
	
	public LinkedList<Usuario> todosUsuarios(String usuario) {
		return db.todosUsuarios(usuario);
	}
	
	public boolean modificarUsuario(Usuario user) {
		return db.modificarUsuario(user);
	}
	
	public boolean eliminaCuenta(String usuario) {
		return db.eliminarCuenta(usuario);
	}
	
	public void eliminarCuentas() {
		gE = new GestionEliminados();
		fecha = new Fecha();
		lista = gE.buscarEliminados(fecha.fechaHoy());
		for(int i = 0; i<lista.size(); i++) {
			el = lista.get(i);
			user = this.leerUsuario(el.getEmail());
			this.eliminaCuenta(user.getUsuario());
			gE.borrarEliminado(user.getEmail());
			//Eliminar todo lo demas
		}
	}
}
