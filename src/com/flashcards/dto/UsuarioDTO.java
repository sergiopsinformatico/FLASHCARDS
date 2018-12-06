package com.flashcards.dto;

public class UsuarioDTO {
	String usuario, clave, email, nombreApellidos, ciudad, pais, genero, photo;
	int edad;
	boolean mayuscula, minuscula, numero, isUsuario, isModerador, isAdministrador;
	
	public UsuarioDTO(String usuario, String clave, String email, String nombreApellidos, int edad, String ciudad, String pais, String genero, String photo, boolean isUsuario, boolean isModerador, boolean isAdministrador) {
		setNombreUsuario(usuario);
		setClave(clave);
		setEmail(email);
		setNombreApellidos(nombreApellidos);
		setEdad(edad);
		setCiudad(ciudad);
		setPais(pais);
		setGenero(genero);
		setPhoto(photo);
		setUsuario(isUsuario);
		setModerador(isModerador);
		setAdministrador(isAdministrador);
	}

	public String getNombreUsuario() {
		return this.usuario;
	}

	public void setNombreUsuario(String usuario) {
		this.usuario = usuario;
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

	public int getEdad() {
		return this.edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
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
	
	public String getGenero() {
		return this.genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}
	
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public boolean isUsuario() {
		return this.isUsuario;
	}

	public void setUsuario(boolean isUsuario) {
		this.isUsuario = isUsuario;
	}

	public boolean isModerador() {
		return this.isModerador;
	}

	public void setModerador(boolean isModerador) {
		this.isModerador = isModerador;
	}

	public boolean isAdministrador() {
		return this.isAdministrador;
	}

	public void setAdministrador(boolean isAdministrador) {
		this.isAdministrador = isAdministrador;
	}
	
	//Comprobación sobre los datos
	
	
	public boolean cumpleNombreUsuario() {
		for(int indice=0; indice<getNombreUsuario().length(); indice++) {
			if(!((getNombreUsuario().charAt(indice)>='A' && getNombreUsuario().charAt(indice)<='Z') ||
				 (getNombreUsuario().charAt(indice)>='a' && getNombreUsuario().charAt(indice)<='z') ||
				 (getNombreUsuario().charAt(indice)>='0' && getNombreUsuario().charAt(indice)<='9'))) {
				return false;
			}
		}
		return true;
	}
		
	public boolean hayMayusculaEnClave() {
		for(int indice=0; indice<getClave().length(); indice++) {
			if ((getClave().charAt(indice)>='A')&&(getClave().charAt(indice)<='Z')) {
				return true;
			}
		}
		return false;
	}
	
	public boolean hayMinusculaEnClave() {
		for(int indice=0; indice<getClave().length(); indice++) {
			if ((getClave().charAt(indice)>='a')&&(getClave().charAt(indice)<='z')) {
				return true;
			}
		}
		return false;
	}
	
	public boolean hayNumeroEnClave() {
		for(int indice=0; indice<getClave().length(); indice++) {
			if ((getClave().charAt(indice)>='0')&&(getClave().charAt(indice)<='9')) {
				return true;
			}
		}
		return false;
	}
	
	public boolean correctaLongitudClave() {
		return (getClave().length()>=4);
	}
	
	public boolean tieneEspaciosClave() {
		for(int indice=0; indice<getClave().length(); indice++) {
			if (getClave().charAt(indice)==' ') {
				return true;
			}
		}
		return false;
	}
}
