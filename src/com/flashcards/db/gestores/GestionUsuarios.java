package com.flashcards.db.gestores;

import java.util.LinkedList;

import com.flashcards.auxiliares.Fecha;
import com.flashcards.db.DBUsuarios;
import com.flashcards.modelo.Amigos;
import com.flashcards.modelo.Bloqueado;
import com.flashcards.modelo.Eliminado;
import com.flashcards.modelo.PeticionDeAmistad;
import com.flashcards.modelo.UsuarioDTO;

public class GestionUsuarios {
	
	DBUsuarios db;
	GestionEliminados gE;
	GestionBloqueados gB;
	GestionAmigos gA;
	GestionPeticiones gP;
	Fecha fecha;
	LinkedList<Eliminado> lista;
	Eliminado el;
	UsuarioDTO user;
	LinkedList<UsuarioDTO> usuarios;
	String json;
	int indice;
	
	public GestionUsuarios() {
		db = new DBUsuarios();
	}
	
	public boolean registrarUsuario(UsuarioDTO user) {
		if((!(existeEmail(user.getEmail())))&&(!(existeUsername(user.getUsuario())))
				&&(user.hayMayuscula())&&(user.hayMinuscula())&&(user.hayNumero())&&(user.longitudCorrecta())) {
			return db.crearUsuario(user);
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
	
	public UsuarioDTO leerUsuario(String usuario) {
		if(existeUsername(usuario)) {
			return db.usuarioByUsername(usuario);
		}else if (existeEmail(usuario)) {
			return db.usuarioByEmail(usuario);
		}else {
			return null;
		}
	}
	
	public String gente(String usuario) {
		usuarios = todosUsuarios(usuario);
		json = "";
		int check=0;
		String status="";
		gB = new GestionBloqueados();
		gA = new GestionAmigos();
		gP = new GestionPeticiones();
		for(indice = 0; indice<usuarios.size(); indice++) {
			user = usuarios.get(indice);
			if(!(gB.existe(new Bloqueado(user.getUsuario(), usuario)))) {
				if(gA.existeAmigos(new Amigos(usuario, user.getUsuario()))) {
					status = "amigo";
				}else {
					if(gP.existe(new PeticionDeAmistad(usuario, user.getUsuario()))) {
						status = "pdaEnviada";
					}else {
						if(gP.existe(new PeticionDeAmistad(user.getUsuario(), usuario))) {
							status = "pdaRecibida";
						}else {
							if(gB.existe(new Bloqueado(usuario, user.getUsuario()))) {
								status = "bloqueado";
							}else {
								status = "nuevo";
							}
						}
					}
				}
				if(check==0) {
					json = user.getNombreApellidos()+"///-///"+user.getUsuario()+"///-///"+status;
					check++;
				}else {
					json = json + "///****nuevaP****///" + user.getNombreApellidos()+"///-///"+user.getUsuario()+"///-///"+status;
				}
			}
		}
		return json;
	}
	
	public LinkedList<UsuarioDTO> todosUsuarios(String usuario) {
		return db.usuarios(usuario);
	}
	
	public boolean modificarUsuario(UsuarioDTO user) {
		return db.modificarUsuario(user);
	}
	
	public boolean eliminaCuenta(String usuario) {
		return db.eliminarUsuario(usuario);
	}
	
	public String getNyA(String usuario) {
		user = leerUsuario(usuario);
		return user.getNombreApellidos();
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
		}
	}
}
