package com.flashcards.db.gestores;

import java.util.LinkedList;

import com.flashcards.db.DBAmigos;
import com.flashcards.modelo.Amigos;

public class GestionAmigos {
	DBAmigos dB;
	LinkedList<String> amigos;
	int indice;
	String aux;
	GestorUsuarios gU = new GestorUsuarios();
	
	public GestionAmigos() {
		dB = new DBAmigos();
	}
	
	public boolean createAmigos(Amigos amigo) {
		return dB.createAmigos(amigo);
	}
	
	public LinkedList<String> getAmigos (String username) {
		return dB.getAmigos(username);
	}
	
	public String getAmigosJSON (String username) {
		aux="";
		amigos = getAmigos(username);
		for(indice=0; indice<amigos.size(); indice++) {
			if(indice==0) {
				aux = gU.getNyA(amigos.get(indice))+"///****user****///"+amigos.get(indice);
			}else {
				aux = aux + "///****nuevoAmigo****///" + gU.getNyA(amigos.get(indice))+"///****user****///"+amigos.get(indice);
			}
		}
		return aux;
	}
	
	public boolean deleteAmigos(Amigos am) {
		return dB.deleteAmigos(am);
	}
	
	public boolean existeAmigos(Amigos am) {
		return dB.existeAmigos(am);
	}
}
