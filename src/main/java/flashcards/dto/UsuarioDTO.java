package main.java.flashcards.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class UsuarioDTO {
	@XmlAttribute
	private String username;
	@XmlAttribute
	private String clave;
	@XmlAttribute
	private String email;
	@XmlAttribute
	private String nombreApellidos;
	@XmlAttribute
	private String ciudad;
	@XmlAttribute
	private String pais;
	@XmlAttribute
	private String photo;
	@XmlAttribute
	private boolean hasRolUsuario;
	@XmlAttribute
	private boolean hasRolModerador;
	@XmlAttribute
	private boolean hasRolAdministrador;
	
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