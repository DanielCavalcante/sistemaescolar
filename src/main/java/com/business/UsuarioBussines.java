package com.business;

import com.model.Usuario;
import com.repository.UsuarioRepository;
import com.util.GenericBusiness;

public class UsuarioBussines extends GenericBusiness<Usuario> implements
		UsuarioRepository {

	public UsuarioBussines() {
		super();
	}

}
