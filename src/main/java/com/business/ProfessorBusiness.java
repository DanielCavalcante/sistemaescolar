package com.business;

import com.model.Professor;
import com.repository.ProfessorRepository;
import com.util.GenericBusiness;

public class ProfessorBusiness extends GenericBusiness<Professor> implements
		ProfessorRepository {

	public ProfessorBusiness() {
		super();
	}

}
