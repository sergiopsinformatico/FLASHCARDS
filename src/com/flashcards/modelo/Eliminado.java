package com.flashcards.modelo;
import com.flashcards.auxiliares.Fecha;

public class Eliminado {
	String email, fecha;
	Fecha f;
	
	public Eliminado(String email) {
		setEmail(email);
		f = new Fecha();
		setFecha(f.fechaEliminarCuenta());
	}
	
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFecha() {
		return this.fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

}
