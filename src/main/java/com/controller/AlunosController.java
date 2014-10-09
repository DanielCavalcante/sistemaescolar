package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;

import com.annotation.Permissao;
import com.filters.AlunoFiltro;
import com.model.Aluno;
import com.model.Cidade;
import com.repository.AlunoRepository;
import com.repository.CidadeRepository;
import com.repository.EstadoRepository;
import com.repository.TurmaRepository;
import com.util.ControllerUtil;
import com.util.ValidatorUtils;
import com.util.enums.ModeloCertidao;
import com.util.enums.Nacionalidade;
import com.util.enums.Raca;
import com.util.enums.Sexo;
import com.util.enums.TipoCertidao;

@Controller
public class AlunosController extends ControllerUtil {

	@Inject private AlunoRepository repository;
	@Inject private CidadeRepository cidadeRepository;
	@Inject private EstadoRepository estadoRepository;
	@Inject private TurmaRepository turmaRepository;

	@SuppressWarnings("unchecked")
	@Path("/alunos")
	@Permissao(permissoes=com.util.enums.Permissao.ALUNO_LISTAR)
	public List<Aluno> list(AlunoFiltro filtro) {
		List<Aluno> list = new ArrayList<>();
		
		if (filtro == null || filtro.getNome() == null)
			list = (List<Aluno>) repository.list();
		else 
			list = repository.find(filtro);
		
		inbox.listaVazia(list);
		result.include("alunoList", list);
		result.include("filtro", filtro);
		return list;
	}

	@Get("/alunos/form")
	@Permissao(permissoes=com.util.enums.Permissao.ALUNO_CRIAR)
	public void create() {
		result.include("listaDeficiencias", new Aluno().getListaDeficiencia());
		setDados();
	}
	
	@Post("/alunos/save")
	@Permissao(permissoes={com.util.enums.Permissao.ALUNO_CRIAR, com.util.enums.Permissao.ALUNO_EDITAR})
	public void save(Aluno aluno, List<String> deficiencias) throws ParseException {
		try {
			if (!validator(aluno)) {
				inbox.informeTodosOsCamposObrigatorios();
				result.include("aluno", aluno);
				result.include("deficiencias", deficiencias);
				setDados();
				result.redirectTo(this).create();
			} else {
				if (aluno.getDocumento() != null &&
						aluno.getDocumento().getUfIdentidade() != null &&
						aluno.getDocumento().getUfIdentidade().getId() == null) {
					aluno.getDocumento().setUfIdentidade(null);
				}
				if (aluno.getDocumento().getNumeroMatricula() != null) {
					aluno.getDocumento().setUfCartorio(null);
					aluno.getDocumento().setCidadeCartorio(null);
				} else {
					Cidade cidadeDocumento = cidadeRepository.find(aluno.getDocumento().getCidadeCartorio().getId());
					aluno.getDocumento().setCidadeCartorio(cidadeDocumento);
				}
				if (aluno.getTurmas() == null || aluno.getTurmas().isEmpty())
					aluno.setTurmas(null);
				
				if (!aluno.isDeficiencia()) {
					aluno.setTipoDeficiencia(null);
				} else {
					aluno.setListaDeficiencia(deficiencias);
				}
				
				Cidade cidade = cidadeRepository.find(aluno.getCidadeNascimento().getId());
				aluno.setCidadeNascimento(cidade);
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				String data = sdf.format(aluno.getDataNascimento());
				aluno.setDataNascimento(sdf.parse(data));
				aluno = repository.save(aluno);
				inbox.message("msg.save.success").success();
			}
		} catch (Exception e) {
			e.printStackTrace();
			inbox.operacaoNaoRealizada();
		}
		result.redirectTo(this).list(null);
	}
	
	@Path("/alunos/edit/{id}")
	@Permissao(permissoes=com.util.enums.Permissao.ALUNO_EDITAR)
	public void edit(Long id) {
		Aluno aluno = null;
		if (id != null) {
			aluno = repository.find(id);
			result.include("aluno", aluno);
		}
		result.include("listaDeficiencias", aluno.getListaDeficiencia());
		setDados();
	}

	@Path("/alunos/delete")
	@Permissao(permissoes=com.util.enums.Permissao.ALUNO_DELETAR)
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
		result.redirectTo(this).list(null);
	}
	
	private void setDados() {
		result.include("listaRacas", Raca.values());
		result.include("listaSexo", Sexo.values());
		result.include("listaNacionalidade", Nacionalidade.values());
		result.include("listaCertidoes", TipoCertidao.values());
		result.include("listaModelos", ModeloCertidao.values());
		result.include("listaCidades", cidadeRepository.list());
		result.include("listaEstados", estadoRepository.list());
		result.include("listaTurmas", turmaRepository.list());
	}
	
	private boolean validator (Aluno aluno) {
		return !ValidatorUtils.isEmpty(aluno.getNome()) &&
				!ValidatorUtils.isEmpty(aluno.getDataNascimento()) &&
				!ValidatorUtils.isEmpty(aluno.getFiliacaoMae()) &&
				!ValidatorUtils.isEmpty(aluno.getFiliacaoPai()) &&
				!ValidatorUtils.isEmpty(aluno.getRaca()) &&
				!ValidatorUtils.isEmpty(aluno.getSexo()) &&
				!ValidatorUtils.isEmpty(aluno.getNacionalidade()) &&
				!ValidatorUtils.isEmpty(aluno.getEstadoNascimento()) ||
				!ValidatorUtils.isEmpty(aluno.getEstadoNascimento().getId()) &&
				!ValidatorUtils.isEmpty(aluno.getCidadeNascimento()) ||
				!ValidatorUtils.isEmpty(aluno.getCidadeNascimento().getId()) &&
				!ValidatorUtils.isEmpty(aluno.getDocumento()) ||
				!ValidatorUtils.isEmpty(aluno.getDocumento().getId()) &&
				!ValidatorUtils.isEmpty(aluno.getDocumento().getModeloCertidao()) &&
				!ValidatorUtils.isEmpty(aluno.getDocumento().getTipoCertidao()) && 
				!ValidatorUtils.isEmpty(aluno.getEndereco()) ||
				!ValidatorUtils.isEmpty(aluno.getEndereco().getId()) &&
				!ValidatorUtils.isEmpty(aluno.getEndereco().getBairro()) &&
				!ValidatorUtils.isEmpty(aluno.getEndereco().getRua()) &&
				!ValidatorUtils.isEmpty(aluno.getEndereco().getUf()) ||
				!ValidatorUtils.isEmpty(aluno.getEndereco().getUf().getId()) &&
				!ValidatorUtils.isEmpty(aluno.getEndereco().getCidade()) ||
				!ValidatorUtils.isEmpty(aluno.getEndereco().getCidade().getId());
	}

}
