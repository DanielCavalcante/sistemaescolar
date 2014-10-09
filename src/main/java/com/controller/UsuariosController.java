package com.controller;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityExistsException;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;

import com.annotation.Permissao;
import com.model.Usuario;
import com.repository.PerfilRepository;
import com.repository.UsuarioRepository;
import com.util.ControllerUtil;
import com.util.ValidatorUtils;

@Controller
@Path("/usuarios")
public class UsuariosController extends ControllerUtil {

	private static final String ALTERAR_MEUS_DADOS = "alterarMeusDados";
	@Inject private UsuarioRepository repository;
	@Inject private PerfilRepository perfilRepository;

	@Get("")
	@Permissao(permissoes=com.util.enums.Permissao.USUARIO_LISTAR)
	public List<Usuario> list() {
		List<Usuario> list = (List<Usuario>) repository.list();
		inbox.listaVazia(list);
		result.include("usuarioList", list);
		return list;
	}
	
	@Get("/form")
	@Permissao(permissoes=com.util.enums.Permissao.USUARIO_CRIAR)
	public void create() {
		setDados();
	}
	
	@Post("/save")
	@Permissao(permissoes={com.util.enums.Permissao.USUARIO_CRIAR, com.util.enums.Permissao.USUARIO_EDITAR})
	public void save(Usuario usuario, boolean alterarMeusDados) {
		boolean erro = true;
		try {
			if (!validate(usuario)) {
				inbox.informeTodosOsCamposObrigatorios();
			} else if (!usuario.getSenha().trim().equals(usuario.getConfirmSenha().trim())) {
				inbox.message("msg.senhas.devem.ser.iguais").warning();
			} else {
				repository.saveUsuario(usuario);
				if (usuario.getId().equals(usuarioSessao.getUsuario().getId())) {
					usuarioSessao.setUsuario(usuario);
				}
				
				usuario.setConfirmSenha(usuario.getSenha());
				inbox.message("msg.usuario.usuario.save.success").success();
				erro = false;
			}
		} catch (EntityExistsException e) {
			inbox.message("msg.usuario.login.existe", "'"+usuario.getLogin()+"'").warning();
		} catch (Exception e) {
			e.printStackTrace();
			inbox.operacaoNaoRealizada();
		}
		
		if (alterarMeusDados) {
			result.redirectTo(this).form(usuario);
		} else {
			if (erro) {
				if (usuario.getId() == null) {
					result.include("usuario", usuario);
					result.redirectTo(this).create();
				} else {
					result.redirectTo(this).edit(usuario.getId(), usuario);
				}
			} else {
				result.redirectTo(this).list();
			}
		}
		
	}

	@Path("/edit/{id}")
	@Permissao(permissoes=com.util.enums.Permissao.USUARIO_EDITAR)
	public Usuario edit(Long id, Usuario usuario) {
		if (usuario == null || (usuario != null && usuario.getId() == null)) {
			usuario = repository.find(id);
			usuario.setConfirmSenha(usuario.getSenha());
		}
		result.include("usuario", usuario);
		setDados();
		return usuario;
	}
	
	@Path("/meusDados")
	public Usuario form(Usuario usuario) {
		result.include(ALTERAR_MEUS_DADOS, true);
		if (usuario == null || (usuario != null) && usuario.getId() == null) {
			usuario = repository.find(usuarioSessao.getUsuario().getId());
			usuario.setConfirmSenha(usuario.getSenha());
		} 
		if (!usuarioSessao.isSenhaAtualizada()) {
			inbox.message("msg.usuario.atualiza.senha");
		}
		setDados();
		result.include("usuario", usuario);
		return usuario;
	}

	public void setDados() {
		result.include("listaPerfil", perfilRepository.list());
	}

	@Path("/delete")
	@Permissao(permissoes=com.util.enums.Permissao.USUARIO_DELETAR)
	public void delete(Long[] id) {
		try {
			if (id == null || id.length == 0) {
				inbox.message("msg.nenhum.registro").danger();
			} else {
				for (Long i : id) {
					repository.delete(i);
				}
				inbox.message("msg.deletado.success").success();
			}
		} catch (Exception e) {
			inbox.message("msg.erro.deletar").danger();
		}
		result.redirectTo(this).list();
	}
	
	private boolean validate(Usuario usuario) {
		return !ValidatorUtils.isEmpty(usuario.getNome()) &&
				!ValidatorUtils.isEmpty(usuario.getLogin()) &&
				!ValidatorUtils.isEmpty(usuario.getSenha()) &&
				!ValidatorUtils.isEmpty(usuario.getConfirmSenha()) &&
				!ValidatorUtils.isEmpty(usuario.getPerfil()) &&
				!ValidatorUtils.isEmpty(usuario.getPerfil().getId());
	}

}
