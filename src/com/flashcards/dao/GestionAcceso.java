package com.flashcards.dao;

import java.util.LinkedList;

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
	
	public LinkedList<String> leerSolicitudes(String club){
		return dB.leerSolicitudes(club);
	}
	
	public boolean eliminarSolicitud(SolicitudAcceso sA) {
		return dB.eliminarSolicitud(sA);
	}
}
