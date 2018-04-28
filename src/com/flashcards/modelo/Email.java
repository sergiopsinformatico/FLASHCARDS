package com.flashcards.modelo;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	String envia, recibe, asunto, mensaje;
	boolean enviado;

	private Properties properties;
	private Session session;
	private MimeMessage message;
	private Transport t;
	
	public Email(String recibe, String asunto, String mensaje) {
		setEnvia("sistemaflashcards@gmail.com");
		setRecibe(recibe);
		setAsunto(asunto);
		setMensaje(mensaje);
	}
	
	public boolean enviarMensaje() {
		enviado = false;
		try{		
			properties = System.getProperties();
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			
			session = Session.getDefaultInstance(properties, null);
			
			message = new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(getRecibe()));
			message.setSubject(getAsunto());
			message.setContent(getMensaje(), "text/plain");
			
			t = session.getTransport("smtp");
			t.connect("smtp.gmail.com", getEnvia(), getClave());
			t.sendMessage(message, message.getAllRecipients());
			t.close();
			
			enviado = true;
		}catch (MessagingException me){
			enviado = false;
			me.printStackTrace();
		}
	    
		return enviado;
	}
	
	public String getEnvia() {
		return this.envia;
	}

	public void setEnvia(String envia) {
		this.envia = envia;
	}

	public String getRecibe() {
		return this.recibe;
	}

	public void setRecibe(String recibe) {
		this.recibe = recibe;
	}

	public String getAsunto() {
		return this.asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getMensaje() {
		return this.mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	
	private String getClave() {
		return "flashcardsSergio";
	}
	
}
