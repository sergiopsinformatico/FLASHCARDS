package main.java.flashcards.dto;

public class SolicitudAcceso {
	String solicita, identificador;
	
	public SolicitudAcceso(String solicita, String identificador) {
		setSolicita(solicita);
		setIdentificador(identificador);
	}

	public String getSolicita() {
		return this.solicita;
	}

	public void setSolicita(String solicita) {
		this.solicita = solicita;
	}

	public String getIdentificador() {
		return this.identificador;
	}

	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}
}
