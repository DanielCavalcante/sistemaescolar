package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "estado")
@Getter @Setter
public class Estado extends AbstractEntity {

	@Column(length = 2, nullable = false)
	private String sigla;

	@Column(nullable = false)
	private String nome;

}
