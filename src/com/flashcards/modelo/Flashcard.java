package com.flashcards.modelo;

import java.util.LinkedList;

public class Flashcard {
	LinkedList<Tarjeta> coleccion;
	String identificador, creador, nombreColeccion, compartido, nombreCompartido, evaluador, coleccionJSON, auxJSON, descripcion;
	Tarjeta t;
	boolean evaluado;
	
	public LinkedList<Tarjeta> getColeccion() {
		return this.coleccion;
	}
	public void setColeccion(LinkedList<Tarjeta> coleccion) {
		this.coleccion = coleccion;
		coleccionToJSON();
	}
	public String getCreador() {
		return this.creador;
	}
	public void setCreador(String creador) {
		this.creador = creador;
	}
	public String getNombreColeccion() {
		return this.nombreColeccion;
	}
	public void setNombreColeccion(String nombreColeccion) {
		this.nombreColeccion = nombreColeccion;
	}
	public String getCompartido() {
		return this.compartido;
	}
	public void setCompartido(String compartido) {
		this.compartido = compartido;
	}
	public String getNombreCompartido() {
		return this.nombreCompartido;
	}
	public void setNombreCompartido(String nombreCompartido) {
		this.nombreCompartido = nombreCompartido;
	}
	public String getEvaluador() {
		return this.evaluador;
	}
	public void setEvaluador(String evaluador) {
		this.evaluador = evaluador;
	}
	public boolean isEvaluado() {
		return this.evaluado;
	}
	public void setEvaluado(boolean evaluado) {
		this.evaluado = evaluado;
	}
	
	public String getColeccionJSON() {
		return this.coleccionJSON;
	}

	public void setColeccionJSON(String coleccionJSON) {
		this.coleccionJSON = coleccionJSON;
	}
	
	public String getIdentificador() {
		return this.identificador;
	}
	
	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}
	
	public void coleccionToJSON() {
		auxJSON="";
		for(int i=0; i<getColeccion().size(); i++) {
			t = getColeccion().get(i);
			if(i==0) {
				auxJSON = t.getAnverso()+"///****resp****///"+t.getReverso();
			}else {
				auxJSON = auxJSON+"///****nuevaCARD****///"+t.getAnverso()+"///****resp****///"+t.getReverso();
			}
		}
		setColeccionJSON(auxJSON);
	}
	
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}