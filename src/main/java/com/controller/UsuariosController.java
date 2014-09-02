package com.controller;

import java.util.List;

import javax.inject.Inject;

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
		return list;
	}
	
	@Get("/form")
	@Permissao(permissoes=com.util.enums.Permissao.USUARIO_CRIAR)
	public void create() {
		setDados();
	}
	
	@Post("/save")
	@Permissao(permissoes={com.util.enums.Permissao.USUARIO_CRIAR, com.util.enums.Permissao.USUARIO_EDITAR})
	public void save(Usuario usuario) {
		try {
			if (!validate(usuario)) {
				result.include("usuario", usuario);
				inbox.informeTodosOsCamposObrigatorios();
				result.redirectTo(this).create();
			} else {
				usuario = repository.save(usuario);
				inbox.message("msg.save.success").success();
			}
		} catch (Exception e) {
			inbox.operacaoNaoRealizada();
		}
		result.redirectTo(this).list();
	}

	@Path("/edit/{id}")
	@Permissao(permissoes=com.util.enums.Permissao.USUARIO_EDITAR)
	public void edit(Long id) {
		Usuario usuario = null;
		if (id != null) {
			usuario = repository.find(id);
			result.include("usuario", usuario);
		}
		setDados();
	}
	
	@Path("/meusDados")
	public Usuario form(Usuario usuario) {
		result.include(ALTERAR_MEUS_DADOS, true);
		if (usuario == null || (usuario != null) && usuario.getId() == null) {
			usuario = repository.find(usuarioSessao.getUsuario().getId());
		} else {
			usuarioSessao.invalidaSessao();
			result.redirectTo(LoginController.class).login();
		}
		setDados();
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
				!ValidatorUtils.isEmpty(usuario.getPerfil()) &&
				!ValidatorUtils.isEmpty(usuario.getPerfil().getId());
	}

}
