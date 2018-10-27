package com.flashcards.db.gestores;

import com.flashcards.db.DBAcceso;
import com.flashcards.modelo.SolicitudAcceso;

public class GestionAcceso {
	DBAcceso dB;
	
	public GestionAcceso() {
		dB = new DBAcceso();
	}
	
	public boolean insertarAcceso(SolicitudAcceso sA) {
		return dB.insertarSolicitud(sA);
	}
	
	public String leerSolicitudes(String identificador){
		return dB.leerSolicitudes(identificador);
	}
	
	public boolean existeSolicitud(SolicitudAcceso sA) {
		return dB.existeSolicitud(sA);
	}
	
	public boolean eliminarSolicitud(SolicitudAcceso sA) {
		return dB.eliminarSolicitud(sA);
	}
}
