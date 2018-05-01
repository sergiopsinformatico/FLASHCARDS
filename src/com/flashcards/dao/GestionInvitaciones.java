package com.flashcards.dao;

import java.util.LinkedList;

import com.flashcards.db.DBInvitaciones;
import com.flashcards.modelo.Invitacion;

public class GestionInvitaciones {
	
	DBInvitaciones dB;
	
	public GestionInvitaciones() {
		dB = new DBInvitaciones();
	}
	
	public boolean insertarInvitacion(Invitacion invitacion) {
		return dB.insertarInvitacion(invitacion);
	}
	
	public LinkedList<Invitacion> leerInvitaciones(String recibe) {
		return dB.leerInvitaciones(recibe);
	}
	
	public boolean eliminarInvitacion(String recibe, String club) {
		return dB.eliminarInvitacion(recibe, club);
	}
}
