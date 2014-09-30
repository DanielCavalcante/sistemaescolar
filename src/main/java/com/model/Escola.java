package com.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "escola")
@Getter @Setter
public class Escola extends AbstractEntity {

	@Column(nullable = false)
	private String nome;
	@Column(name = "codigo_escola")
	private Long codigoEscola;
	@Column(nullable = false)
	private String cnpj;
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "id_endereco")
	private Endereco endereco;
	//localizao geografica
	private String telefone;
	private String fax;
	private String email;
	@Column(name = "cod_orgao_regional")
	private Long codigoOrgaoRegional;
	@Column(name = "nome_orgao_regional")
	private String nomeOrgaoRegional;
	private String localizacao;
	@Column(name = "dependencia_administrativa")
	private String dependenciaAdministrativa;
}
