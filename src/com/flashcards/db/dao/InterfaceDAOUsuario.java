package com.flashcards.db.dao;

import java.util.LinkedList;

import com.flashcards.modelo.UsuarioDTO;

public interface InterfaceDAOUsuario {
	public void conexionDB();
	public boolean crearUsuario(UsuarioDTO user);
	public boolean existeEmail (String email);
	public boolean existeUsername (String username);
	public boolean loginByUsername (String username, String clave);
	public boolean loginByEmail (String email, String clave);
	public LinkedList<UsuarioDTO> usuarios (String username);
	public UsuarioDTO usuarioByUsername (String username);
	public UsuarioDTO usuarioByEmail (String email);
	public boolean modificarUsuario (UsuarioDTO user);
	public boolean eliminarUsuario(String usuario);
}
