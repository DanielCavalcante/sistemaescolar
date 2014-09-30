package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;

import com.annotation.Permissao;
import com.filters.ProfessorFiltro;
import com.model.Professor;
import com.repository.CidadeRepository;
import com.repository.EstadoRepository;
import com.repository.ProfessorRepository;
import com.repository.TurmaRepository;
import com.util.ControllerUtil;
import com.util.ValidatorUtils;
import com.util.enums.ModeloCertidao;
import com.util.enums.Nacionalidade;
import com.util.enums.Sexo;

@Controller
@Path("/professores")
public class ProfessoresController extends ControllerUtil {

	@Inject private ProfessorRepository repository;
	@Inject private CidadeRepository cidadeRepository;
	@Inject private EstadoRepository estadoRepository;
	@Inject private TurmaRepository turmaRepository;

	@SuppressWarnings("unchecked")
	@Path("")
	@Permissao(permissoes=com.util.enums.Permissao.PROFESSOR_LISTAR)
	public List<Professor> list(ProfessorFiltro filtro) {
		List<Professor> list = new ArrayList<>();
		
		if (filtro == null || filtro.getNome() == null)
			list = (List<Professor>) repository.list();
		else 
			list = repository.find(filtro);
			
		inbox.listaVazia(list);
		result.include("professorList", list);
		result.include("filtro", filtro);
		return list;
	}

	@Path("/form")
	@Permissao(permissoes=com.util.enums.Permissao.PROFESSOR_CRIAR)
	public void create() {
		setDados();
	}

	@Post("/save")
	@Permissao(permissoes={com.util.enums.Permissao.PROFESSOR_CRIAR, com.util.enums.Permissao.PROFESSOR_EDITAR})
	public void save(Professor professor) throws ParseException {
		try {
			if (!validator(professor)) {
				inbox.informeTodosOsCamposObrigatorios();
				result.include("professor", professor);
				setDados();
				result.redirectTo(this).create();
			} else {
				if (professor.getDocumento() != null && 
						professor.getDocumento().getUfIdentidade() != null && 
						professor.getDocumento().getUfIdentidade().getId() == null) {
					professor.getDocumento().setUfIdentidade(null);
				}
				if (professor.getDocumento() != null && professor.getDocumento().getNumeroMatricula() != null) {
					professor.getDocumento().setUfCartorio(null);
					professor.getDocumento().setCidadeCartorio(null);
				}
				if (professor.getTurmas() == null || professor.getTurmas().isEmpty())
					professor.setTurmas(null);
				
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				String data = sdf.format(professor.getDataNascimento());
				professor.setDataNascimento(sdf.parse(data));
				professor = repository.save(professor);
				inbox.message("msg.save.success").success();
				result.redirectTo(this).list(null);
			}
		} catch (Exception e) {
			inbox.operacaoNaoRealizada();
		}
	}
	
	@Path("/edit/{id}")
	@Permissao(permissoes=com.util.enums.Permissao.PROFESSOR_EDITAR)
	public void edit(Long id) {
		Professor professor = null;
		if (id != null) {
			professor = repository.find(id);
			result.include("professor", professor);
		}
		setDados();
	}

	@Path("/delete")
	@Permissao(permissoes=com.util.enums.Permissao.PROFESSOR_DELETAR)
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
			e.printStackTrace();
			inbox.message("msg.erro.deletar").danger();
		}
		result.forwardTo(this).list(null);
	}

	public void setDados() {
		result.include("listaSexo", Sexo.values());
		result.include("listaNacionalidade", Nacionalidade.values());
		result.include("listaCidades", cidadeRepository.list());
		result.include("listaEstados", estadoRepository.list());
		result.include("listaModelos", ModeloCertidao.values());
		result.include("listaTurmas", turmaRepository.list());
	}
	
	private boolean validator(Professor professor) {
		return !ValidatorUtils.isEmpty(professor.getNome()) &&
				!ValidatorUtils.isEmpty(professor.getDataNascimento()) &&
				!ValidatorUtils.isEmpty(professor.getSexo()) &&
				!ValidatorUtils.isEmpty(professor.getNacionalidade()) &&
				!ValidatorUtils.isEmpty(professor.getEstadoNascimento()) ||
				!ValidatorUtils.isEmpty(professor.getEstadoNascimento().getId()) &&
				!ValidatorUtils.isEmpty(professor.getCidadeNascimento()) ||
				!ValidatorUtils.isEmpty(professor.getCidadeNascimento().getId()) &&
				!ValidatorUtils.isEmpty(professor.getEndereco()) ||
				!ValidatorUtils.isEmpty(professor.getEndereco().getId()) && 
				!ValidatorUtils.isEmpty(professor.getEndereco().getCep()) &&
				!ValidatorUtils.isEmpty(professor.getEndereco().getRua()) &&
				!ValidatorUtils.isEmpty(professor.getEndereco()) ||
				!ValidatorUtils.isEmpty(professor.getEndereco().getUf()) ||
				!ValidatorUtils.isEmpty(professor.getEndereco().getUf().getId()) &&
				!ValidatorUtils.isEmpty(professor.getEndereco().getCidade()) ||
				!ValidatorUtils.isEmpty(professor.getEndereco().getCidade().getId());
	}
}