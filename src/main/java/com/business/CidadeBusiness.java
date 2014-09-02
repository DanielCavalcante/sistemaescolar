package com.business;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.model.Cidade;
import com.repository.CidadeRepository;
import com.util.GenericBusiness;

public class CidadeBusiness extends GenericBusiness<Cidade> implements
		CidadeRepository {

	public CidadeBusiness() {
		super();
	}

	@SuppressWarnings("unchecked")
	public List<Cidade> getPorEstado(Long idEstado) {
		Criteria c = createCriteria(Cidade.class);
		c.add(Restrictions.eq("idEstado", idEstado));
		c.addOrder(Order.asc("nome"));

		return c.list();
	}

}
