package com.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

import com.util.AbstractEntity;

@Entity
@Table(name = "documento")
@Getter @Setter
public class Documento extends AbstractEntity {

	@Column(length = 11)
	private Long cpf;
	@Column(name = "justificativa")
	private String justificativa;
	@Column(name = "num_identidade")
	private Long numIdentidade;
	@Column(name = "comp_identidade")
	private String compIdentidade;
	@Column(name = "orgao_emissor")
	private String orgaoEmissor;
	@OneToOne
	@JoinColumn(name = "uf_identidade")
	private Estado ufIdentidade;
	@Column(name = "data_expedicao_identidade")
	private Date dataExpedicaoIdentidade;
	@Column(name = "tipo_certidao", nullable = false)
	private String tipoCertidao;
	@Column(name = "modelo_certidao", nullable = false)
	private String modeloCertidao;
	@Column(name = "numero_matricula")
	private Long numeroMatricula;
	@Column(name = "numero_termo")
	private Long numeroDoTermo;
	@Column(name = "data_emissao_certidao")
	private Date dataEmissaoCertidao;
	@Column(name = "folha_termo")
	private Long folhaDoTermo;
	@Column(name = "livro")
	private String livro;
	@OneToOne
	@JoinColumn(name = "uf_cartorio")
	private Estado ufCartorio;
	@OneToOne
	@JoinColumn(name = "cidade_cartorio")
	private Cidade cidadeCartorio;
	@Column(name = "nome_cartorio")
	private String nomeCartorio;

}
