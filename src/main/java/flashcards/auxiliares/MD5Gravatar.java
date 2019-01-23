package main.java.flashcards.auxiliares;
import java.security.MessageDigest;

public class MD5Gravatar {
	
	private MD5Gravatar() {
		throw new IllegalStateException("Genera Codigo MD5 para Gravatar");
	}
	
	public static String hex(byte[] array) {
	      StringBuilder sb = new StringBuilder();
	      for (int i = 0; i < array.length; ++i) {
	    	  sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));        
	      }
	      return sb.toString();
	  }
	  public static String md5Hex (String message) {
	      try {
	    	  MessageDigest md = MessageDigest.getInstance("MD5");
	    	  return hex (md.digest(message.getBytes("CP1252")));
    	  } catch (Exception ex) {
    		  return "error";
	      }
	  }
}
