package com.flashcards.db.gestores;

import com.flashcards.db.dao.DBSolicitudModerador;
import com.flashcards.modelo.SolicitudModerador;

public class GestionSolicitudModerador {
	DBSolicitudModerador dB;
	
	public GestionSolicitudModerador() {
		dB = new DBSolicitudModerador();
	}
	
	public boolean insertarSolicitud(SolicitudModerador sM) {
		return dB.createSoliciud(sM);
	}
	
	public boolean existeSolicitud(SolicitudModerador sM) {
		return dB.existUsuario(sM);
	}
	
	public boolean borrarSolicitud(SolicitudModerador sM) {
		return dB.deleteUsuario(sM);
	}
}
