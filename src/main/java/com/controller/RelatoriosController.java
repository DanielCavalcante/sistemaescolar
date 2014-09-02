package com.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;

@Controller
@Path("/relatorios")
public class RelatoriosController {
	
	@Get("")
	public void list() {
		
	}
	
	@Get("/form")
	public void create() {
		
	}
}
