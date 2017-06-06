package br.com.ecommerceeasports.entities;

import java.util.ArrayList;
import java.util.Date;

import br.com.ecommerceeasports.util.FormataValor;

public class Compra {

	private Integer idCompra;
	private Date dataCompra;
	private String dataCompraFormata;
	private Integer parcelas;
	private Cartao cartao;
	private String tipoPagamento;
	private String numProtocolo;
	private Double valorTotal;
	private String valorTotalFormatado;
	private ArrayList<ItemCarrinho> listaItens;
	
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
	public String getNumProtocolo() {
		return numProtocolo;
	}
	public void setNumProtocolo(String numProtocolo) {
		this.numProtocolo = numProtocolo;
	}
	public ArrayList<ItemCarrinho> getListaItens() {
		return listaItens;
	}
	public void setListaItens(ArrayList<ItemCarrinho> listaItens) {
		this.listaItens = listaItens;
	}
	
	public Double getValorTotal() {
		return valorTotal();
	}
	public void setValorTotal(Double valorTotal) {
		this.valorTotal = valorTotal;
	}
	public Double valorTotal() {
		
		this.valorTotal = 0.0;
		
		for (int i = 0; i < listaItens.size(); i++) {
			this.valorTotal+= listaItens.get(i).getProduto().getPrecoVenda();
		}		
		return this.valorTotal;
	}
	public String getValorTotalFormatado() {
		FormataValor f = new FormataValor();
		valorTotalFormatado = f.valorFormatado(this.getValorTotal());
		return valorTotalFormatado;
	}
	public void setValorTotalFormatado(String valorTotalFormatado) {
		this.valorTotalFormatado = valorTotalFormatado;
	}	
}
