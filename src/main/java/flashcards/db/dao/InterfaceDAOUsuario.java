package main.java.flashcards.db.dao;

import java.util.List;
import main.java.flashcards.dto.UsuarioDTO;

public interface InterfaceDAOUsuario {
	public boolean insertUsuario(UsuarioDTO user);
	public boolean existEmail (String email);
	public boolean existUsername (String username);
	public boolean usernameIsCorrect(String username);
	public boolean claveIsCorrect(String clave);
	public boolean login(String usernameEmail, String clave);
	public UsuarioDTO getUsuarioDTO(String usernameEmail);
	public boolean updateUsuario(UsuarioDTO userAntiguo, UsuarioDTO userNuevo);
	public boolean deleteUsuario(UsuarioDTO user);
	public List<String> getListUsername();
	public List<String> getListEmail();
	public List<UsuarioDTO> getAllUsuarios(String username);
	public List<UsuarioDTO> getUsuariosRelacion(String username);
}