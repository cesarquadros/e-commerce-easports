package br.com.ecommerceeasports.entities;

public class CountCarrinho {
	
	private Integer idProduto;
	private String nome;
	private Integer quantidade;
	private Double valorUnitario;
	private String valorFormatado;
	
	
	
	
	public Integer getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
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
