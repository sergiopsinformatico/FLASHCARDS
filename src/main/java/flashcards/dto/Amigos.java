package main.java.flashcards.dto;

public class Amigos {
	String amigo1, amigo2;
	public Amigos(String amigo1, String amigo2) {
		setAmigo1(amigo1);
		setAmigo2(amigo2);
	}
	public String getAmigo1() {
		return this.amigo1;
	}
	public void setAmigo1(String amigo1) {
		this.amigo1 = amigo1;
	}
	public String getAmigo2() {
		return this.amigo2;
	}
	public void setAmigo2(String amigo2) {
		this.amigo2 = amigo2;
	}	
}
