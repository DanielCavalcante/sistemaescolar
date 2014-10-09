package com.filters;

import lombok.Getter;
import lombok.Setter;

import com.model.Aluno;

@Getter @Setter
public class AlunoFiltro extends Filter {

	private String nome;
	private Long turma;
	private String sexo;
	private boolean deficiencia;
	
	@SuppressWarnings("rawtypes")
	@Override
	public Class getTableClass() {
		return Aluno.class;
	}

}
