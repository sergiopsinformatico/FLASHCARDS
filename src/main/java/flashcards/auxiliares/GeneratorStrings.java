package main.java.flashcards.auxiliares;

import java.util.Random;

public class GeneratorStrings {
		
	private GeneratorStrings() {}
	
	 
	
	public static String randomString(int size) {
		
		try {
			String caracteresValidos = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	                + "0123456789"
	                + "abcdefghijklmnopqrstuvxyz"; 

			StringBuilder sb = new StringBuilder(size); 
			
			
			Random rand = new Random();
			float numeroAleatorio = 0;
			
			for (int indice = 0; indice < size; indice++) {
				numeroAleatorio = rand.nextFloat();
	            int index = (int)(caracteresValidos.length() * numeroAleatorio); 	  
	            sb.append(caracteresValidos.charAt(index)); 
	        } 
	  
	        return sb.toString(); 
		}catch(Exception ex) {
			return "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		}

	}
}
