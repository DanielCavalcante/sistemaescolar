package com.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "usuario")
@Getter @Setter
public class Usuario extends AbstractEntity {

	private String nome;
	private String login;
	private String senha;
	@ManyToOne
	@JoinColumn(name = "perfil_id")
	private Perfil perfil;
	
	@Column(nullable = false)
	private boolean root;
	
	@Transient
	private String confirmSenha;

}
