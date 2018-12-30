package main.java.flashcards.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)

public class UsuarioDTO {
	@XmlAttribute
	String username;
	@XmlAttribute
	String clave;
	@XmlAttribute
	String email;
	@XmlAttribute
	String nombreApellidos;
	@XmlAttribute
	String ciudad;
	@XmlAttribute
	String pais;
	@XmlAttribute
	String photo;
	@XmlAttribute
	boolean hasRolUsuario;
	@XmlAttribute
	boolean hasRolModerador;
	@XmlAttribute
	boolean hasRolAdministrador;
	@XmlAttribute
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
	
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public boolean isHasRolUsuario() {
		return hasRolUsuario;
	}

	public void setHasRolUsuario(boolean hasRolUsuario) {
		this.hasRolUsuario = hasRolUsuario;
	}

	public boolean isHasRolModerador() {
		return hasRolModerador;
	}

	public void setHasRolModerador(boolean hasRolModerador) {
		this.hasRolModerador = hasRolModerador;
	}

	public boolean isHasRolAdministrador() {
		return hasRolAdministrador;
	}

	public void setHasRolAdministrador(boolean hasRolAdministrador) {
		this.hasRolAdministrador = hasRolAdministrador;
	}

	public boolean isActivadaCuenta() {
		return activadaCuenta;
	}

	public void setActivadaCuenta(boolean activadaCuenta) {
		this.activadaCuenta = activadaCuenta;
	}
}