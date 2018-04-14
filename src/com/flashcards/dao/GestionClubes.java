package com.flashcards.dao;

import java.util.ArrayList;

import com.flashcards.db.DBClubes;
import com.flashcards.modelo.Club;

public class GestionClubes {
	DBClubes dB;
	
	public GestionClubes() {
		dB = new DBClubes();
	}
	
	public boolean crearClub(Club club) {
		return dB.insertClub(club);
	}
	
	public boolean existeClub(String nombre) {
		return dB.existClub(nombre);
	}
	
	public Club leerClub(String nombre) {
		return dB.readClub(nombre);
	}
	
	public boolean actualizarClub(Club club) {
		return dB.updateClub(club);
	}
	
	public boolean eliminarClub(String nombre) {
		return dB.deleteClub(nombre);
	}
	
	public ArrayList<String> leerClubes(){
		return dB.readAllClubes();
	}
}