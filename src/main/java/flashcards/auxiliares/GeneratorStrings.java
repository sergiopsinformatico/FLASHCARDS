package main.java.flashcards.auxiliares;

public class GeneratorStrings {
	
	public String randomString(int size) {
		
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz"; 

		StringBuilder sb = new StringBuilder(size); 
		
		for (int i = 0; i < size; i++) { 
			int index = (int)(AlphaNumericString.length() * Math.random()); 
			sb.append(AlphaNumericString.charAt(index)); 
		} 
		
		return sb.toString();
		
	}
}
