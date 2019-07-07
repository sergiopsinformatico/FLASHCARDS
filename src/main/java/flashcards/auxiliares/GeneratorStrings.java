package main.java.flashcards.auxiliares;

public class GeneratorStrings {
		
	private GeneratorStrings() {}
	
	public static String randomString(int size) {
		
		try {
			String caracteresValidos = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	                + "0123456789"
	                + "abcdefghijklmnopqrstuvxyz"; 

			StringBuilder sb = new StringBuilder(size); 
			
			for (int indice = 0; indice < size; indice++) {   
	            int index = (int)(caracteresValidos.length() * Math.random()); 	  
	            sb.append(caracteresValidos.charAt(index)); 
	        } 
	  
	        return sb.toString(); 
		}catch(Exception ex) {
			return "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		}

	}
}
