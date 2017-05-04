package br.com.ecommerceeasports.entities;

public class Produto {

	private Integer idProduto;
	private String codigo;
	private String nome;
	private String imagem;
	private Double precoCusto;
	private Double precoVenda;
	private Categoria categoria;
	private String valorCustoFormatado;
	private String valorVendaFormatado;
	private String origem;
	private String dimensoes;
	private String peso;
	private String garantia;
	private String descricao;
	

	public Produto() {
		// TODO Auto-generated constructor stub
	}


	public Produto(Integer idProduto, String codigo, String nome, String imagem, Double precoCusto, Double precoVenda,
			Categoria categoria, String origem, String dimensoes, String peso, String garantia, String descricao) {
		super();
		this.idProduto = idProduto;
		this.codigo = codigo;
		this.nome = nome;
		this.imagem = imagem;
		this.precoCusto = precoCusto;
		this.precoVenda = precoVenda;
		this.categoria = categoria;
		this.origem = origem;
		this.dimensoes = dimensoes;
		this.peso = peso;
		this.garantia = garantia;
		this.descricao= descricao;
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
	
	public String getValorCustoFormatado() {
		return valorCustoFormatado;
	}

	public void setValorCustoFormatado(String valorCustoFormatado) {
		this.valorCustoFormatado = valorCustoFormatado;
	}

	public String getValorVendaFormatado() {
		return valorVendaFormatado;
	}

	public void setValorVendaFormatado(String valorVendaFormatado) {
		this.valorVendaFormatado = valorVendaFormatado;
	}
	
	
	public String getOrigem() {
		return origem;
	}

	public void setOrigem(String origem) {
		this.origem = origem;
	}

	public String getDimensoes() {
		return dimensoes;
	}

	public void setDimensoes(String dimensoes) {
		this.dimensoes = dimensoes;
	}

	public String getPeso() {
		return peso;
	}

	public void setPeso(String peso) {
		this.peso = peso;
	}

	public String getGarantia() {
		return garantia;
	}

	public void setGarantia(String garantia) {
		this.garantia = garantia;
	}
	
	

	public String getDescricao() {
		return descricao;
	}


	public void setDescricao(String descricao) {
		this.descricao = descricao;
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
