package main.java.flashcards.auxiliares;

import java.util.Properties;
import javax.mail.Message;
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
	
	static final String SALUDO = "Hola ";
	static final String CIERRE = "\nAtentamente, Equipo de Flashcards.";
	static final String USUARIO = "\nUsuario: ";
	static final String CLAVE = "\nClave: ";
	static final String ENVIA_CONST = "envia";
	
	public boolean activarCuenta(UsuarioDTO user, String url) {
		setEnvia(PropertiesConfig.getProperties(ENVIA_CONST));
		setAsunto("[Flashcards] Activacion Cuenta: "+user.getUsername());
		setMensaje("Bienvenido a la Aplicacion Flashcards!!"+
		"\nPara poder finalizar el registro de su cuenta debe de pulsar sobre el siguiente enlace que aparece a continuacion."+
		"\n"+url+
		"\nDispone de 24 horas para activar la cuenta. En caso de que no lo haga, debe de volverse a registrar."+
		"\nHaciendo clic, acepta que almacenemos en nuestros ficheros los datos que nos haya proporcionado."+
		CIERRE);
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean confirmaCuentaCreada(UsuarioDTO user) {
		setEnvia(PropertiesConfig.getProperties(ENVIA_CONST));
		setAsunto("[Flashcards] Nueva Cuenta Creada "+user.getUsername());
		setMensaje("Su cuenta ha sido creada satisfactoriamente. Sus datos de registro son los siguientes:"+
		USUARIO+user.getUsername()+
		"\nEmail: "+user.getEmail()+
		CLAVE+user.getClave()+
		CIERRE);
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean eliminarCuenta(EliminarCuentaDTO elimina, String email) {
		setEnvia(PropertiesConfig.getProperties(ENVIA_CONST));
		setAsunto("[Flashcards] Cuenta Eliminada ("+elimina.getUsername()+") - 14 dias");
		setMensaje(SALUDO+elimina.getUsername()+","+
        "\nSu cuenta va a proceder a eliminarse por completo el "+elimina.getFecha()+"."+
		"\nSi accede antes al sistema con su cuenta, su cuenta no se va a eliminar."+
        CIERRE);
		setRecibe(email);
		return enviarMensaje();
	}
	
	public boolean recuperarClave(UsuarioDTO user, String key) {
		setEnvia(PropertiesConfig.getProperties(ENVIA_CONST));
		setAsunto("[Flashcards] Recuperacion de la clave de "+user.getEmail());
		setMensaje(SALUDO+user.getUsername()+"!!"+
		"\nHa solicitado recuperacion de sus datos de su cuenta en Flashcards."+
		"\nSiga el siguiente enlace: https://sistemaflashcards.herokuapp.com/restableceClave.html?username="+user.getUsername()+"&keySecurity="+key);
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	public boolean reactivacionCuenta(UsuarioDTO user) {
		setEnvia(PropertiesConfig.getProperties(ENVIA_CONST));
		setAsunto("[Flashcards] Reactivacion de la cuenta de "+user.getUsername());
		setMensaje(SALUDO+user.getNombreApellidos()+"!!"+
		"\nSu cuenta en Flashcards, se ha reactivado y no sera borrada:"+
		USUARIO+user.getEmail()+" o "+user.getUsername()+
		CLAVE+user.getClave()+
		CIERRE);
		setRecibe(user.getEmail());
		return enviarMensaje();
	}
	
	private boolean enviarMensaje() {
		enviado = false;
		try{
			Properties properties = System.getProperties();
			properties.put("mail.smtp.host", "smtp.gmail.com");
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
		}catch (Exception me){
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
		return PropertiesConfig.getProperties("claveDB");
	}
	
}
