package main.java.flashcards.dto;

public class Bloqueado {
	String bloqueador, bloqueado;
	
	public Bloqueado(String bloqueador, String bloqueado) {
		setBloqueador(bloqueador);
		setBloqueado(bloqueado);
	}

	public String getBloqueador() {
		return this.bloqueador;
	}

	public void setBloqueador(String bloqueador) {
		this.bloqueador = bloqueador;
	}

	public String getBloqueado() {
		return this.bloqueado;
	}

	public void setBloqueado(String bloqueado) {
		this.bloqueado = bloqueado;
	}
}
