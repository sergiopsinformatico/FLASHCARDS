package main.java.flashcards.auxiliares;

public class GeneratorStrings {
	
	private GeneratorStrings() {}
	
	public static String randomString(int size) {
		
		String caracteresValidos = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz"; 

		StringBuilder sb = new StringBuilder(size); 
		
		for (int i = 0; i < size; i++) { 
			int index = (int)(caracteresValidos.length() * Math.random()); 
			sb.append(caracteresValidos.charAt(index)); 
		} 
		
		return sb.toString();
		
	}
}
