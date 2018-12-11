package main.java.flashcards.dto;

public class PeticionDeAmistad {
	
	String envia, recibe, estado;
	
	public PeticionDeAmistad(String envia, String recibe) {
		setEnvia(envia);
		setRecibe(recibe);
	}
	
	public PeticionDeAmistad(String envia, String recibe, String estado) {
		setEnvia(envia);
		setRecibe(recibe);
		setEstado(estado);
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

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
}
