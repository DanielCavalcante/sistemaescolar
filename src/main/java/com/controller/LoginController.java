package com.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;

import com.model.Usuario;
import com.repository.LoginRepository;
import com.util.ControllerUtil;

@Controller
public class LoginController extends ControllerUtil {

	@Inject private LoginRepository repository;

	@Get("/login")
	public void login() {

	}

	@Post("/autenticar")
	public void autenticar(Usuario usuario) {
		try {
			Usuario user = repository.autenticar(usuario.getLogin(),
			usuario.getSenha());
			
			if (user != null) {
				usuarioSessao.setUsuario(user);
				request.getSession().setAttribute("usuarioSessao", usuarioSessao);
				result.redirectTo(IndexController.class).index();
			} else {
				inbox.message("msg.usuario.login.invalido").danger();;
				result.redirectTo(this).login();
			}
		} catch (Exception e) {
			e.printStackTrace();
			inbox.message("msg.operacao.nao.realizada").danger();
			result.redirectTo(this).login();
		}
	}

	@Get("/logout")
	public void logout() {
		usuarioSessao.invalidaSessao();
		request.getSession().setAttribute("usuarioSessao", null);
		request.getSession().invalidate();
		result.redirectTo(this).login();
	}

}
