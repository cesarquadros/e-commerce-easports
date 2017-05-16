package br.com.ecommerceeasports.entities;

import java.util.Date;

public class Cartao {

	private Integer idCartao;
	private String numero;
	private String numeroX;
	private String nomeImpresso;
	private Date validade;
	private Integer codigoSeguranca;
	
	public Cartao() {
	}

	public Cartao(Integer idCartao, String numero, String nomeImpresso, Date validade, Integer codigoSeguranca) {
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

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
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

	public String getNumeroX() {
		numeroX = this.numero.substring(8);
		numeroX = "XXXXXXXX" + numeroX;
		
		return numeroX;
	}

	public void setNumeroX(String numeroX) {
		this.numeroX = numeroX;
	}
	
	
	
}
