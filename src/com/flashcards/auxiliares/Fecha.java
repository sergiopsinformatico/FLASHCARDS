package com.flashcards.auxiliares;

import java.util.Calendar;

public class Fecha {
	
	String dia;
	Calendar fecha;
	
	public String fechaHoy() {
		dia = "";
		fecha = Calendar.getInstance();
		dia = Integer.toString(fecha.get(Calendar.DATE))+"/"+Integer.toString(fecha.get(Calendar.MONTH)+1)+"/"+Integer.toString(fecha.get(Calendar.YEAR));
		return dia;
	}
	
	public String fechaEliminarCuenta() {
		dia = "";
		fecha = Calendar.getInstance();
		fecha.add(Calendar.DAY_OF_YEAR, 14);
		dia = Integer.toString(fecha.get(Calendar.DATE))+"/"+Integer.toString(fecha.get(Calendar.MONTH)+1)+"/"+Integer.toString(fecha.get(Calendar.YEAR));
		return dia;
	}
}
