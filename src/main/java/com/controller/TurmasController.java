package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;

import com.annotation.Permissao;
import com.filters.TurmaFiltro;
import com.model.Turma;
import com.repository.ProfessorRepository;
import com.repository.TurmaRepository;
import com.util.ControllerUtil;
import com.util.ValidatorUtils;

@Controller
@Path("/turmas")
public class TurmasController extends ControllerUtil {

	@Inject private TurmaRepository repository;
	@Inject private ProfessorRepository professorRepository;
	
	@SuppressWarnings("unchecked")
	@Path("")
	@Permissao(permissoes=com.util.enums.Permissao.TURMA_LISTAR)
	public List<Turma> list(TurmaFiltro filtro) {
		List<Turma> list = new ArrayList<>();
		
		if (filtro == null || filtro.getNome() == null)
			list = (List<Turma>) repository.list();
		else 
			list = repository.find(filtro);
		
		inbox.listaVazia(list);
		result.include("filtro", filtro);
		return (List<Turma>) list;
	}

	@Path("/form")
	@Permissao(permissoes=com.util.enums.Permissao.TURMA_CRIAR)
	public void create() {
		setDados();
	}

	@Post("/save")
	@Permissao(permissoes={com.util.enums.Permissao.TURMA_CRIAR, com.util.enums.Permissao.TURMA_EDITAR})
	public void save(Turma turma) {
		try {
			if (!validate(turma)) {
				inbox.informeTodosOsCamposObrigatorios();
				result.include("turma", turma);
				result.redirectTo(this).create();
			} else {
				turma.setProfessores(null);
				turma = repository.save(turma);
				inbox.message("msg.save.success").success();
			}
		} catch (Exception e) {
			inbox.operacaoNaoRealizada();
		}
		result.redirectTo(this).list(null);
	}


	@Path("/edit/{id}")
	@Permissao(permissoes=com.util.enums.Permissao.TURMA_EDITAR)
	public void edit(Long id) {
		Turma turma = null;
		if (id != null) {
			turma = repository.find(id);
			result.include("turma", turma);
		}
		setDados();
	}

	@Path("/delete")
	@Permissao(permissoes=com.util.enums.Permissao.TURMA_DELETAR)
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
		result.redirectTo(this).list(null);
	}

	private void setDados() {
		result.include("listaProfessores", professorRepository.list());
	}
	
	private boolean validate(Turma turma) {
		return !ValidatorUtils.isEmpty(turma.getNome()) &&
				!ValidatorUtils.isEmpty(turma.getHoraInicio()) &&
				!ValidatorUtils.isEmpty(turma.getHoraFinal()) &&
				!ValidatorUtils.isEmpty(turma.getModalidade());
	}

}
