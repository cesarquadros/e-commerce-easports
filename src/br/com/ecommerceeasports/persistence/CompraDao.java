package br.com.ecommerceeasports.persistence;

import br.com.ecommerceeasports.entities.Compra;
import br.com.ecommerceeasports.util.ConverteData;

public class CompraDao extends DAO{
	
	public void insert (Compra compra) throws Exception {
		
		String query = "insert into carrinho_compra(dataCompra, parcelas, idCartao, tipoPagamento) values(?,?,?,?)";
		
		abreConexao();
		stmt = con.prepareStatement(query);
		
		stmt.setString(1, ConverteData.dateCompletaToString(compra.getDataCompra()));
		stmt.setInt(2, compra.getParcelas());
		stmt.setInt(3, compra.getCartao().getIdCartao());
		stmt.setString(4, compra.getTipoPagamento());
		
		stmt.execute();

		stmt.close();

		fechaConexao();
	}
}
