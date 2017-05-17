package br.com.ecommerceeasports.persistence;

import java.sql.Statement;

import br.com.ecommerceeasports.entities.Compra;
import br.com.ecommerceeasports.util.ConverteData;

public class CompraDao extends DAO{
	
	public int insert (Compra compra) throws Exception {
		
		int idCompra = 0;
		String query = "insert into carrinho_compra(dataCompra, parcelas, idCartao, tipoPagamento) values(?,?,?,?)";
		
		abreConexao();
		stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		
		stmt.setString(1, ConverteData.dateCompletaToString(compra.getDataCompra()));
		stmt.setInt(2, compra.getParcelas());
		stmt.setInt(3, compra.getCartao().getIdCartao());
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
}
