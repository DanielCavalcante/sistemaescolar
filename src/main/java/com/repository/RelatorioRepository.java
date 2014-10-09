package com.repository;

import java.util.List;

import com.filters.AlunoFiltro;
import com.filters.Filter;
import com.model.Relatorio;
import com.util.GenericRepository;

public interface RelatorioRepository extends GenericRepository<Relatorio> {

	@SuppressWarnings("rawtypes")
	List list(AlunoFiltro filtro); 

}
