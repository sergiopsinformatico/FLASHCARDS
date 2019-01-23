package main.java.flashcards.auxiliares;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Fecha {
	
	String dia;
	Calendar hoy;
	SimpleDateFormat sdf;
	Date date1;
	Date date2;
	private static final Logger LOGGER = Logger.getLogger("main.java.flashcards.auxiliares.Fecha");
	
	public String compararFechas(String fecha1, String fecha2) {
		/* Devuelve 0 si fecha1 == fecha2
		 * Devuelve <0 si fecha1<fecha2 (fecha1 antes fecha2)
		 * Devuelve >0 si fecha1>fecha2 (fecha1 despues fecha2) */
		try {
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			date1 = sdf.parse(fecha1);
			date2 = sdf.parse(fecha2);
			return date1.compareTo(date2)+"";
		}catch(Exception ex) {
			LOGGER.log(Level.INFO, ex.getMessage());
			return null;
		}
		
	}
	
	public String fechaHoy() {
		return generateDate(0);
	}
	
	public String fechaActivarCuenta() {
		return generateDate(1);
	}
	
	public String fechaEliminarCuenta() {
		return generateDate(14);
	}
	
	private String generateDate(int dias) {
		dia = "";
		hoy = Calendar.getInstance();
		hoy.add(Calendar.DAY_OF_YEAR, dias);
		dia = Integer.toString(hoy.get(Calendar.YEAR))+"-";
		if((hoy.get(Calendar.MONTH)+1)>=1 && (hoy.get(Calendar.MONTH)+1)<=9){
			dia = dia+"0"+(hoy.get(Calendar.MONTH)+1)+"-";
		}else {
			dia = dia+(hoy.get(Calendar.MONTH)+1)+"-";
		}
		if( hoy.get(Calendar.DATE)>=1 && hoy.get(Calendar.DATE)<=9){
			dia = dia+"0"+(hoy.get(Calendar.DATE));
		}else {
			dia = dia+(hoy.get(Calendar.DATE));
		}
		return dia;
	}
	
}
