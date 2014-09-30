package com.repository;

import com.model.Escola;
import com.util.GenericRepository;

public interface EscolaRepository extends GenericRepository<Escola> {
	
	Escola get();

}
