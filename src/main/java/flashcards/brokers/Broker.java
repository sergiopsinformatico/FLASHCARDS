package main.java.flashcards.brokers;

import main.java.flashcards.db.dao.InterfaceDAOActivaCuenta;
import main.java.flashcards.db.dao.InterfaceDAOEliminarCuenta;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.db.mongodb.ActivarCuentaMongoDB;
import main.java.flashcards.db.mongodb.EliminarCuentaMongoDB;
import main.java.flashcards.db.mongodb.UsuariosMongoDB;

public class Broker {
	
	private Broker() {
		throw new IllegalStateException("Broker no se instancia");
	}
	
	public static InterfaceDAOUsuario getInstanciaUsuario() {
		return new UsuariosMongoDB();
	}
	public static InterfaceDAOActivaCuenta getInstanciaActivaCuenta() {
		return new ActivarCuentaMongoDB();
	}
	public static InterfaceDAOEliminarCuenta getInstanciaEliminarCuenta() {
		return new EliminarCuentaMongoDB();
	}

}
