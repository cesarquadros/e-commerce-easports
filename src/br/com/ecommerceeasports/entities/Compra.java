package br.com.ecommerceeasports.entities;

import java.util.Date;

public class Compra {

	private Integer idCompra;
	private Date dataCompra;
	private String dataCompraFormata;
	private Integer parcelas;
	private Cartao cartao;
	private String tipoPagamento;
	
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
	
	public Cartao getCartao() {
		return cartao;
	}
	public void setCartao(Cartao cartao) {
		this.cartao = cartao;
	}
	public String getTipoPagamento() {
		return tipoPagamento;
	}
	public void setTipoPagamento(String tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
	}
	public String getDataCompraFormata() {
		return dataCompraFormata;
	}
	public void setDataCompraFormata(String dataCompraFormata) {
		this.dataCompraFormata = dataCompraFormata;
	}
	
	
}
