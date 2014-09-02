package com.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "aluno")
@Getter @Setter
public class Aluno extends AbstractEntity {

	@Column(nullable = false)
	private String nome;
	
	@Column(name = "data_nasc", nullable = false)
	private Date dataNascimento;
	
	@Column(name = "filiacao_mae", nullable = false)
	private String filiacaoMae;
	
	@Column(name = "filiacao_pai", nullable = false)
	private String filiacaoPai;
	
	@Column(name = "raca", nullable = false)
	private String raca;
	
	@Column(nullable = false)
	private String sexo;
	
	private boolean deficiencia;
	
	@Column(name = "tipo_deficiencia")
	private String tipoDeficiencia;
	
	private String nacionalidade;
	
	@OneToOne
	@JoinColumn(name = "id_estado_nascimento")
	private Estado estadoNascimento;
	
	@OneToOne
	@JoinColumn(name = "id_cidade_nascimento")
	private Cidade cidadeNascimento;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_documento")
	private Documento documento;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "id_endereco")
	private Endereco endereco;
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name = "aluno_turma", joinColumns = @JoinColumn(name = "id_aluno"), 
	inverseJoinColumns = @JoinColumn(name = "id_turma"))
	private List<Turma> turmas;
	
	public void setListaDeficiencia(List<String> tipoDeficiencia) {
		String s = "";
		for (String t : tipoDeficiencia) {
			s += "," + t;
		}
		this.tipoDeficiencia = s.substring(1);
	}
	
	public List<Deficiencia> getListaDeficiencia() {
		List<Deficiencia> lista = new ArrayList<Deficiencia>();
		List<String> listaDeficiencias = new ArrayList<String>();
		if (this.tipoDeficiencia != null) {
			if (this.tipoDeficiencia.contains(",")) {
				listaDeficiencias = Arrays.asList(this.tipoDeficiencia.split(","));
			} else {
				listaDeficiencias.add(this.tipoDeficiencia);
			}
		}
		for (com.util.enums.Deficiencia d : com.util.enums.Deficiencia.values()) {
			lista.add(new com.model.Deficiencia(d.name(), listaDeficiencias.contains(d.name())));
		}
		return lista;
	}

}