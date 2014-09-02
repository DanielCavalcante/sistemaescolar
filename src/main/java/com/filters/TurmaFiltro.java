package com.filters;

import lombok.Getter;
import lombok.Setter;

import com.model.Turma;

@Getter @Setter
public class TurmaFiltro extends Filter {

	private String nome;

	@SuppressWarnings("rawtypes")
	@Override
	public Class getTableClass() {
		return Turma.class;
	}

}
