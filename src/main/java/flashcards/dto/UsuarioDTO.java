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
	boolean rolUsuario;
	boolean rolModerador;
	boolean rolAdministrador;
	boolean activadaCuenta;
	
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
	
	public boolean isRolUsuario() {
		return rolUsuario;
	}

	public void setRolUsuario(boolean rolUsuario) {
		this.rolUsuario = rolUsuario;
	}

	public boolean isRolModerador() {
		return rolModerador;
	}

	public void setRolModerador(boolean rolModerador) {
		this.rolModerador = rolModerador;
	}

	public boolean isRolAdministrador() {
		return rolAdministrador;
	}

	public void setRolAdministrador(boolean rolAdministrador) {
		this.rolAdministrador = rolAdministrador;
	}

	public boolean isActivadaCuenta() {
		return activadaCuenta;
	}

	public void setActivadaCuenta(boolean activadaCuenta) {
		this.activadaCuenta = activadaCuenta;
	}
}