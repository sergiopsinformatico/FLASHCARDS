package main.java.flashcards.brokers;

import main.java.flashcards.db.dao.InterfaceDAOUsuario;
import main.java.flashcards.db.mongodb.UsuariosMongoDB;

public class Broker {
	public InterfaceDAOUsuario getInstanciaUsuario() {
		return new UsuariosMongoDB();
	}
}
