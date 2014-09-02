package com.interceptor;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import br.com.caelum.vraptor.AfterCall;
import br.com.caelum.vraptor.BeforeCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.controller.ControllerMethod;

import com.controller.IndexController;
import com.controller.LoginController;
import com.model.UsuarioSessao;
import com.util.Inbox;

@Intercepts @RequestScoped
public class PermissaoInterceptor {

	@Inject private UsuarioSessao usuarioSessao;
	@Inject private Result result;
	@Inject private ControllerMethod method;
	@Inject private HttpServletRequest request;
	@Inject private Inbox inbox;
	
	@BeforeCall
	public void before() {
		if (!LoginController.class.equals(method.getMethod().getDeclaringClass())) {
			if (!usuarioSessao.sessaoValida()) {
				result.redirectTo(LoginController.class).login();
			} else if (request.getSession(false) == null || request.getSession().isNew()) {
				inbox.message("msg.permission.denied");
				result.redirectTo(LoginController.class).login();
			} else if (!usuarioSessao.temPermissao(method)) {
				inbox.message("msg.permission.denied").danger();
				result.redirectTo(IndexController.class).index();
			}
		}
	}
	
	@AfterCall
	public void after() {}

}
