package com.flashcards.modelo;

public class Invitacion {
	String envia, recibe, club;
	
	public Invitacion(String envia, String recibe, String club) {
		setEnvia(envia);
		setRecibe(recibe);
	}

	public String getEnvia() {
		return this.envia;
	}

	public void setEnvia(String envia) {
		this.envia = envia;
	}

	public String getRecibe() {
		return this.recibe;
	}

	public void setRecibe(String recibe) {
		this.recibe = recibe;
	}

	public String getClub() {
		return this.club;
	}

	public void setClub(String club) {
		this.club = club;
	}
}
