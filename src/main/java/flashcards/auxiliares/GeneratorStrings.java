package main.java.flashcards.auxiliares;

import java.security.SecureRandom;
import java.util.Random;

public class GeneratorStrings {
		
	private GeneratorStrings() {}
	
	public static String randomString(int size) {
		
		try {
			String caracteresValidos = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	                + "0123456789"
	                + "abcdefghijklmnopqrstuvxyz"; 

			StringBuilder sb = new StringBuilder(size); 
			
			Random numeroRandom = SecureRandom.getInstanceStrong();
			
			for (int i = 0; i < size; i++) { 
				int index = caracteresValidos.length() * numeroRandom.nextInt(); 
				sb.append(caracteresValidos.charAt(index)); 
			} 
			
			return sb.toString();
		}catch(Exception ex) {
			return "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		}
		
		
		
	}
}
