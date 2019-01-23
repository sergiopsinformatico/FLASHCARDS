package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.ActivaCuentaDTO;

public interface InterfaceDAOActivaCuenta {
	public boolean activacionCuenta(ActivaCuentaDTO activaCuenta);
	public boolean insertaAC(ActivaCuentaDTO activaCuenta);
	public boolean eliminaAC(ActivaCuentaDTO activaCuenta);
	public List<ActivaCuentaDTO> leerTodas();
	public void comprobarActivacionesCaducadas();
}
