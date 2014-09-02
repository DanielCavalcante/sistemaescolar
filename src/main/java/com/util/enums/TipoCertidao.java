package com.util.enums;

public enum TipoCertidao {

	CertidaoCasamento("Certidão de casamento"), CertidaoNascimento("Certidão de nascimento");

	private String label;

	private TipoCertidao(String label) {
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

}
