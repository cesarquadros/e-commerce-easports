package br.com.easports.entities;

public class Carrinho {

	private Integer idCarrinho;
	private Integer quantidade;
	private Cliente cliente;
	private Produto produto;
	private Compra compra;
	private Boolean finalizado;

	public Carrinho() {
		// TODO Auto-generated constructor stub
	}

	public Carrinho(Integer idCarrinho, Integer quantidade, Boolean finalizado) {
		super();
		this.idCarrinho = idCarrinho;
		this.quantidade = quantidade;
		this.finalizado = finalizado;
	}

	public Carrinho(Integer idCarrinho, Integer quantidade, Cliente cliente, Produto produto, Compra compra,
			Boolean finalizado) {
		super();
		this.idCarrinho = idCarrinho;
		this.quantidade = quantidade;
		this.cliente = cliente;
		this.produto = produto;
		this.compra = compra;
		this.finalizado = finalizado;
	}

	public Integer getIdCarrinho() {
		return idCarrinho;
	}

	public void setIdCarrinho(Integer idCarrinho) {
		this.idCarrinho = idCarrinho;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
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

	public Boolean getFinalizado() {
		return finalizado;
	}

	public void setFinalizado(Boolean finalizado) {
		this.finalizado = finalizado;
	}
	
}
