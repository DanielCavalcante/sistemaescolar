package com.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;

import com.annotation.Permissao;
import com.model.Perfil;
import com.repository.PerfilRepository;
import com.util.ControllerUtil;
import com.util.ValidatorUtils;

@Controller
@Path("/perfis")
public class PerfisController extends ControllerUtil {
	
	@Inject private PerfilRepository repository;
	
	@Get("")
	@Permissao(permissoes=com.util.enums.Permissao.PERFIL_LISTAR)
	public List<Perfil> list() {
		List<Perfil> list = (List<Perfil>) repository.list();
		inbox.listaVazia(list);
		return list;
	}
	
	@Get("/form")
	@Permissao(permissoes=com.util.enums.Permissao.PERFIL_CRIAR)
	public void create() {
		result.include("permissaoList", new Perfil().getListaPermissoes());
	}
	
	@Post("/save")
	@Permissao(permissoes={com.util.enums.Permissao.PERFIL_CRIAR, com.util.enums.Permissao.PERFIL_EDITAR})
	public void save(Perfil perfil, List<String> listaPermissoes) {
		if (!validate(perfil, listaPermissoes)) {
			inbox.informeTodosOsCamposObrigatorios();
			result.include("perfil", perfil);
			result.redirectTo(this).create();
		} else {
			perfil.setListaPermissoes(listaPermissoes);
			repository.save(perfil);
			inbox.message("msg.save.success").success();
		}
		result.redirectTo(this).list();
	}
	
	@Path("/edit/{id}")
	@Permissao(permissoes=com.util.enums.Permissao.PERFIL_EDITAR)
	public void edit(Long id) {
		Perfil perfil = null;
		if (id != null) {
			perfil = repository.find(id);
			result.include("perfil", perfil);
		}
		result.include("permissaoList", perfil.getListaPermissoes());
	}
	
	@Path("/delete")
	@Permissao(permissoes=com.util.enums.Permissao.PERFIL_DELETAR)
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
	
	private boolean validate(Perfil perfil, List<String> listaPermissoes) {
		return !ValidatorUtils.isEmpty(perfil.getNome()) &&
				!ValidatorUtils.isEmpty(listaPermissoes);
	}

}
