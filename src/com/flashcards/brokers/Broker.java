package com.flashcards.brokers;

import com.flashcards.db.dao.InterfaceDAOUsuario;
import com.flashcards.db.mongoDB.UsuariosMongoDB;

public class Broker {
	public InterfaceDAOUsuario getInstanciaUsuario() {
		return new UsuariosMongoDB();
	}
}
