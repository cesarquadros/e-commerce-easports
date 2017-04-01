package br.com.easports.entities;

public class Produto {

	private Integer idProduto;
	private Integer codigo;
	private String nome;
	private Double preco;
	private String foto;
	private Double precoCusto;
	private Double precoVenda;
	private Categoria categoria;

	public Produto() {
		// TODO Auto-generated constructor stub
	}

	public Produto(Integer idProduto, Integer codigo, String nome, Double preco, String foto, Double precoCusto,
			Double precoVenda) {
		super();
		this.idProduto = idProduto;
		this.codigo = codigo;
		this.nome = nome;
		this.preco = preco;
		this.foto = foto;
		this.precoCusto = precoCusto;
		this.precoVenda = precoVenda;
	}

	public Produto(Integer idProduto, Integer codigo, String nome, Double preco, String foto, Double precoCusto,
			Double precoVenda, Categoria categoria) {
		super();
		this.idProduto = idProduto;
		this.codigo = codigo;
		this.nome = nome;
		this.preco = preco;
		this.foto = foto;
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

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
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

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
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
