package main.java.flashcards.dto;

public class RelacionDTO {
	
	String username1;
	String username2;
	String tipoRelacion;
	
	public RelacionDTO(String user1, String user2, String relacion) {
		setUsername1(user1);
		setUsername2(user2);
		setTipoRelacion(relacion);
	}
	
	public String getUsername1() {
		return username1;
	}
	
	public void setUsername1(String usernamePersona1) {
		this.username1 = usernamePersona1;
	}
	
	public String getUsername2() {
		return username2;
	}
	
	public void setUsername2(String usernamePersona2) {
		this.username2 = usernamePersona2;
	}
	
	public String getTipoRelacion() {
		return tipoRelacion;
	}
	
	public void setTipoRelacion(String tipoRelacion) {
		this.tipoRelacion = tipoRelacion;
	}
	
}
