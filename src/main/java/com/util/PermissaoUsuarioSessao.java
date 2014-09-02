package com.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.caelum.vraptor.controller.ControllerMethod;

import com.model.Permissao;
import com.model.Usuario;

public class PermissaoUsuarioSessao {
	
	private Usuario usuario;
	private Map<String, Boolean> mapPermissoesUsuario = new  HashMap<String, Boolean>();
	private List<String> listaPermissoes = new ArrayList<>();
	
	public PermissaoUsuarioSessao(Usuario usuario) {
		this.usuario = usuario;
		setListaPermissoes();
	}

	private void setListaPermissoes() {
		if (!usuario.isRoot() && usuario.getPerfil() != null && usuario.getPerfil().getPermissoes() != null) {
			for (Permissao p : usuario.getPerfil().getListaPermissoes()) {
				if (p.isChecked())
					listaPermissoes.add(p.getNome().toLowerCase());
			}
		}
	}
	
	public boolean temPermissao(String permissao) {
		if (usuario.isRoot())
			return true;
		
		if (permissao.contains(",")) {
			String [] array = permissao.split(",");
			for (String p : array) {
				if (listaPermissoes.contains(p.trim().toLowerCase()))
					return true;
			}
		}
		return listaPermissoes.contains(permissao.toString().toLowerCase());
	}
	
	public boolean temPermissao(ControllerMethod method) {
		//Se o usuário não for root e o método possuir a anotação de permissão,
		//o método será verificado.
		if (!usuario.isRoot() && method.getMethod().isAnnotationPresent(com.annotation.Permissao.class)) {
			
			//Chave do map de permissões do usuário, no formato: NOME_CONTROLLER-NOME-METODO.
			final String key = method.getMethod().getDeclaringClass().getName() + "-" + method.getMethod().getName();
			
			//Se o método já foi verificado alguma vez, sua permissão é recuperada.
			if (mapPermissoesUsuario.containsKey(key)){
				return mapPermissoesUsuario.get(key);
				
			//Caso o método ainda não tenha sido verificado
			} else {
				com.util.enums.Permissao[] permissoes = ((com.annotation.Permissao) method.getMethod().getAnnotation(com.annotation.Permissao.class)).permissoes();
				
				boolean metodoPermitido = false;
				
				for (com.util.enums.Permissao p : permissoes) {
					//Se alguma das permissões do método estiver presente na lista de permissões do usuário
					//o método pode ser acessado.
					if (listaPermissoes.contains(p.toString().toLowerCase())) {
						metodoPermitido = true;
						break;
					}
				}
				//Adiciona ao map permissão de acesso do controller-metodo
				mapPermissoesUsuario.put(key, metodoPermitido);
				return metodoPermitido;
			}
		}
		return usuario.isRoot() || !method.getMethod().isAnnotationPresent(com.annotation.Permissao.class);
	}
}

