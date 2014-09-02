package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "cidade")
@Getter @Setter
public class Cidade extends AbstractEntity {

	@Column(name = "id_estado")
	private Long idEstado;

	@Column(nullable = false)
	private String nome;

	@Column(name = "cep")
	private String cep;

}
