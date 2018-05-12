package com.flashcards.auxiliares;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Fecha {
	
	String dia;
	Calendar fecha;
	SimpleDateFormat sdf;
	Date date1, date2;
	
	public String compararFechas(String fecha1, String fecha2) {
		try {
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			date1 = sdf.parse(fecha1);
			date2 = sdf.parse(fecha2);
			return date1.compareTo(date2)+"";
		}catch(Exception ex) {
			ex.printStackTrace();
			return null;
		}
		
	}
	
	public String fechaHoy() {
		dia = "";
		fecha = Calendar.getInstance();
		dia = Integer.toString(fecha.get(Calendar.YEAR))+"-";
		if((fecha.get(Calendar.MONTH)+1)>=1 && (fecha.get(Calendar.MONTH)+1)<=9){
			dia = dia+"0"+(fecha.get(Calendar.MONTH)+1)+"-";
		}else {
			dia = dia+(fecha.get(Calendar.MONTH)+1)+"-";
		}
		if( fecha.get(Calendar.DATE)>=1 && fecha.get(Calendar.DATE)<=9){
			dia = dia+"0"+(fecha.get(Calendar.DATE));
		}else {
			dia = dia+(fecha.get(Calendar.DATE));
		}
		return dia;
	}
	
	public String fechaEliminarCuenta() {
		dia = "";
		fecha = Calendar.getInstance();
		fecha.add(Calendar.DAY_OF_YEAR, 14);
		dia = Integer.toString(fecha.get(Calendar.YEAR))+"-";
		if((fecha.get(Calendar.MONTH)+1)>=1 && (fecha.get(Calendar.MONTH)+1)<=9){
			dia = dia+"0"+(fecha.get(Calendar.MONTH)+1)+"-";
		}else {
			dia = dia+(fecha.get(Calendar.MONTH)+1)+"-";
		}
		if( fecha.get(Calendar.DATE)>=1 && fecha.get(Calendar.DATE)<=9){
			dia = dia+"0"+(fecha.get(Calendar.DATE));
		}else {
			dia = dia+(fecha.get(Calendar.DATE));
		}
		return dia;
	}
}
