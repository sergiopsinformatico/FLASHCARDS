package main.java.flashcards.auxiliares;
import java.security.MessageDigest;

public class MD5Gravatar {
	private MD5Gravatar() {
		throw new IllegalStateException("Genera Codigo MD5 para Gravatar");
	}
	
	private static String hex(byte[] array) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < array.length; ++i) {
			sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
		}
		return sb.toString();
	}
	public static String md5Hex (String message, String hash) {
		try {
			MessageDigest md = MessageDigest.getInstance((hash.split("\n"))[1]);
			return hex (md.digest(message.getBytes((hash.split("\n"))[2])));
		} catch (Exception ex) {
			return null;
		}
	}
}