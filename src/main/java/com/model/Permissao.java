package com.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Permissao {

	private String nome;
	private boolean checked;

	public Permissao(String nome, boolean checked) {
		this.nome = nome;
		this.checked = checked;
	}

}
