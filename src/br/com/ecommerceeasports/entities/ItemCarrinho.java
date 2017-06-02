package br.com.ecommerceeasports.entities;

import java.util.ArrayList;

public class ItemCarrinho {
	
	private Integer idItem;
	private Cliente cliente;
	private Produto produto;
	private Integer idCompra;
	private Integer finalizado;
	private Double valorTotal;
		
	public Integer getIdItem() {
		return idItem;
	}
	public void setIdItem(Integer idItem) {
		this.idItem = idItem;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
		
	public Integer getIdCompra() {
		return idCompra;
	}
	public void setIdCompra(Integer idCompra) {
		this.idCompra = idCompra;
	}
	public Double getValorTotal() {
		return valorTotal;
	}
	public Integer getFinalizado() {
		return finalizado;
	}
	public void setFinalizado(Integer finalizado) {
		this.finalizado = finalizado;
	}
	
	public Double getValorTotal(ArrayList<ItemCarrinho> listCarrinho) {
		
		this.valorTotal = 0.0;
		
		for (int i = 0; i < listCarrinho.size(); i++) {
			this.valorTotal+= listCarrinho.get(i).getProduto().getPrecoVenda();
		}		
		return this.valorTotal;
	}

}
