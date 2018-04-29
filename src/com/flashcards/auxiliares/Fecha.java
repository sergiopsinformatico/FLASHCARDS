package com.flashcards.auxiliares;

import java.util.Calendar;

public class Fecha {
	
	String dia;
	Calendar fecha;
	
	public String fechaHoy() {
		dia = "";
		fecha = Calendar.getInstance();
		dia = fecha.DAY_OF_MONTH+"-"+fecha.MONTH+"-"+fecha.YEAR;
		return dia;
	}
	
	public String fechaEliminarCuenta() {
		dia = "";
		fecha = Calendar.getInstance();
		fecha.add(Calendar.DAY_OF_MONTH, 14);
		dia = fecha.DAY_OF_MONTH+"-"+fecha.MONTH+"-"+fecha.YEAR;
		return dia;
	}
}
