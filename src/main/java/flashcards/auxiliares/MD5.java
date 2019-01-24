package main.java.flashcards.auxiliares;
import java.security.MessageDigest;
import java.security.SecureRandom;

public class MD5 {
	private MD5() {
		throw new IllegalStateException("Genera Codigo MD5 para Gravatar");
	}
	
	public static String getMD5Encryption (String message) {
		byte[] salt = getSalt();
        return getSecurePassword(message, salt);
	}
	
	private static String getSecurePassword(String passwordToHash, byte[] salt){
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(salt);
            byte[] bytes = md.digest(passwordToHash.getBytes());
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++){
            	sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        }
        catch (Exception e) {
        	generatedPassword = "";
        }
        return generatedPassword;
    }
     
    private static byte[] getSalt(){
    	 byte[] salt = new byte[16];
    	 try {
    		 SecureRandom sr = SecureRandom.getInstance("SHA1PRNG", "SUN");
    		 sr.nextBytes(salt);
    	 }catch(Exception ex) {
    		 salt = new byte[16];
    	 }
        return salt;
    }
}