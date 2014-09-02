package com.filters;

import lombok.Getter;
import lombok.Setter;

import com.model.Professor;

@Getter @Setter
public class ProfessorFiltro extends Filter {

	private String nome;

	@SuppressWarnings("rawtypes")
	@Override
	public Class getTableClass() {
		return Professor.class;
	}
	
}
