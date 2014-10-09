package com.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;

import com.filters.AlunoFiltro;
import com.model.Aluno;
import com.repository.RelatorioRepository;
import com.repository.TurmaRepository;
import com.util.ControllerUtil;
import com.util.enums.Sexo;

@Controller
@Path("/relatorios")
public class RelatoriosController extends ControllerUtil {
	
	@Inject private RelatorioRepository repository;
	@Inject private TurmaRepository turmaRepository;
	
	@Get("")
	public void list() {
		
	}
	
	@Get("/alunos")
	public void alunos() {
		result.include("listTurmas", turmaRepository.list());
		result.include("listaSexos", Sexo.values());
	}
	
	@Get("/turmas")
	public void turmas() {
		
	}
	
	@Get("/professores")
	public void professores() {
		
	}
	
	@SuppressWarnings("unchecked")
	@Path("/alunoRelatorio")
	public List<Aluno> relatorioAlunos(AlunoFiltro filtro) {
		List<Aluno> lista = repository.list(filtro);
		result.include("alunoList", lista);
		result.include("turma", turmaRepository.find(filtro.getTurma()));
		result.include("qtdeAlunos", lista.size());
		return lista;
	}

}
