package main.java.flashcards.dto;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class UsuarioDTO {
	String username;
	String clave;
	String email;
	String nombreApellidos;
	String ciudad;
	String pais;
	String photo;
	boolean hasRolUsuario;
	boolean hasRolModerador;
	boolean hasRolAdministrador;
	
	/*public UsuarioDTO(String usuario, String clave, String email, boolean isUsuario, boolean isModerador, boolean isAdministrador) {
		setUsername(usuario);
		setClave(clave);
		setEmail(email);
		setRolUsuario(isUsuario);
		setRolModerador(isModerador);
		setRolAdministrador(isAdministrador);
	}*/
	
	@XmlAttribute
	public String getUsername() {
		return this.username;
	}
	
	public void setUsername(String usuario) {
		this.username = usuario;
	}
	
	@XmlAttribute
	public String getClave() {
		return this.clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}
	
	@XmlAttribute
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@XmlAttribute
	public String getNombreApellidos() {
		return this.nombreApellidos;
	}

	public void setNombreApellidos(String nombreApellidos) {
		this.nombreApellidos = nombreApellidos;
	}
	
	@XmlAttribute
	public String getCiudad() {
		return this.ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	
	@XmlAttribute
	public String getPais() {
		return this.pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}
	
	@XmlAttribute
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@XmlAttribute
	public boolean isRolUsuario() {
		return this.hasRolUsuario;
	}

	public void setRolUsuario(boolean isUsuario) {
		this.hasRolUsuario = isUsuario;
	}
	
	@XmlAttribute
	public boolean isRolModerador() {
		return this.hasRolModerador;
	}

	public void setRolModerador(boolean isModerador) {
		this.hasRolModerador = isModerador;
	}
	
	@XmlAttribute
	public boolean isRolAdministrador() {
		return this.hasRolAdministrador;
	}

	public void setRolAdministrador(boolean isAdministrador) {
		this.hasRolAdministrador = isAdministrador;
	}
}