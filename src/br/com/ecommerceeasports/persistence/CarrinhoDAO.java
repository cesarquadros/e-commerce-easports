package br.com.ecommerceeasports.persistence;

import java.util.ArrayList;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.CountCarrinho;
import br.com.ecommerceeasports.entities.ItemCarrinho;
import br.com.ecommerceeasports.util.FormataValor;

public class CarrinhoDAO extends Conexao {

	public void insert(ItemCarrinho item) throws Exception {

		String query = "insert into itens_carrinho(idCliente, idProduto)VALUES(?,?)";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, item.getCliente().getIdCliente());
		stmt.setInt(2, item.getProduto().getIdProduto());

		stmt.execute();

		stmt.close();

		fechaConexao();

	}

	public ArrayList<ItemCarrinho> itensPorCliente(Integer idCliente) throws Exception {

		String query = "select * from itens_carrinho where idCliente = ? and finalizado = 0 and removido = 0";

		abreConexao();

		stmt = con.prepareStatement(query);
		stmt.setInt(1, idCliente);
		rs = stmt.executeQuery();

		ArrayList<ItemCarrinho> lista = new ArrayList<ItemCarrinho>();
		FormataValor format = new FormataValor();

		while (rs.next()) {

			ProdutoDAO produtoDao = new ProdutoDAO();

			ItemCarrinho itemCarrinho = new ItemCarrinho();

			itemCarrinho.setIdItem((rs.getInt("idItem")));
			itemCarrinho.setProduto(produtoDao.findById(rs.getInt("idProduto")));

			lista.add(itemCarrinho);
		}

		stmt.close();

		fechaConexao();

		return lista;
	}

	public void excluirItem(Integer idProduto, Integer idCliente) throws Exception {

		String query = "update itens_carrinho set removido = 1 where idItem = (select min(idItem)"
				+ "from itens_carrinho where idProduto = ? and removido = 0 and idCliente = ?)";

		abreConexao();

		stmt = con.prepareStatement(query);
		
		stmt.setInt(1, idProduto);
		stmt.setInt(2, idCliente);

		stmt.execute();

		stmt.close();

		fechaConexao();

	}

	public ArrayList<CountCarrinho> countByBliente(Integer idCliente) throws Exception {

		StringBuilder hql = new StringBuilder();
		
		hql.append(" SELECT ");
		hql.append("   p.nome, ");
		hql.append("   p.precovenda, ");
		hql.append("   p.idProduto, ");
		hql.append("      (SELECT COUNT(*) as cont ");
		hql.append("      FROM ");
		hql.append("         itens_carrinho ic ");
		hql.append("	  WHERE ");
		hql.append("         p.idProduto = ic.idProduto ");
		hql.append("         and IC.FINALIZADO = 0 ");
		hql.append("         and IC.REMOVIDO = 0 ");
		hql.append("         and idCliente = ?) ");
		hql.append("   as quantidade ");
		hql.append(" FROM ");
		hql.append("   produto p");
		
		abreConexao();

		stmt = con.prepareStatement(hql.toString());
		
		int index = 1;
		
		stmt.setInt(index++, idCliente);
		
		rs = stmt.executeQuery();

		ArrayList<CountCarrinho> lista = new ArrayList<CountCarrinho>();
		
		FormataValor format = new FormataValor();

		while (rs.next()) {
			
			Integer quantidade = rs.getInt("quantidade");
			
			if (quantidade > 0) {
				
				CountCarrinho countCarrinho = new CountCarrinho();
				ProdutoDAO produtoDao= new ProdutoDAO();
				
				countCarrinho.setProduto(produtoDao.findById(rs.getInt("idProduto")));
				countCarrinho.setValorFormatado(format.valorFormatado(rs.getDouble("precoVenda")*quantidade));
				countCarrinho.setQuantidade(rs.getInt("quantidade"));
				
				lista.add(countCarrinho);
			}
		}

		stmt.close();
		fechaConexao();
		
		return lista;
	}
	
	public void finalizarItem(Integer idItem, Integer idCompra) throws Exception {

		String query = "update itens_carrinho set finalizado = ?, idCompra = ? where idItem = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, 3);
		stmt.setInt(2, idCompra);
		stmt.setInt(3, idItem);

		stmt.execute();

		stmt.close();

		fechaConexao();

	}
	
	public ArrayList<ItemCarrinho> itensByCompra(Integer idCompra) throws Exception {

		String query = "select * from itens_carrinho where idCompra = ?";

		abreConexao();

		stmt = con.prepareStatement(query);
		stmt.setInt(1, idCompra);
		rs = stmt.executeQuery();

		ArrayList<ItemCarrinho> lista = new ArrayList<ItemCarrinho>();
		FormataValor format = new FormataValor();

		while (rs.next()) {

			ProdutoDAO produtoDao = new ProdutoDAO();

			ItemCarrinho itemCarrinho = new ItemCarrinho();

			itemCarrinho.setIdItem((rs.getInt("idItem")));
			itemCarrinho.setProduto(produtoDao.findById(rs.getInt("idProduto")));

			lista.add(itemCarrinho);
		}

		stmt.close();

		fechaConexao();

		return lista;
	}
}
