package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import com.google.gson.Gson;
import com.repository.CidadeRepository;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Controller
public class UtilsController {
	
	@Inject private CidadeRepository cidadeRepository;
	@Inject private Result result;

	@Path("/recuperaCidades")
	public void getCidades(Long uf) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			map.put("sucesso", "true");
			map.put("dados", new Gson().toJson(cidadeRepository.getPorEstado(uf)));
		} catch (Exception e) {
			map.put("sucesso", "false");
			map.put("erro", e.getMessage());
		}
		result.use(Results.json()).from(map, "map").serialize();
	}
	
}
