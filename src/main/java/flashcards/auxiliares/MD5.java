package main.java.flashcards.auxiliares;
import java.security.MessageDigest;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5 {
	private MD5() {
		throw new IllegalStateException("Genera Codigo MD5 para Gravatar");
	}
	
	public static String hex(byte[] array) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < array.length; ++i) {
			sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
		}
		return sb.toString();
	}
	
	public static String getMD5Encryption (String message, String cryptographicAlgorithm, String codingBytes) {
		/*try {
			MessageDigest md = MessageDigest.getInstance(cryptographicAlgorithm);
			
			return hex(md.digest(message.getBytes(codingBytes)));
		} catch (Exception e) {
			return "";
		}*/
		return DigestUtils.md5Hex(message);
	}
}