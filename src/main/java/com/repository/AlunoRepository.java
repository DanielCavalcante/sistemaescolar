package com.repository;

import java.util.List;

import com.model.Aluno;
import com.util.GenericRepository;

public interface AlunoRepository extends GenericRepository<Aluno> {
	
	List<Aluno> list();

}
