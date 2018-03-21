package com.flashcards.modelo;

public class Usuario {
	String usuario, clave, email, nombre, apellidos, ciudad, pais;
	int edad;
	boolean correcto=false;
	
	public Usuario(String usuario, String clave, String email, String nombre, String apellidos, int edad, String ciudad, String pais) {
		setUsuario(usuario);
		setClave(clave);
		setEmail(email);
		setNombre(nombre);
		setApellidos(apellidos);
		setEdad(edad);
		setCiudad(ciudad);
		setPais(pais);
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

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return this.apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
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
	
	public boolean datosCorrectos() {
		correcto = true;
		return this.correcto;
	}
}
