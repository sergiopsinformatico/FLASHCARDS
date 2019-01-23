package main.java.flashcards.auxiliares;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import main.java.flashcards.dto.EliminarCuentaDTO;
import main.java.flashcards.dto.UsuarioDTO;


public class Email {
	private String envia;
	private String recibe;
	private String asunto;
	private String mensaje;
	boolean enviado;
	
	final String saludo = "Hola ";
	final String cierre = "\nAtentamente, Equipo de Flashcards.";
	final String usuario = "\nUsuario: ";
	final String clave = "\nClave: ";
	final String claveDB = "SistemaFlashcardsSergio";
	
	public Email() {
		setEnvia("sistemaflashcards@gmail.com");
	}
	
	public boolean activarCuenta(UsuarioDTO user, String url) {
		//Asunto
		setAsunto("[Flashcards] Activacion Cuenta: "+user.getUsername());
		//Mensaje
		setMensaje("Bienvenido a la Aplicacion Flashcards!!"+
		"\nPara poder finalizar el registro de su cuenta debe de pulsar sobre el siguiente enlace que aparece a continuacion."+
		"\n"+url+
		"\nDispone de 24 horas para activar la cuenta. En caso de que no lo haga, debe de volverse a registrar."+
		"\nHaciendo clic, acepta que almacenemos en nuestros ficheros los datos que nos haya proporcionado."+
		cierre);
		//Email de quien recibe el mensaje
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean confirmaCuentaCreada(UsuarioDTO user) {
		//Asunto
		setAsunto("[Flashcards] Nueva Cuenta Creada "+user.getUsername());
		//Mensaje
		setMensaje("Su cuenta ha sido creada satisfactoriamente. Sus datos de registro son los siguientes:"+
		usuario+user.getUsername()+
		"\nEmail: "+user.getEmail()+
		clave+user.getClave()+
		cierre);
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean eliminarCuenta(EliminarCuentaDTO elimina, String email) {
		//Asunto
		setAsunto("[Flashcards] Cuenta Eliminada ("+elimina.getUsername()+") - 14 dias");
		//Mensaje
		setMensaje(saludo+elimina.getUsername()+","+
        "\nSu cuenta va a proceder a eliminarse por completo el "+elimina.getFecha()+"."+
		"\nSi accede antes al sistema con su cuenta, su cuenta no se va a eliminar."+
        cierre);
		//Email de quien recibe el mensaje
		setRecibe(email);
		return enviarMensaje();
	}
	
	public boolean recuperarClave(UsuarioDTO user) {
		//Asunto
		setAsunto("[Flashcards] Recuperacion de la clave de "+user.getEmail());
		//Mensaje
		setMensaje(saludo+user.getUsername()+"!!"+
		"\nHa solicitado recuperacion de sus datos de su cuenta en Flashcards:"+
		usuario+user.getEmail()+" o "+user.getUsername()+
		clave+user.getClave()+
		cierre);
		//Email de quien recibe el mensaje
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean reactivacionCuenta(UsuarioDTO user) {
		//Asunto
		setAsunto("[Flashcards] Reactivacion de la cuenta de "+user.getUsername());
		//Mensaje
		setMensaje(saludo+user.getNombreApellidos()+"!!"+
		"\nSu cuenta en Flashcards, se ha reactivado y no sera borrada:"+
		usuario+user.getEmail()+" o "+user.getUsername()+
		clave+user.getClave()+
		cierre);
		//Email de quien recibe el mensaje
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean enviarMensaje() {
		enviado = false;
		try{
			Properties properties = System.getProperties();
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			
			Session session = Session.getDefaultInstance(properties, null);
			
			MimeMessage message = new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(getRecibe()));
			message.setSubject(getAsunto());
			message.setContent(getMensaje(), "text/plain");
			
			Transport transporte = session.getTransport("smtp");
			transporte.connect("smtp.gmail.com", getEnvia(), getClave());
			transporte.sendMessage(message, message.getAllRecipients());
			transporte.close();
			
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
		return claveDB;
	}
	
}
