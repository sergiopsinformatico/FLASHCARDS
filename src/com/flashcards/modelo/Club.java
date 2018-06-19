package com.flashcards.modelo;

import java.util.ArrayList;

import com.flashcards.dao.GestionUsuarios;

public class Club {
	
	String nombre, administrador, descripcion, identificador, aux;
	ArrayList<String> miembros, auxMiembros;
	int indice;
	GestionUsuarios gU;
	
	public Club(String identificador, String nombre, String administrador, String descripcion) {
		miembros = new ArrayList<String>();
		setIdentificador(identificador);
		setNombre(nombre);
		setAdministrador(administrador);
		setDescripcion(descripcion);
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
	
	public String getColeccionMiembrosJSON(){
		aux = "";
		auxMiembros = getColeccionMiembros();
		gU = new GestionUsuarios();
		
		for(indice=0; indice<auxMiembros.size(); indice++) {
			if(!(auxMiembros.get(indice).equals(getAdministrador()))) {
				if(indice==0) {
					aux = gU.getNyA(auxMiembros.get(indice))+"///****user****///"+auxMiembros.get(indice);
				}else {
					aux = aux + "///****nMiembro****///" + gU.getNyA(auxMiembros.get(indice))+"///****user****///"+auxMiembros.get(indice);
				}
			}
		}
		return aux;
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
	
	public String getDescripcion() {
		return this.descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getIdentificador() {
		return identificador;
	}
	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}

}