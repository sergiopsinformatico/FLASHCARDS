package com.flashcards.modelo;

import java.util.ArrayList;

public class Club {
	
	String nombre, administrador;
	ArrayList<String> miembros;
	
	public Club(String nombre, String administrador) {
		miembros = new ArrayList<String>();
		setNombre(nombre);
		setAdministrador(administrador);
		insertarMiembro(administrador);
	}
	public Club(String nombre) {
		miembros = new ArrayList<String>();
		setNombre(nombre);
	}
	
	public String getAdministrador() {
		return this.administrador;
	}
	
	public void setAdministrador(String administrador) {
		this.administrador=administrador;
	}
	
	public ArrayList<String> getColeccionMiembros(){
		return this.miembros;
	}
	
	public void setColeccionMiembros(ArrayList<String> miembros) {
		this.miembros = miembros;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public boolean insertarMiembro(String usuario) {
		try {
			if(!existeMiembro(usuario)) {
				this.miembros.add(usuario);
				return true;
			}
			return false;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean existeMiembro(String usuario) {
		try {
			for(int i=0; i<miembros.size(); i++) {
				if(miembros.get(i).equals(usuario)) {
					return true;
				}
			}
			return false;
		}catch(Exception ex) {
			return false;
		}
	}
	
	public boolean eliminarMiembro(String usuario) {
		try {
			for(int i=0; i<miembros.size(); i++) {
				if(miembros.get(i).equals(usuario)) {
					miembros.remove(i);
					return true;
				}
			}return false;
		}catch(Exception ex) {
			return false;
		}
	}
}