package main.java.flashcards.brokers;

import main.java.flashcards.db.dao.InterfaceDAOActivaCuenta;
import main.java.flashcards.db.dao.InterfaceDAOClub;
import main.java.flashcards.db.dao.InterfaceDAOEliminarCuenta;
import main.java.flashcards.db.dao.InterfaceDAORecuperarCuenta;
import main.java.flashcards.db.dao.InterfaceDAORelacionesUsuarios;
import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.db.mongodb.ActivarCuentaMongoDB;
import main.java.flashcards.db.mongodb.ClubMongoDB;
import main.java.flashcards.db.mongodb.EliminarCuentaMongoDB;
import main.java.flashcards.db.mongodb.RecuperarCuentaMongoDB;
import main.java.flashcards.db.mongodb.RelacionesUsuariosMongoDB;
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
	public static InterfaceDAORecuperarCuenta getInstanciaRecuperarCuenta() {
		return new RecuperarCuentaMongoDB();
	}
	public static InterfaceDAOClub getInstanciaClub() {
		return new ClubMongoDB();
	}
	public static InterfaceDAORelacionesUsuarios getInstanciaRelaciones() {
		return new RelacionesUsuariosMongoDB();
	}

}
