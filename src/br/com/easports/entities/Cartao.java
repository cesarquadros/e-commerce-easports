package br.com.easports.entities;

import java.util.Date;

public class Cartao {

	private Integer idCartao;
	private Integer numero;
	private String nomeImpresso;
	private Date validade;
	private Integer codigoSeguranca;
	
	public Cartao() {
		// TODO Auto-generated constructor stub
	}

	public Cartao(Integer idCartao, Integer numero, String nomeImpresso, Date validade, Integer codigoSeguranca) {
		super();
		this.idCartao = idCartao;
		this.numero = numero;
		this.nomeImpresso = nomeImpresso;
		this.validade = validade;
		this.codigoSeguranca = codigoSeguranca;
	}

	public Integer getIdCartao() {
		return idCartao;
	}

	public void setIdCartao(Integer idCartao) {
		this.idCartao = idCartao;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getNomeImpresso() {
		return nomeImpresso;
	}

	public void setNomeImpresso(String nomeImpresso) {
		this.nomeImpresso = nomeImpresso;
	}

	public Date getValidade() {
		return validade;
	}

	public void setValidade(Date validade) {
		this.validade = validade;
	}

	public Integer getCodigoSeguranca() {
		return codigoSeguranca;
	}

	public void setCodigoSeguranca(Integer codigoSeguranca) {
		this.codigoSeguranca = codigoSeguranca;
	}
	
}
