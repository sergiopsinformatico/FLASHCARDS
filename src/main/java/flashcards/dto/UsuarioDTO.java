package main.java.flashcards.dto;

public class UsuarioDTO {
	String username;
	String clave;
	String email;
	String nombre;
	String ciudad;
	String pais;
	String photo;
	
	public String getUsername() {
		return this.username;
	}
	
	public void setUsername(String usuario) {
		this.username = usuario;
	}
	
	public String getClave() {
		return this.clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}
	
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNombreApellidos() {
		return this.nombre;
	}

	public void setNombreApellidos(String nombreApellidos) {
		this.nombre = nombreApellidos;
	}
	
	public String getCiudad() {
		return this.ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	
	public String getPais() {
		return this.pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}
	
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
}