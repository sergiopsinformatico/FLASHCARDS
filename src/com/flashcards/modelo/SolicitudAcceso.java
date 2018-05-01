package com.flashcards.modelo;

public class SolicitudAcceso {
	String solicita, club;
	
	public SolicitudAcceso(String solicita, String club) {
		setSolicita(solicita);
		setClub(club);
	}

	public String getSolicita() {
		return this.solicita;
	}

	public void setSolicita(String solicita) {
		this.solicita = solicita;
	}

	public String getClub() {
		return this.club;
	}

	public void setClub(String club) {
		this.club = club;
	}
}
