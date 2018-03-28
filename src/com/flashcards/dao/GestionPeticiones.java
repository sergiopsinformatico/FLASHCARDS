package com.flashcards.dao;

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
	
	public PeticionDeAmistad leerPeticion(String envia, String recibe) {
		return dB.readPeticion(envia, recibe);
	}
	
	public boolean actualizarPeticion(PeticionDeAmistad peticion) {
		return dB.updatePeticion(peticion);
	}
	
	public boolean eliminarPeticion(PeticionDeAmistad peticion) {
		return dB.deletePeticion(peticion);
	}
	
}
