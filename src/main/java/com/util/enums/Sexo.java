package com.util.enums;

public enum Sexo {

	Masculino("Masculino"), Feminino("Feminino");

	private String label;

	private Sexo(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

}
