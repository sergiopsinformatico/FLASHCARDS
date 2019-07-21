package main.java.flashcards.dto;

public class TarjetaDTO {
	
	String anverso;
	String reverso;
	
	public TarjetaDTO(String anverso, String reverso) {
		setAnverso(anverso);
		setReverso(reverso);
	}
	
	public String getAnverso() {
		return anverso;
	}
	public void setAnverso(String anverso) {
		this.anverso = anverso;
	}
	public String getReverso() {
		return reverso;
	}
	public void setReverso(String reverso) {
		this.reverso = reverso;
	}
	
	
	
}
