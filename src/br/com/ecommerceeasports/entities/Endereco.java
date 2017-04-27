package br.com.ecommerceeasports.entities;

public class Endereco {
	
	private Integer idEndereco;
	private String logradouro;
	private String cep;
	private Integer numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String estado;

	public Endereco() {
		// TODO Auto-generated constructor stub
	}

	public Endereco(Integer idEndereco, String logradouro, String cep, Integer numero,
			String bairro, String cidade, String estado) {
		super();
		this.idEndereco = idEndereco;
		this.logradouro = logradouro;
		this.cep = cep;
		this.numero = numero;
		this.bairro = bairro;
		this.cidade = cidade;
		this.estado = estado;
	}

	public Integer getIdEndereco() {
		return idEndereco;
	}

	public void setIdEndereco(Integer idEndereco) {
		this.idEndereco = idEndereco;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
}