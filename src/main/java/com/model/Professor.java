package com.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "professor")
@Getter @Setter
public class Professor extends AbstractEntity {

	private String nome;
	@Column(name = "data_nascimento")
	private Date dataNascimento;
	private String sexo;
	private String nacionalidade;
	@OneToOne
	@JoinColumn(name = "id_estado_nascimento")
	private Estado estadoNascimento;
	@OneToOne
	@JoinColumn(name = "id_cidade_nascimento")
	private Cidade cidadeNascimento;
	@OneToOne
	@JoinColumn(name = "id_documento")
	private Documento documento;
	@OneToOne
	@JoinColumn(name = "id_endereco")
	private Endereco endereco;
	@ManyToMany(mappedBy = "professores", cascade = CascadeType.ALL)
	private List<Turma> turmas;

}
