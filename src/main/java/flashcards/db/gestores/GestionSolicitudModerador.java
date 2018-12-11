package main.java.flashcards.db.gestores;

import main.java.flashcards.db.DBSolicitudModerador;
import main.java.flashcards.dto.SolicitudModerador;

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
