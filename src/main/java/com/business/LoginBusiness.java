package com.business;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import com.model.Usuario;
import com.repository.LoginRepository;

public class LoginBusiness implements LoginRepository {

	@Inject private EntityManager manager;

	public Usuario autenticar(String login, String senha) {
		try {
			Query query = manager.createQuery("from Usuario where login = '"
					+ login + "' and senha =  '" + senha +"'");
			
			return (Usuario) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}
