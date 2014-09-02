package com.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "turma")
@Getter @Setter
public class Turma extends AbstractEntity {

	@Column(name = "cod_escola")
	private Long codigoEscola;
	@Column(nullable = false)
	private String nome;
	@Column(name = "hora_inicio")
	private String horaInicio;
	@Column(name = "hora_final")
	private String horaFinal;
	@Column(name = "etapa")
	private String etapa;
	@Column(nullable = false)
	private String modalidade;
	@Column(name = "atividade_complementar")
	private String atividadeComplementar;
	@ManyToMany(mappedBy = "turmas", cascade = CascadeType.ALL)
	private List<Aluno> alunos;
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "turma_professor", joinColumns = @JoinColumn(name = "id_turma"), 
	inverseJoinColumns = @JoinColumn(name = "id_professor"))
	private List<Professor> professores;

}
