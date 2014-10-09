package com.repository;

import com.model.Usuario;
import com.util.GenericRepository;

public interface UsuarioRepository extends GenericRepository<Usuario> {
	
	Usuario saveUsuario(Usuario usuario) throws Exception;

}
