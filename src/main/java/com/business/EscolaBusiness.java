package com.business;

import java.util.List;

import javax.persistence.Query;

import com.model.Escola;
import com.repository.EscolaRepository;
import com.util.GenericBusiness;

public class EscolaBusiness extends GenericBusiness<Escola> implements EscolaRepository{
	
	public EscolaBusiness() {
		super();
	}
	
	@SuppressWarnings("unchecked")
	public Escola get() {
		Query query = manager.createQuery("from " + clazz.getName());
		
		List<Escola> list = query.getResultList();
		if (!list.isEmpty()) {
			return list.get(0);
		}
		return save(new Escola());
	}

}
