package com.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;

import com.model.Escola;
import com.repository.CidadeRepository;
import com.repository.EscolaRepository;
import com.repository.EstadoRepository;
import com.util.ControllerUtil;

@Controller
@Path("/escola")
public class EscolasController extends ControllerUtil {
	
	@Inject private EscolaRepository repository;
	@Inject private EstadoRepository estadoRepository;
	@Inject private CidadeRepository cidadeRepository;
	
	@Path("")
	public void form() {
		Escola escola = null;
		try {
			escola = repository.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.include("escola", escola);
		setDados();
	}
	
	@Post("/save")
	public void save(Escola escola) {
		escola = repository.save(escola);
		inbox.message("msg.save.success").success();
		result.redirectTo(this).form();
	}
	
	public void setDados() {
		result.include("estadoList", estadoRepository.list());
		result.include("cidadeList", cidadeRepository.list());
	}

}
