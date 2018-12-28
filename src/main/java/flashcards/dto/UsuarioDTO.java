package main.java.flashcards.dto;

import org.springframework.lang.Nullable;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class UsuarioDTO {
	String username;
	String clave;
	String email;
	@JsonIgnore
	String nombreApellidos;
	@JsonIgnore
	String ciudad;
	@JsonIgnore
	String pais;
	@JsonIgnore
	String photo;
	@JsonIgnore
	boolean hasRolUsuario;
	@JsonIgnore
	boolean hasRolModerador;
	@JsonIgnore
	boolean hasRolAdministrador;
	
	/*public UsuarioDTO(String usuario, String clave, String email, boolean isUsuario, boolean isModerador, boolean isAdministrador) {
		setUsername(usuario);
		setClave(clave);
		setEmail(email);
		setRolUsuario(isUsuario);
		setRolModerador(isModerador);
		setRolAdministrador(isAdministrador);
	}*/

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
		return this.nombreApellidos;
	}

	public void setNombreApellidos(String nombreApellidos) {
		this.nombreApellidos = nombreApellidos;
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
	
	public boolean isRolUsuario() {
		return this.hasRolUsuario;
	}

	public void setRolUsuario(boolean isUsuario) {
		this.hasRolUsuario = isUsuario;
	}

	public boolean isRolModerador() {
		return this.hasRolModerador;
	}

	public void setRolModerador(boolean isModerador) {
		this.hasRolModerador = isModerador;
	}

	public boolean isRolAdministrador() {
		return this.hasRolAdministrador;
	}

	public void setRolAdministrador(boolean isAdministrador) {
		this.hasRolAdministrador = isAdministrador;
	}
}