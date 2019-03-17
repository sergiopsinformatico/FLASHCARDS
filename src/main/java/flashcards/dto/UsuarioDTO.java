package main.java.flashcards.dto;

public class UsuarioDTO {
	String username;
	String clave;
	String email;
	String nombreApellidos;
	String ciudad;
	String pais;
	String foto;
	String emailFoto;
	String rol;
	boolean activadaCuenta;
	RelacionDTO relacion;
	
	public UsuarioDTO(String username, String email, String clave) {
		setUsername(username);
		setEmail(email);
		setClave(clave);
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public void setUsername(String username) {
		this.username = username;
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
		return this.nombreApellidos;
	}

	public void setNombreApellidos(String nombre) {
		this.nombreApellidos = nombre;
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
	
	public String getFoto() {
		return this.foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	public String getEmailFoto() {
		return emailFoto;
	}

	public void setEmailFoto(String emailFoto) {
		this.emailFoto = emailFoto;
	}
	
	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public boolean isActivadaCuenta() {
		return activadaCuenta;
	}

	public void setActivadaCuenta(boolean activadaCuenta) {
		this.activadaCuenta = activadaCuenta;
	}

	public RelacionDTO getRelacion() {
		return relacion;
	}

	public void setRelacion(RelacionDTO relacion) {
		this.relacion = relacion;
	}
}