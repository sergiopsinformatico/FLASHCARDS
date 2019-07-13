package main.java.flashcards.db.dao;

import java.util.List;

import main.java.flashcards.dto.RelacionesUsuariosDTO;

public interface InterfaceDAORelacionesUsuarios {
	public boolean creaRelaciones(RelacionesUsuariosDTO relaciones);
	public RelacionesUsuariosDTO leerRelaciones(String username);
	public boolean actualizaRelaciones(RelacionesUsuariosDTO relaciones);
	public boolean eliminaRelaciones (String username);
	public boolean enviarPeticionAmistad(String envia, String recibe);
	public List<String> getPeticionesAmistadEnviadas(String username);
	public List<String> getPeticionesRecibidas(String username);
	public boolean aceptarInvitacion(String acepta, String amigoNuevo);
	public boolean rechazarInvitacion(String rechaza, String usuarioRechazado);
	public List<String> getAmigos(String username);
	public boolean eliminarAmigo(String amigo1, String amigo2);
	public boolean bloquearUsuario(String bloqueador, String bloqueado);
	public boolean desbloquearUsuario(String bloqueador, String desbloqueado);
	public List<String> getBloqueados(String username);
	public List<String> getBloqueadores(String username);
	public String tipoRelacion(String usuarioPregunta, String otroUsuario);
}
