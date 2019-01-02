package main.java.flashcards.auxiliares;

import java.net.URL;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import main.java.flashcards.dto.UsuarioDTO;


public class Email {
	String envia, recibe, asunto, mensaje;
	boolean enviado;

	private Properties properties;
	private Session session;
	private MimeMessage message;
	private Transport t;
	
	public Email() {
		setEnvia("sistemaflashcards@gmail.com");
	}
	
	public boolean confirmaCreaCuenta(UsuarioDTO user, String url) {
		//Asunto
		setAsunto("[Flashcards] Nueva Cuenta Creada "+user.getUsername());
		//Mensaje
		setMensaje("Bienvenido a la Aplicacion Flashcards!!"+
		"\nPara poder finalizar el registro de su cuenta debe de pulsar sobre el siguiente enlace que aparece a continuacion."+
		"\n"+url+
		"\nHaciendo clic, acepta que almacenemos en nuestros ficheros los datos que nos haya proporcionado."+
		"\nAtentamente, Equipo de Flashcards.");
		//Email de quien recibe el mensaje
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean eliminarCuenta(UsuarioDTO user, String fecha) {
		//Asunto
		setAsunto("[Flashcards] Cuenta Eliminada ("+user.getUsername()+") - 14 dias");
		//Mensaje
		setMensaje("Estimado "+user.getNombreApellidos()+","+
        "\nSu cuenta va a proceder a eliminarse por completo el "+fecha+"."+
		 "\nSi accede antes al sistema con su cuenta, su cuenta no será eliminada."+
        "\nUn saludo. Equipo de Flashcards.");
		//Email de quien recibe el mensaje
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean recuperarClave(UsuarioDTO user) {
		//Asunto
		setAsunto("[Sistema Flashcards] Recuperación de la clave de "+user.getEmail());
		//Mensaje
		setMensaje("Hola "+user.getNombreApellidos()+"!!"+
		"\nHa solicitado recuperación de sus datos de su cuenta en Flashcards:"+
		"\nUsuario: "+user.getEmail()+" o "+user.getUsername()+
		"\nClave: "+user.getClave()+
		"\nAtentamente, Equipo de Gestión de Sistema Flashcards.");
		//Email de quien recibe el mensaje
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean reactivacionCuenta(UsuarioDTO user) {
		//Asunto
		setAsunto("[Sistema Flashcards] Reactivacion de la cuenta de "+user.getEmail());
		//Mensaje
		setMensaje("Hola "+user.getNombreApellidos()+"!!"+
		"\nSu cuenta en Flashcards, se ha reactivado y no será borrada:"+
		"\nUsuario: "+user.getEmail()+" o "+user.getUsername()+
		"\nClave: "+user.getClave()+
		"\nAtentamente, Equipo de Gestión de Sistema Flashcards.");
		//Email de quien recibe el mensaje
		setRecibe(user.getEmail());
		return enviarMensaje();
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
		return "SistemaFlashcardsSergio";
	}
	
}
