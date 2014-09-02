package com.util.enums;

public enum ModeloCertidao {

	ModeloNovo("Modelo novo"), ModeloAntigo("Modelo antigo");

	private String label;

	private ModeloCertidao(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

}
