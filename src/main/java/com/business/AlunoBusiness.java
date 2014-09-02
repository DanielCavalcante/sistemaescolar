package com.business;

import com.model.Aluno;
import com.repository.AlunoRepository;
import com.util.GenericBusiness;

public class AlunoBusiness extends GenericBusiness<Aluno> implements
		AlunoRepository {

	public AlunoBusiness() {
		super();
	}

}
