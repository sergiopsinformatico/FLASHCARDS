package com.flashcards.modelo;

public class Tarjeta {
	String enunciado, respuesta;

	public Tarjeta(String enunciado, String respuesta) {
		setEnunciado(enunciado);
		setRespuesta(respuesta);
	}
	
	public String getEnunciado() {
		return this.enunciado;
	}

	public void setEnunciado(String enunciado) {
		this.enunciado = enunciado;
	}

	public String getRespuesta() {
		return this.respuesta;
	}

	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}
}
