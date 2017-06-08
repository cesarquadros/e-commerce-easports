package br.com.ecommerceeasports.persistence;

import java.util.ArrayList;
import java.util.List;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.util.ConverteData;

public class ClienteDAO extends Conexao{

	public void insert(final Cliente cliente, final int idEndereco) throws Exception {

		final String query = "insert into cliente(email, senha, nome, sexo, cpf, dataNascimento, telefone, idEndereco)VALUES(?,?,?,?,?,?,?,?)";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, cliente.getEmail());
		stmt.setString(2, cliente.getSenha());
		stmt.setString(3, cliente.getNome());
		stmt.setString(4, cliente.getSexo());
		stmt.setString(5, cliente.getCpf());
		stmt.setString(6, ConverteData.dateToString(cliente.getDataNascimento()));
		stmt.setString(7, cliente.getTelefone());
		stmt.setInt(8, idEndereco);

		stmt.execute();

		stmt.close();

		fechaConexao();

	}
	
	public Cliente findByLogin(final String email, String senha) throws Exception {

		final String query = "select * from cliente where email = ? and senha =?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, email);
		stmt.setString(2, senha);

		rs = stmt.executeQuery();

		final Cliente cliente = new Cliente();

		while (rs.next()) {

			final EnderecoDAO enderecoDAO = new EnderecoDAO();
			final CartaoDAO cartaoDAO = new CartaoDAO();
			final CarrinhoDAO carrinhoDAO = new CarrinhoDAO();

			cliente.setIdCliente(rs.getInt("idCliente"));
			cliente.setEmail(rs.getString("email"));
			cliente.setNome(rs.getString("nome"));
			cliente.setSenha(rs.getString("senha"));
			cliente.setSexo(rs.getString("sexo"));			
			
			cliente.setTelefone(rs.getString("telefone"));
			cliente.setCpf(rs.getString("cpf"));
			cliente.setDataNascimento(ConverteData.stringToDate(rs.getString("dataNascimento")));
			cliente.setDataNascFormatada(rs.getString("dataNascimento"));
			cliente.setEndereco(enderecoDAO.findById(rs.getInt("idEndereco")));
			cliente.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			cliente.setListaItens(carrinhoDAO.itensPorCliente(rs.getInt("idCliente")));
			return cliente;
		}

		stmt.close();
		fechaConexao();
		return null;

	}
	
	public Cliente findByCpf(final String cpf) throws Exception {

		final String query = "select * from cliente where cpf = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, cpf);

		rs = stmt.executeQuery();

		final Cliente cliente = new Cliente();

		while (rs.next()) {

			final EnderecoDAO enderecoDAO = new EnderecoDAO();
			final CartaoDAO cartaoDAO = new CartaoDAO();
			final CarrinhoDAO carrinhoDAO = new CarrinhoDAO();

			cliente.setIdCliente(rs.getInt("idCliente"));
			cliente.setEmail(rs.getString("email"));
			cliente.setNome(rs.getString("nome"));
			cliente.setSenha(rs.getString("senha"));
			cliente.setSexo(rs.getString("sexo"));			
			
			cliente.setTelefone(rs.getString("telefone"));
			cliente.setCpf(rs.getString("cpf"));
			cliente.setDataNascimento(ConverteData.stringToDate(rs.getString("dataNascimento")));
			cliente.setDataNascFormatada(rs.getString("dataNascimento"));
			cliente.setEndereco(enderecoDAO.findById(rs.getInt("idEndereco")));
			cliente.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			cliente.setListaItens(carrinhoDAO.itensPorCliente(rs.getInt("idCliente")));
			return cliente;

		}

		stmt.close();

		fechaConexao();

		return null;

	}

	public Cliente findByEmail(final String email) throws Exception {

		final String query = "select * from cliente where email = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, email);

		rs = stmt.executeQuery();

		final Cliente cliente = new Cliente();

		while (rs.next()) {

			final EnderecoDAO enderecoDAO = new EnderecoDAO();
			final CartaoDAO cartaoDAO = new CartaoDAO();
			final CarrinhoDAO carrinhoDAO = new CarrinhoDAO();

			cliente.setIdCliente(rs.getInt("idCliente"));
			cliente.setEmail(rs.getString("email"));
			cliente.setNome(rs.getString("nome"));
			cliente.setSenha(rs.getString("senha"));
			cliente.setSexo(rs.getString("sexo"));			
			
			cliente.setTelefone(rs.getString("telefone"));
			cliente.setCpf(rs.getString("cpf"));
			cliente.setDataNascimento(ConverteData.stringToDate(rs.getString("dataNascimento")));
			cliente.setDataNascFormatada(rs.getString("dataNascimento"));
			cliente.setEndereco(enderecoDAO.findById(rs.getInt("idEndereco")));
			cliente.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			cliente.setListaItens(carrinhoDAO.itensPorCliente(rs.getInt("idCliente")));
			return cliente;

		}

		stmt.close();

		fechaConexao();

		return null;

	}
	
	public Cliente findById(final Integer idCliente) throws Exception {

		final String query = "select * from cliente where idCliente = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, idCliente);

		rs = stmt.executeQuery();

		final Cliente cliente = new Cliente();

		while (rs.next()) {

			final EnderecoDAO enderecoDAO = new EnderecoDAO();
			final CartaoDAO cartaoDAO = new CartaoDAO();
			final CarrinhoDAO carrinhoDAO = new CarrinhoDAO();

			cliente.setIdCliente(rs.getInt("idCliente"));
			cliente.setEmail(rs.getString("email"));
			cliente.setNome(rs.getString("nome"));
			cliente.setSenha(rs.getString("senha"));
			cliente.setSexo(rs.getString("sexo"));			
			
			cliente.setTelefone(rs.getString("telefone"));
			cliente.setCpf(rs.getString("cpf"));
			cliente.setDataNascimento(ConverteData.stringToDate(rs.getString("dataNascimento")));
			cliente.setDataNascFormatada(rs.getString("dataNascimento"));
			cliente.setEndereco(enderecoDAO.findById(rs.getInt("idEndereco")));
			cliente.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			cliente.setListaItens(carrinhoDAO.itensPorCliente(rs.getInt("idCliente")));
			return cliente;

		}
		stmt.close();
		fechaConexao();
		return cliente;

	}
	
	public List<Cliente> listAll() throws Exception {

		final String query = "select * from cliente order by nome asc";

		abreConexao();

		stmt = con.prepareStatement(query);

		rs = stmt.executeQuery();

		final ArrayList<Cliente> list = new ArrayList<>();

		while (rs.next()) {

			final Cliente cliente = new Cliente();
			
			final EnderecoDAO enderecoDAO = new EnderecoDAO();
			final CartaoDAO cartaoDAO = new CartaoDAO();
			final CarrinhoDAO carrinhoDAO = new CarrinhoDAO();

			cliente.setIdCliente(rs.getInt("idCliente"));
			cliente.setEmail(rs.getString("email"));
			cliente.setNome(rs.getString("nome"));
			cliente.setSenha(rs.getString("senha"));
			cliente.setSexo(rs.getString("sexo"));			
			
			cliente.setTelefone(rs.getString("telefone"));
			cliente.setCpf(rs.getString("cpf"));
			cliente.setDataNascimento(ConverteData.stringToDate(rs.getString("dataNascimento")));
			cliente.setDataNascFormatada(rs.getString("dataNascimento"));
			cliente.setEndereco(enderecoDAO.findById(rs.getInt("idEndereco")));
			cliente.setCartao(cartaoDAO.findById(rs.getInt("idCartao")));
			cliente.setListaItens(carrinhoDAO.itensPorCliente(rs.getInt("idCliente")));
			list.add(cliente);

		}
		stmt.close();
		fechaConexao();
		return list;

	}
	
	public void updateCartao(int idCliente, int idCartao) throws Exception{
		
		String query = "update Cliente set idCartao = ? where idCliente = ?";
		
		abreConexao();
		
		stmt = con.prepareStatement(query);
		stmt.setInt(1, idCartao);
		stmt.setInt(2, idCliente);
		
		stmt.execute();
		stmt.close();
		fechaConexao();
		
	}
	
	public void update(final Cliente cliente) throws Exception {

		final String query = "update cliente set telefone=? where idCliente = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, cliente.getTelefone());
		stmt.setInt(2, cliente.getIdCliente());
		
		stmt.execute();

		stmt.close();

		fechaConexao();

	}
	
	public void updateSenha(final Cliente cliente) throws Exception {

		final String query = "update cliente set senha=? where idCliente = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, cliente.getSenha());
		stmt.setInt(2, cliente.getIdCliente());

		stmt.execute();

		stmt.close();

		fechaConexao();

	}
}
