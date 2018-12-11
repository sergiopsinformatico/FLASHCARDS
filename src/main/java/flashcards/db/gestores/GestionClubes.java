package main.java.flashcards.db.gestores;

import java.util.ArrayList;

public class GestionClubes {
	/*DBClubes dB;
	ArrayList<String> clubes, miembros;
	String aux;
	int indice;
	GestorUsuarios gU = new GestorUsuarios();
	
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
	
	public String leerClubesUsuarioJSON(String usuario){
		aux = "";
		clubes = dB.readClubesUsuario(usuario);
		for(indice=0; indice<clubes.size(); indice++) {
			if(indice==0) {
				aux = clubes.get(indice);
			}else {
				aux = aux + "///****nuevoCLUB****///" + clubes.get(indice);
			/*}
		}
		return aux;
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
	
	public ArrayList<String> leerClubesUsuario(String usuario){
		return dB.readAllClubesUser(usuario);
	}
	
	public String leerMiembrosClubJSON(String identificador){
		aux = "";
		miembros = dB.readMiembros(identificador);
		gU = new GestorUsuarios();
		for(indice=0; indice<miembros.size(); indice++) {
			if(indice==0) {
				aux = gU.getNyA(miembros.get(indice)+"///****user****///"+miembros.get(indice));
		/*	}else {
				aux = aux + "///****nMiembro****///" + gU.getNyA(miembros.get(indice)+"///****user****///"+miembros.get(indice));
		/*	}
		}
		return aux;
	}*/
}