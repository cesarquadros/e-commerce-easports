package br.com.ecommerceeasports.entities;

public class ItemCarrinho {
	
	private Integer idItem;
	private Cliente cliente;
	private Produto produto;
	private Compra compra;
	private boolean finalizado;
	
	
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
	public Compra getCompra() {
		return compra;
	}
	public void setCompra(Compra compra) {
		this.compra = compra;
	}
	public boolean isFinalizado() {
		return finalizado;
	}
	public void setFinalizado(boolean finalizado) {
		this.finalizado = finalizado;
	}

	
	

}
