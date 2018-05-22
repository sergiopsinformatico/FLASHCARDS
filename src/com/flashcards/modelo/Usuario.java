package com.flashcards.modelo;

public class Usuario {
	String usuario, clave, email, nombreApellidos, ciudad, pais, genero;
	int edad, indice;
	boolean mayuscula, minuscula, numero, isUsuario, isModerador, isAdministrador;
	
	public Usuario(String usuario, String clave, String email, String nombreApellidos, int edad, String ciudad, String pais, String genero, boolean isUsuario, boolean isModerador, boolean isAdministrador) {
		setUsuario(usuario);
		setClave(clave);
		setEmail(email);
		setNombreApellidos(nombreApellidos);
		setEdad(edad);
		setCiudad(ciudad);
		setPais(pais);
		setGenero(genero);
		setUsuario(isUsuario);
		setModerador(isModerador);
		setAdministrador(isAdministrador);
	}

	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
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
	
	public boolean hayMayuscula() {
		mayuscula = false;
		for(indice=0; indice<getClave().length(); indice++) {
			if ((getClave().charAt(indice)>='A')&&(getClave().charAt(indice)<='Z')) {
				mayuscula=true;
				indice=getClave().length();
			}
		}
		return mayuscula;
	}
	
	public boolean hayMinuscula() {
		minuscula = false;
		for(indice=0; indice<getClave().length(); indice++) {
			if ((getClave().charAt(indice)>='a')&&(getClave().charAt(indice)<='z')) {
				minuscula=true;
				indice=getClave().length();
			}
		}
		return minuscula;
	}
	
	public boolean hayNumero() {
		numero = false;
		for(indice=0; indice<getClave().length(); indice++) {
			if ((getClave().charAt(indice)>='0')&&(getClave().charAt(indice)<='9')) {
				numero=true;
				indice=getClave().length();
			}
		}
		return numero;
	}
	
	public boolean longitudCorrecta() {
		return (getClave().length()>=4);
	}

}
