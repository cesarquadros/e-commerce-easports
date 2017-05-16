package br.com.ecommerceeasports.entities;

import java.util.ArrayList;
import java.util.Date;

public class Cliente {

	private Integer idCliente;
	private String email;
	private String senha;
	private String nome;
	private String sexo;
	private String cpf;
	private Date dataNascimento;
	private String telefone;
	private Endereco endereco;
	private ArrayList<ItemCarrinho> listaItens;
	private Cartao cartao;
	private String dataNascFormatada;
	
	public Cliente(Integer idCliente, String email, String senha, String nome, String sexo, String cpf,
			Date dataNascimento, String telefone) {
		super();
		this.idCliente = idCliente;
		this.email = email;
		this.senha = senha;
		this.nome = nome;
		this.sexo = sexo;
		this.cpf = cpf;
		this.dataNascimento = dataNascimento;
		this.telefone = telefone;
	}

	public Cliente(Integer idCliente, String email, String senha, String nome, String sexo, String cpf,
			Date dataNascimento, String telefone, Endereco endereco, ArrayList<ItemCarrinho> ListaItens, Cartao cartao) {
		super();
		this.idCliente = idCliente;
		this.email = email;
		this.senha = senha;
		this.nome = nome;
		this.sexo = sexo;
		this.cpf = cpf;
		this.dataNascimento = dataNascimento;
		this.telefone = telefone;
		this.endereco = endereco;
		this.listaItens = ListaItens;
		this.cartao = cartao;
	}
	
	public String getDataNascFormatada() {
		return dataNascFormatada;
	}

	public void setDataNascFormatada(String dataNascFormatada) {
		this.dataNascFormatada = dataNascFormatada;
	}

	public Cliente() {
		// TODO Auto-generated constructor stub
	}

	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	
	public ArrayList<ItemCarrinho> getListaItens() {
		return listaItens;
	}

	public void setListaItens(ArrayList<ItemCarrinho> listaItens) {
		this.listaItens = listaItens;
	}

	public Cartao getCartao() {
		return cartao;
	}

	public void setCartao(Cartao cartao) {
		this.cartao = cartao;
	}

	@Override
	public boolean equals(Object obj) {
		
		if(obj instanceof Cliente){
			
			Cliente cliente = (Cliente) obj;
			
			if(this.cpf.equals(cliente.cpf)){
				
				return true;
				
			}
			
		}
		
		return false;
	
	}
	
}
