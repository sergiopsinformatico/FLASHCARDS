package main.java.flashcards.auxiliares;

import java.security.SecureRandom;

public class GeneratorStrings {
		
	private GeneratorStrings() {}
	
	public static String randomString(int size) {
		
		try {
			String caracteresValidos = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	                + "0123456789"
	                + "abcdefghijklmnopqrstuvxyz"; 

			StringBuilder sb = new StringBuilder(size); 
			
			float numeroAleatorio = 0;
			
			for (int indice = 0; indice < size; indice++) {
				numeroAleatorio = SecureRandom.getInstanceStrong().nextFloat();
	            int index = (int)(caracteresValidos.length() * numeroAleatorio); 	  
	            sb.append(caracteresValidos.charAt(index)); 
	        } 
	  
	        return sb.toString(); 
		}catch(Exception ex) {
			return "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		}

	}
}
