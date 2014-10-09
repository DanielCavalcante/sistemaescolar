package com.business;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.filters.AlunoFiltro;
import com.model.Relatorio;
import com.repository.RelatorioRepository;
import com.util.GenericBusiness;

public class RelatorioBusiness extends GenericBusiness<Relatorio> implements
		RelatorioRepository {

	public RelatorioBusiness() {
		super();
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List list(AlunoFiltro filtro) {
		Criteria c = createCriteria(filtro.getTableClass());
		
		if (filtro.getTurma() != null) {
			c.createCriteria("turmas").add(Restrictions.eq("id", filtro.getTurma()));
		}
		
//		if(filtro.getNome() != null && !filtro.getNome().isEmpty()){
//			c.add(Restrictions.ilike("nome", value))
//			sql.append("nome = joao");
//		}
		
//		c.createCriteria("turmas").add(Restrictions.eq("id", filtro.getId()))
		
//		List<MeuRelatorio> list = manager.createNativeQuery(sql.toString(), MeuRelatorio.class).getResultList();
		
		return c.list();
	}
	
	

}
