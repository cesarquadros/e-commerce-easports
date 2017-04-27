package br.com.ecommerceeasports.entities;

public class Produto {

	private Integer idProduto;
	private String codigo;
	private String nome;
	private Double preco;
	private String imagem;
	private Double precoCusto;
	private Double precoVenda;
	private Categoria categoria;

	public Produto() {
		// TODO Auto-generated constructor stub
	}

	public Produto(Integer idProduto, String codigo, String nome, Double preco, String imagem, Double precoCusto,
			Double precoVenda) {
		super();
		this.idProduto = idProduto;
		this.codigo = codigo;
		this.nome = nome;
		this.preco = preco;
		this.imagem = imagem;
		this.precoCusto = precoCusto;
		this.precoVenda = precoVenda;
	}

	public Produto(Integer idProduto, String codigo, String nome, Double preco, String imagem, Double precoCusto,
			Double precoVenda, Categoria categoria) {
		super();
		this.idProduto = idProduto;
		this.codigo = codigo;
		this.nome = nome;
		this.preco = preco;
		this.imagem = imagem;
		this.precoCusto = precoCusto;
		this.precoVenda = precoVenda;
		this.categoria = categoria;
	}

	public Integer getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Double getPrecoCusto() {
		return precoCusto;
	}

	public void setPrecoCusto(Double precoCusto) {
		this.precoCusto = precoCusto;
	}

	public Double getPrecoVenda() {
		return precoVenda;
	}

	public void setPrecoVenda(Double precoVenda) {
		this.precoVenda = precoVenda;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	@Override
	public boolean equals(Object obj) {
		
		if(obj instanceof Produto){
			
			Produto produto = (Produto) obj;
			
			if(this.codigo.equals(produto.codigo)){
				
				return true;
				
			}
			
		}
		
		return false;
	
	}

}
