package com.model;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Getter @Setter
public class Deficiencia extends AbstractEntity {

	private String nome;
	private boolean checked;

	public Deficiencia(String nome, boolean checked) {
		this.nome = nome;
		this.checked = checked;
	}

}
