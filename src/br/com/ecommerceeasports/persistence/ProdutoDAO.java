package br.com.ecommerceeasports.persistence;
import java.util.ArrayList;
import java.util.List;

import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.util.FormataValor;

public class ProdutoDAO extends DAO {

	public void insert(Produto produto, int idCategoria) throws Exception {

		String query = "insert into Produto"
				+ "(codigo, nome, imagem, precoCusto, precoVenda, idCategoria, origem, dimensoes, peso, garantia, descricao)"
				+ "VALUES"
				+ "(?,?,?,?,?,?,?,?,?,?,?)";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, produto.getCodigo());
		stmt.setString(2, produto.getNome());
		stmt.setString(3, produto.getImagem());
		stmt.setDouble(4, produto.getPrecoCusto());
		stmt.setDouble(5, produto.getPrecoVenda());
		stmt.setInt(6, idCategoria);
		
		stmt.setString(7, produto.getOrigem());
		stmt.setString(8, produto.getDimensoes());
		stmt.setString(9, produto.getPeso());
		stmt.setString(10, produto.getGarantia());
		stmt.setString(11, produto.getDescricao());

		stmt.execute();

		stmt.close();

		fechaConexao();

	}
	
	
	public List<Produto> listAll() throws Exception {

		String query = "select * from produto order by RANDOM()";

		abreConexao();

		stmt = con.prepareStatement(query);

		rs = stmt.executeQuery();

		List<Produto> lista = new ArrayList<Produto>();

		while (rs.next()) {

			Produto produto = new Produto();

			CategoriaDAO categoriaDao = new CategoriaDAO();
			
			FormataValor format = new FormataValor();

			produto.setIdProduto(rs.getInt("idProduto"));
			produto.setCodigo(rs.getString("codigo"));
			produto.setNome(rs.getString("nome"));
			produto.setImagem(rs.getString("imagem"));
			produto.setCategoria(categoriaDao.findById(rs.getInt("idCategoria")));
			produto.setPrecoVenda(rs.getDouble("precoVenda"));
			produto.setPrecoCusto(rs.getDouble("precoCusto"));
			produto.setValorVendaFormatado(format.valorFormatado(rs.getDouble("precoVenda")));
			produto.setValorCustoFormatado(format.valorFormatado(rs.getDouble("precoCusto")));
			
			produto.setOrigem(rs.getString("origem"));
			produto.setDimensoes(rs.getString("dimensoes"));
			produto.setPeso(rs.getString("peso"));
			produto.setGarantia(rs.getString("garantia"));
			produto.setDescricao(rs.getString("descricao"));

			lista.add(produto);

		}

		stmt.close();

		fechaConexao();

		return lista;

	}
	
	public Produto findById(Integer idProduto) throws Exception {

		String query = "select * from produto where idProduto = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, idProduto);

		rs = stmt.executeQuery();

		Produto produto = new Produto();
		FormataValor format = new FormataValor();

		while (rs.next()) {

			produto = new Produto();

			CategoriaDAO categoriaDao = new CategoriaDAO();
			
			produto.setIdProduto(rs.getInt("idProduto"));
			produto.setCodigo(rs.getString("codigo"));
			produto.setNome(rs.getString("nome"));
			produto.setImagem(rs.getString("imagem"));
			produto.setCategoria(categoriaDao.findById(rs.getInt("idCategoria")));
			produto.setPrecoVenda(rs.getDouble("precoVenda"));
			produto.setPrecoCusto(rs.getDouble("precoCusto"));
			produto.setValorVendaFormatado(format.valorFormatado(rs.getDouble("precoVenda")));
			produto.setValorCustoFormatado(format.valorFormatado(rs.getDouble("precoCusto")));
			
			produto.setOrigem(rs.getString("origem"));
			produto.setDimensoes(rs.getString("dimensoes"));
			produto.setPeso(rs.getString("peso"));
			produto.setGarantia(rs.getString("garantia"));
			produto.setDescricao(rs.getString("descricao"));
			
		}

		stmt.close();
		rs.close();
		fechaConexao();

		return produto;

	}
	
	
	

	/*public void update(Produto produto) throws Exception {

		String query = "update produto set valor_venda = ?, valor_custo = ?, quantidade = ? where id_produto = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		int contador = 1;
		
		stmt.setDouble(contador++, produto.getPrecoVenda());
		stmt.setDouble(contador++, produto.getPrecoCusto());
		stmt.setInt(contador++, produto.getIdProduto());

		stmt.execute();

		stmt.close();

		fechaConexao();

	}

	public void delete(Integer id_produto) throws Exception {

		String query = "delete from produto where id_produto = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, id_produto);

		stmt.execute();

		stmt.close();

		fechaConexao();

	}

	public Produto findById(Integer id_produto) throws Exception {

		String query = "select * from produto where id_produto = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, id_produto);

		rs = stmt.executeQuery();

		Produto produto = new Produto();
		
		FormataValor format = new FormataValor();

		while (rs.next()) {

			CategoriaDAO categoriaDao = new CategoriaDAO();
			FornecedorDAO fornecedorDao = new FornecedorDAO();
			
			produto.setIdProduto(rs.getInt("id_produto"));
			produto.setNome(rs.getString("nome"));
			produto.setImagem(rs.getString("imagem"));
			produto.setCodigo(rs.getString("codigo"));
			produto.setCategoria(categoriaDao.findById(rs.getInt("id_categoria")));
			produto.setFornecedor(fornecedorDao.findById(rs.getInt("id_fornecedor")));
			produto.setValorVenda(rs.getDouble("valor_venda"));
			produto.setValorCusto(rs.getDouble("valor_custo"));
			produto.setValorVendaFormatado(format.valorFormatado(rs.getDouble("valor_venda")));
			produto.setValorCustoFormatado(format.valorFormatado(rs.getDouble("valor_custo")));
			produto.setQuantidade(rs.getInt("quantidade"));

		}

		stmt.close();
		rs.close();
		fechaConexao();

		return produto;

	}

	public Produto findByCodigo(String codigo) throws Exception {

		String query = "select * from produto where codigo = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, codigo);

		rs = stmt.executeQuery();

		Produto produto = new Produto();
		
		FormataValor format = new FormataValor();

		while (rs.next()) {

			CategoriaDAO categoriaDao = new CategoriaDAO();
			FornecedorDAO fornecedorDao = new FornecedorDAO();
			
			produto.setIdProduto(rs.getInt("id_produto"));
			produto.setNome(rs.getString("nome"));
			produto.setImagem(rs.getString("imagem"));
			produto.setCodigo(rs.getString("codigo"));
			produto.setCategoria(categoriaDao.findById(rs.getInt("id_categoria")));
			produto.setFornecedor(fornecedorDao.findById(rs.getInt("id_fornecedor")));
			produto.setValorVenda(rs.getDouble("valor_venda"));
			produto.setValorCusto(rs.getDouble("valor_custo"));
			produto.setValorVendaFormatado(format.valorFormatado(rs.getDouble("valor_venda")));
			produto.setValorCustoFormatado(format.valorFormatado(rs.getDouble("valor_custo")));
			produto.setQuantidade(rs.getInt("quantidade"));

		}

		stmt.close();

		fechaConexao();

		return produto;

	}

	public List<Produto> findByName(String nome) throws Exception {

		String query = "select * from produto where nome like '%" + nome + "%'";

		abreConexao();

		stmt = con.prepareStatement(query);

		//stmt.setString(1, "'%" + nome.toLowerCase() + "%'");

		rs = stmt.executeQuery();

		List<Produto> lista = new ArrayList<Produto>();

		FormataValor format = new FormataValor();
		
		while (rs.next()) {

			CategoriaDAO categoriaDao = new CategoriaDAO();
			FornecedorDAO fornecedorDao = new FornecedorDAO();
			
			Produto produto = new Produto();

			produto.setIdProduto(rs.getInt("id_produto"));
			produto.setNome(rs.getString("nome"));
			produto.setImagem(rs.getString("imagem"));
			produto.setCodigo(rs.getString("codigo"));
			produto.setCategoria(categoriaDao.findById(rs.getInt("id_categoria")));
			produto.setFornecedor(fornecedorDao.findById(rs.getInt("id_fornecedor")));
			produto.setValorVenda(rs.getDouble("valor_venda"));
			produto.setValorCusto(rs.getDouble("valor_custo"));
			produto.setValorVendaFormatado(format.valorFormatado(rs.getDouble("valor_venda")));
			produto.setValorCustoFormatado(format.valorFormatado(rs.getDouble("valor_custo")));
			produto.setQuantidade(rs.getInt("quantidade"));

			lista.add(produto);
			
		}

		stmt.close();

		fechaConexao();

		return lista;

	}
	
	
	
	public List<Produto> findByCategoriaFornecedor(Integer idCategoria, Integer idFornecedor) throws Exception {

		String query = "select * from produto where id_categoria = ? and id_fornecedor = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, idCategoria);
		stmt.setInt(2, idFornecedor);
		
		rs = stmt.executeQuery();

		List<Produto> lista = new ArrayList<Produto>();

		while (rs.next()) {

			Produto produto = new Produto();

			CategoriaDAO categoriaDao = new CategoriaDAO();
			FornecedorDAO fornecedorDao = new FornecedorDAO();
			
			FormataValor format = new FormataValor();

			produto.setIdProduto(rs.getInt("id_produto"));
			produto.setNome(rs.getString("nome"));
			produto.setImagem(rs.getString("imagem"));
			produto.setCodigo(rs.getString("codigo"));
			produto.setCategoria(categoriaDao.findById(rs.getInt("id_categoria")));
			produto.setFornecedor(fornecedorDao.findById(rs.getInt("id_fornecedor")));
			produto.setValorVenda(rs.getDouble("valor_venda"));
			produto.setValorCusto(rs.getDouble("valor_custo"));
			produto.setValorVendaFormatado(format.valorFormatado(rs.getDouble("valor_venda")));
			produto.setValorCustoFormatado(format.valorFormatado(rs.getDouble("valor_custo")));
			produto.setQuantidade(rs.getInt("quantidade"));

			lista.add(produto);

		}
		
		stmt.close();

		fechaConexao();

		return lista;

	}
*/
}
