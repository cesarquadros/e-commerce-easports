package br.com.ecommerceeasports.entities;

import java.util.Date;

public class Compra {
	
	private Integer idCompra;
	private Cliente cliente;
	private Date dataCompra;
	private Integer parcelas;
	private Cartao cartao;
	
	public Compra() {
		// TODO Auto-generated constructor stub
	}

	public Compra(Integer idCompra, Cliente cliente, Date dataCompra, Integer parcelas) {
		super();
		this.idCompra = idCompra;
		this.cliente = cliente;
		this.dataCompra = dataCompra;
		this.parcelas = parcelas;
	}
	
	public Compra(Integer idCompra, Cliente cliente, Date dataCompra, Integer parcelas, Cartao cartao) {
		super();
		this.idCompra = idCompra;
		this.cliente = cliente;
		this.dataCompra = dataCompra;
		this.parcelas = parcelas;
		this.cartao = cartao;
	}

	public Integer getIdCompra() {
		return idCompra;
	}

	public void setIdCompra(Integer idCompra) {
		this.idCompra = idCompra;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Date getDataCompra() {
		return dataCompra;
	}

	public void setDataCompra(Date dataCompra) {
		this.dataCompra = dataCompra;
	}

	public Integer getParcelas() {
		return parcelas;
	}

	public void setParcelas(Integer parcelas) {
		this.parcelas = parcelas;
	}

	public Cartao getCartao() {
		return cartao;
	}

	public void setCartao(Cartao cartao) {
		this.cartao = cartao;
	}
	
}
