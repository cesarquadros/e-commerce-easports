package br.com.ecommerceeasports.persistence;

import java.sql.Statement;
import java.util.ArrayList;

import br.com.ecommerceeasports.entities.Compra;
import br.com.ecommerceeasports.util.ConverteData;

public class CompraDao extends DAO{
	
	public int insert (Compra compra, int idCartao) throws Exception {
		
		int idCompra = 0;
		String query = "insert into carrinho_compra(dataCompra, parcelas, idCartao, tipoPagamento) values(?,?,?,?)";
		
		abreConexao();
		stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		
		stmt.setString(1, ConverteData.dateCompletaToString(compra.getDataCompra()));
		stmt.setInt(2, compra.getParcelas());
		stmt.setInt(3, idCartao);
		stmt.setString(4, compra.getTipoPagamento());
		
		stmt.execute();

		rs = stmt.getGeneratedKeys();

		while (rs.next()) {

			idCompra = rs.getInt(1);

		}
		stmt.close();
		fechaConexao();
		
		return idCompra;
	}
	
	public ArrayList<Compra> listCompraFinalizadas() throws Exception{
		
		String query = "select * from carrinho_compra";
		
		abreConexao();

		stmt = con.prepareStatement(query);
		rs = stmt.executeQuery();
		
		ArrayList<Compra> list = new ArrayList<>();
		CartaoDAO cartaoDAO = new CartaoDAO();
		
		while(rs.next()){
			Compra compra = new Compra();
			cartaoDAO = new CartaoDAO();
			
			compra.setIdCompra(rs.getInt("idCompra"));
			compra.setDataCompra(ConverteData.stringToDate(rs.getString("dataCompra")));
			compra.setDataCompraFormata(rs.getString("dataCompra"));
			compra.setParcelas(rs.getInt("parcelas"));
			compra.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			compra.setTipoPagamento(rs.getString("tipoPagamento"));
			list.add(compra);			
		}
		
		return list;
	}
}































