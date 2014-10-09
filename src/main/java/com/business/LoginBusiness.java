package com.business;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import com.model.Usuario;
import com.repository.LoginRepository;
import com.util.PasswordUtil;

public class LoginBusiness implements LoginRepository {

	@Inject private EntityManager manager;

	public Usuario autenticar(String login, String senha) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		
		Usuario usuario = search(login, new PasswordUtil().encrypt(senha));
		
		if (usuario == null) {
			usuario = search(login, senha);
		}
		
		return usuario;
	}

	private Usuario search(String login, String senha) {
		try {
			return (Usuario) manager.
				createQuery("from Usuario where login = '" + login + "' and senha = '" + senha + "'").getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
