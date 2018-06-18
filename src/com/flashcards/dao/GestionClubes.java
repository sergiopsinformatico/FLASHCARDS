package com.flashcards.dao;

import java.util.ArrayList;
import com.flashcards.db.DBClubes;
import com.flashcards.modelo.Club;

public class GestionClubes {
	DBClubes dB;
	ArrayList<String> clubes;
	String aux;
	int indice;
	
	public GestionClubes() {
		dB = new DBClubes();
	}
	
	public boolean crearClub(Club club) {
		return dB.insertClub(club);
	}
	
	public boolean existeClubIdentificador(String identificador) {
		return dB.existIdentificador(identificador);
	}
	
	public Club leerClubConIdentificador(String identificador) {
		return dB.readClubByIdentificador(identificador);
	}
	
	public boolean actualizarClub(Club club) {
		return dB.updateClub(club);
	}
	
	public boolean eliminarClub(String identificador) {
		return dB.deleteClub(identificador);
	}
	
	public boolean perteneceWithIdentificador(String usuario, String identificador) {
		return dB.perteneceIdentificador(usuario, identificador);
	}
	
	public ArrayList<String> leerClubes(){
		return dB.readAllClubes();
	}
	
	public String leerClubesUsuarioJSON(String usuario){
		aux = "";
		clubes = dB.readClubesUsuario(usuario);
		for(indice=0; indice<clubes.size(); indice++) {
			if(indice==0) {
				aux = clubes.get(indice);
			}else {
				aux = aux + "///****nuevoCLUB****///" + clubes.get(indice);
			}
		}
		return aux;
	}
}