package com.flashcards.db.gestores;

import java.util.LinkedList;

import com.flashcards.db.DBPeticiones;
import com.flashcards.modelo.PeticionDeAmistad;

public class GestionPeticiones {
	
	DBPeticiones dB;
	
	public GestionPeticiones() {
		dB= new DBPeticiones();
	}
	
	public boolean crearPeticiones(PeticionDeAmistad peticion) {
		return dB.createPeticion(peticion);
	}
	
	public LinkedList<PeticionDeAmistad> leerPeticionRecibida(String recibe) {
		return dB.readPeticionRecibida(recibe);
	}
	
	public LinkedList<PeticionDeAmistad> leerPeticionEnviada(String envia) {
		return dB.readPeticionEnviada(envia);
	}
	
	public boolean actualizarPeticion(PeticionDeAmistad peticion) {
		return dB.updatePeticion(peticion);
	}
	
	public boolean existe(PeticionDeAmistad peticion) {
		return dB.existPeticion(peticion);
	}
	
	public boolean eliminarPeticion(PeticionDeAmistad peticion) {
		return dB.deletePeticion(peticion);
	}
	
}
