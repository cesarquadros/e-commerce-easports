package br.com.ecommerceeasports.persistence;

import java.sql.Statement;
import java.util.ArrayList;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.Compra;
import br.com.ecommerceeasports.util.ConverteData;

public class CompraDao extends Conexao {

	public int compraCartao(Compra compra, int idCartao) throws Exception {

		int idCompra = 0;
		String query = "insert into carrinho_compra(dataCompra, parcelas, idCartao, tipoPagamento, numProtocolo) values(?,?,?,?,?)";

		abreConexao();
		stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

		stmt.setString(1, ConverteData.dateCompletaToString(compra.getDataCompra()));
		stmt.setInt(2, compra.getParcelas());
		stmt.setInt(3, idCartao);
		stmt.setString(4, compra.getTipoPagamento());
		stmt.setString(5, compra.getNumProtocolo());

		stmt.execute();

		rs = stmt.getGeneratedKeys();

		while (rs.next()) {

			idCompra = rs.getInt(1);

		}
		stmt.close();
		fechaConexao();

		return idCompra;
	}

	public int compraBoleto(Compra compra) throws Exception {

		int idCompra = 0;
		String query = "insert into carrinho_compra(dataCompra, parcelas, tipoPagamento, numProtocolo) values(?,?,?, ?)";

		abreConexao();
		stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

		stmt.setString(1, ConverteData.dateCompletaToString(compra.getDataCompra()));
		stmt.setInt(2, compra.getParcelas());
		stmt.setString(3, compra.getTipoPagamento());
		stmt.setString(4, compra.getNumProtocolo());
		
		stmt.execute();

		rs = stmt.getGeneratedKeys();

		while (rs.next()) {
			idCompra = rs.getInt(1);
		}

		stmt.close();
		fechaConexao();

		return idCompra;
	}

	public ArrayList<Compra> listCompraFinalizadas() throws Exception {

		String query = "select * from carrinho_compra";

		abreConexao();

		stmt = con.prepareStatement(query);
		rs = stmt.executeQuery();

		ArrayList<Compra> list = new ArrayList<>();
		CartaoDAO cartaoDAO = new CartaoDAO();

		while (rs.next()) {
			Compra compra = new Compra();
			cartaoDAO = new CartaoDAO();

			compra.setIdCompra(rs.getInt("idCompra"));
			compra.setDataCompra(ConverteData.stringToDate(rs.getString("dataCompra")));
			compra.setDataCompraFormata(rs.getString("dataCompra"));
			compra.setParcelas(rs.getInt("parcelas"));
			compra.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			compra.setTipoPagamento(rs.getString("tipoPagamento"));
			compra.setNumProtocolo(rs.getString("numProtocolo"));
			list.add(compra);
		}

		return list;
	}


	public ArrayList<Compra> relatorioPeriodo(String inicio, String fim) throws Exception {

		String query = "select * from carrinho_compra where dataCompra between ? and ?";

		abreConexao();

		stmt = con.prepareStatement(query);
		
		stmt.setString(1, inicio);
		stmt.setString(2, fim);
		
		rs = stmt.executeQuery();

		ArrayList<Compra> list = new ArrayList<>();
		CartaoDAO cartaoDAO = new CartaoDAO();

		while (rs.next()) {
			Compra compra = new Compra();
			CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
			cartaoDAO = new CartaoDAO();

			compra.setIdCompra(rs.getInt("idCompra"));
			compra.setDataCompra(ConverteData.stringToDate(rs.getString("dataCompra")));
			compra.setDataCompraFormata(rs.getString("dataCompra"));
			compra.setParcelas(rs.getInt("parcelas"));
			compra.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			compra.setTipoPagamento(rs.getString("tipoPagamento"));
			compra.setNumProtocolo(rs.getString("numProtocolo"));
			compra.setListaItens(carrinhoDAO.itensByCompra(rs.getInt("idCompra")));
			list.add(compra);
		}

		return list;
	}
	
	public ArrayList<Compra> relatorioPeriodoByCliente(String inicio, String fim, Integer idCliente) throws Exception {

		String query = "select * from carrinho_compra "
					+ "where idCompra in(select idCompra from itens_carrinho where idCliente = ?)"
					+ "and dataCompra between ? and ?";

		abreConexao();

		stmt = con.prepareStatement(query);
		
		stmt.setInt(1, idCliente);
		stmt.setString(2, inicio);
		stmt.setString(3, fim);
		
		rs = stmt.executeQuery();

		ArrayList<Compra> list = new ArrayList<>();
		CartaoDAO cartaoDAO = new CartaoDAO();

		while (rs.next()) {
			Compra compra = new Compra();
			CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
			cartaoDAO = new CartaoDAO();

			compra.setIdCompra(rs.getInt("idCompra"));
			compra.setDataCompra(ConverteData.stringToDate(rs.getString("dataCompra")));
			compra.setDataCompraFormata(rs.getString("dataCompra"));
			compra.setParcelas(rs.getInt("parcelas"));
			compra.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			compra.setTipoPagamento(rs.getString("tipoPagamento"));
			compra.setNumProtocolo(rs.getString("numProtocolo"));
			compra.setListaItens(carrinhoDAO.itensByCompra(rs.getInt("idCompra")));
			list.add(compra);
		}

		return list;
	}
}
