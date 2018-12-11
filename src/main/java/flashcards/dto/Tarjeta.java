package main.java.flashcards.dto;

public class Tarjeta {
	String anverso, reverso;

	public Tarjeta(String anverso, String reverso) {
		setAnverso(anverso);
		setReverso(reverso);
	}
	
	public String getAnverso() {
		return this.anverso;
	}

	public void setAnverso(String anverso) {
		this.anverso = anverso;
	}

	public String getReverso() {
		return this.reverso;
	}

	public void setReverso(String reverso) {
		this.reverso = reverso;
	}
}
