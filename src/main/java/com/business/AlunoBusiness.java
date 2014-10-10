package com.business;

import java.util.List;

import javax.persistence.Query;

import com.model.Aluno;
import com.repository.AlunoRepository;
import com.util.GenericBusiness;

public class AlunoBusiness extends GenericBusiness<Aluno> implements
		AlunoRepository {

	public AlunoBusiness() {
		super();
	}

	@SuppressWarnings("unchecked")
	public List<Aluno> list() {
		Query query = manager.createQuery("from " + clazz.getName());
		query.setMaxResults(100);
		List<Aluno> list = query.getResultList();
		return list;
	}
	
}
