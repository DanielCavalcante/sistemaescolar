package com.util.enums;

public enum Raca {

	Branca("Branca"), Parda("Parda"), Preta("Preta"), Indígena("Indígena"), 
	Amarela("Amarela"), NaoDeclarado("Não Declarado");

	private String label;

	private Raca(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

}
