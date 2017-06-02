package br.com.ecommerceeasports.entities;

public class CountCarrinho {
	
	Produto produto;
	private Integer quantidade;
	private Double valorUnitario;
	private String valorFormatado;
	
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public Integer getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	public Double getValorUnitario() {
		return valorUnitario;
	}
	public void setValorUnitario(Double valorUnitario) {
		this.valorUnitario = valorUnitario;
	}
	public String getValorFormatado() {
		return valorFormatado;
	}
	public void setValorFormatado(String valorFormatado) {
		this.valorFormatado = valorFormatado;
	}
	
	
	
}
