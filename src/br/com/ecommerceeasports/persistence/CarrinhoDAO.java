package br.com.ecommerceeasports.persistence;

import java.util.ArrayList;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.CountCarrinho;
import br.com.ecommerceeasports.entities.ItemCarrinho;
import br.com.ecommerceeasports.util.FormataValor;

public class CarrinhoDAO extends DAO {

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

		String query = "select * from itens_carrinho where idCliente = ? and finalizado = '0'";

		abreConexao();

		stmt = con.prepareStatement(query);
		stmt.setInt(1, idCliente);
		rs = stmt.executeQuery();

		ArrayList<ItemCarrinho> lista = new ArrayList<ItemCarrinho>();
		FormataValor format = new FormataValor();

		while (rs.next()) {

			ClienteDAO clienteDAO = new ClienteDAO();
			ProdutoDAO produtoDao = new ProdutoDAO();

			ItemCarrinho itemCarrinho = new ItemCarrinho();

			itemCarrinho.setIdItem((rs.getInt("idItem")));
			itemCarrinho.setCliente(clienteDAO.findById(rs.getInt("idCliente")));
			itemCarrinho.setProduto(produtoDao.findById(rs.getInt("idProduto")));

			lista.add(itemCarrinho);
		}

		stmt.close();

		fechaConexao();

		return lista;
	}

	public void excluirItem(Integer idItem) throws Exception {

		String query = "update itens_carrinho set finalizado = ? where idItem = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, 1);
		stmt.setInt(2, idItem);

		stmt.execute();

		stmt.close();

		fechaConexao();

	}

	public ArrayList<CountCarrinho> countByBliente(Integer idCliente) throws Exception {

		String query = "SELECT P.NOME, P.PRECOVENDA, count(*) as quantidade FROM ITENS_CARRINHO IC INNER JOIN PRODUTO P ON IC.IDPRODUTO = P.IDPRODUTO WHERE IC.FINALIZADO = ? and idCliente = ? GROUP BY IC.IDPRODUTO;";

		abreConexao();

		stmt = con.prepareStatement(query);
		stmt.setInt(1, 0);
		stmt.setInt(2, idCliente);
		rs = stmt.executeQuery();

		ArrayList<CountCarrinho> lista = new ArrayList<CountCarrinho>();
		FormataValor format = new FormataValor();

		while (rs.next()) {

			CountCarrinho countCarrinho = new CountCarrinho();
			Integer quantidade = rs.getInt("quantidade");
			
			countCarrinho.setNome(rs.getString("nome"));
			countCarrinho.setValorFormatado(format.valorFormatado(rs.getDouble("precoVenda")*quantidade));
			countCarrinho.setQuantidade(rs.getInt("quantidade"));
			lista.add(countCarrinho);
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
}
