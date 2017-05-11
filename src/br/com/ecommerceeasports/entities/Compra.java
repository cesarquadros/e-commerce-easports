package br.com.ecommerceeasports.entities;

import java.util.Date;

public class Compra {

	private Integer idCompra;
	private Date dataCompra;
	private Integer parcelas;
	private Integer idCartao;
	private Integer idEnreco;
	
	public Integer getIdCompra() {
		return idCompra;
	}
	public void setIdCompra(Integer idCompra) {
		this.idCompra = idCompra;
	}
	public Date getDataCompra() {
		return dataCompra;
	}
	public void setDataCompra(Date dataCompra) {
		this.dataCompra = dataCompra;
	}
	public Integer getParcelas() {
		return parcelas;
	}
	public void setParcelas(Integer parcelas) {
		this.parcelas = parcelas;
	}
	public Integer getIdCartao() {
		return idCartao;
	}
	public void setIdCartao(Integer idCartao) {
		this.idCartao = idCartao;
	}
	public Integer getIdEnreco() {
		return idEnreco;
	}
	public void setIdEnreco(Integer idEnreco) {
		this.idEnreco = idEnreco;
	}
	
	
}
