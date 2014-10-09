package com.business;

import javax.persistence.EntityExistsException;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.model.Usuario;
import com.repository.UsuarioRepository;
import com.util.Constantes;
import com.util.GenericBusiness;
import com.util.PasswordUtil;

public class UsuarioBussines extends GenericBusiness<Usuario> implements
		UsuarioRepository {
	
	public UsuarioBussines() {
		super();
	}
	
	public Usuario saveUsuario(Usuario usuario) throws Exception {
		verificaLoginDuplicado(usuario);
		Usuario old = usuario.getId() == null ? null : find(usuario.getId());
		encriptaSenha(usuario, old);
		if (old != null) {
			usuario.setRoot(old.isRoot());
		}
		if (usuario.getPerfil() != null && usuario.getPerfil().getId() == null)
			usuario.setPerfil(null);
		
		save(usuario);
		return usuario;
	}
	
	private void encriptaSenha(Usuario usuario, Usuario old) throws Exception {
		boolean encrypt = usuario.getId() == null;
		
		if (!encrypt) {
			encrypt = old.getSenha().equals(Constantes.DEFAULT_PASSWORD) || !old.getSenha().equals(usuario.getSenha());
		}
		
		if (encrypt) {
			try {
				String senha = new PasswordUtil().encrypt(usuario.getSenha());
				usuario.setSenha(senha);
			} catch (Exception e) {
				throw e;
			}
		}
		
	}

	private void verificaLoginDuplicado(Usuario usuario) {
		Criteria c = createCriteria(Usuario.class);
		c.setMaxResults(1);
		c.add(Restrictions.eqOrIsNull("login", usuario.getLogin()));
		if (usuario.getId() != null)
			c.add(Restrictions.ne("id", usuario.getId()));
		
		if (!c.list().isEmpty())
			throw new EntityExistsException("O login informado ja esta em uso");
	}

}
