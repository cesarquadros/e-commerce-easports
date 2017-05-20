package br.com.ecommerceeasports.persistence;

import java.sql.Statement;

import br.com.ecommerceeasports.entities.Cartao;
import br.com.ecommerceeasports.util.ConverteData;

public class CartaoDAO extends Conexao {

	public int inserir(Cartao cartao) throws Exception {

		int idCartao = 0;
		
		String query = "insert into Cartao(numero, nomeImpresso, validade, codigoSeguranca) values(?,?,?,?)";

		abreConexao();
		
		stmt = con.prepareStatement(query);
		
		stmt.setString(1, cartao.getNumero());
		stmt.setString(2, cartao.getNomeImpresso());
		stmt.setString(3, ConverteData.dateToString(cartao.getValidade()));
		stmt.setInt(4, cartao.getCodigoSeguranca());

		stmt.execute();
		
		query = "select max(idCartao) as idCartao from cartao";

		stmt = con.prepareStatement(query);
		
		rs = stmt.executeQuery();
		
		while(rs.next()){
			
			idCartao = rs.getInt("idCartao");
			
		}
		
		stmt.close();
		fechaConexao();
		return idCartao;
	}

	public void update(Cartao cartao) throws Exception {

		String query = "update Cartao set numero =?, nomeImpresso = ?, validade = ?, codigoSeguranca = ? where idCartao = ? ";

		abreConexao();

		stmt = con.prepareStatement(query);
		stmt.setString(1, cartao.getNumero());
		stmt.setString(2, cartao.getNomeImpresso());
		stmt.setString(3, ConverteData.dateToString(cartao.getValidade()));
		stmt.setInt(4, cartao.getCodigoSeguranca());
		stmt.setInt(5, cartao.getIdCartao());

		stmt.execute();
		stmt.close();
		fechaConexao();
	}

	public Cartao findById(Integer idCartao) throws Exception {
		final String query = "select * from cartao where idCartao = ?";

		abreConexao();
		stmt = con.prepareStatement(query);

		stmt.setInt(1, idCartao);

		rs = stmt.executeQuery();

		Cartao cartao = new Cartao();

		while (rs.next()) {
			cartao.setIdCartao(rs.getInt("idCartao"));
			cartao.setNumero(rs.getString("numero"));
			cartao.setNomeImpresso(rs.getString("nomeImpresso"));
			cartao.setValidade(ConverteData.stringToDate(rs.getString("validade")));
			cartao.setValidadeFormatada(rs.getString("validade"));
			cartao.setCodigoSeguranca(rs.getInt("codigoSeguranca"));

			return cartao;
		}
		stmt.close();
		fechaConexao();
		return null;
	}

	public static void main(String[] args) {

		Cartao cartao = new Cartao();

		cartao.setNumero("0055002200330044");
		cartao.setNomeImpresso("Cesar Quadros");
		cartao.setValidade(ConverteData.stringToDate("2017-19-07"));
		cartao.setCodigoSeguranca(569);

		CartaoDAO cartaoDAO = new CartaoDAO();

		cartao.getNumeroX();
		try {
			cartaoDAO.inserir(cartao);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
