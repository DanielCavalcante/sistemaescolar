package com.repository;

import java.util.List;

import com.model.Cidade;
import com.util.GenericRepository;

public interface CidadeRepository extends GenericRepository<Cidade> {
	
	public abstract List<Cidade> getPorEstado(Long idEstado);
	

}
