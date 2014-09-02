package com.util.enums;

public enum Nacionalidade {

	Brasileiro("Brasileiro"), 
	BrasileiroDoExterior("Brasileiro - nascido no exterior ou naturalizado"),
	Estrangeiro("Estrangeiro");

	private String label;

	private Nacionalidade(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

}
