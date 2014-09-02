package com.util;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import com.model.UsuarioSessao;

import br.com.caelum.vraptor.Result;

public class ControllerUtil {
	
	@Inject protected Result result;
	@Inject protected Inbox inbox;
	@Inject protected HttpServletRequest request;
	@Inject protected UsuarioSessao usuarioSessao;
	
}
