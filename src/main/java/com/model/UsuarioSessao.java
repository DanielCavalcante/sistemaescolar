package com.model;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import lombok.Getter;
import lombok.Setter;
import br.com.caelum.vraptor.controller.ControllerMethod;

import com.util.Constantes;
import com.util.PermissaoUsuarioSessao;

@SessionScoped
@Named("usuarioSessao")
@Getter @Setter
public class UsuarioSessao implements Serializable {
	
	private static final long serialVersionUID = 949304126995355488L;
	private Usuario usuario;
	private PermissaoUsuarioSessao controlePermissao;

	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
		this.controlePermissao = new PermissaoUsuarioSessao(usuario);
	}

	public boolean sessaoValida() {
		return usuario != null && usuario.getId() != null;
	}
	
	public void invalidaSessao() {
		usuario = null;
	}
	
	public boolean temPermissao(String permissao) {
		return controlePermissao.temPermissao(permissao);
	}
	
	public boolean temPermissao(ControllerMethod method) {
		return controlePermissao.temPermissao(method);
	}

	public boolean isSenhaAtualizada() {
		return !usuario.getSenha().equals(Constantes.DEFAULT_PASSWORD);
	}
}
