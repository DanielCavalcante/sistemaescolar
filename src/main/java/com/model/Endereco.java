package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "endereco")
@Getter @Setter
public class Endereco extends AbstractEntity {

	private Long cep;
	@Column(name = "endereco", nullable = false)
	private String rua;
	private String complemento;
	@Column(nullable = false)
	private String bairro;
	@OneToOne
	@JoinColumn(name="id_uf", nullable = false)
	private Estado uf;
	@OneToOne
	@JoinColumn(name="id_cidade", nullable = false)
	private Cidade cidade;
	
}
