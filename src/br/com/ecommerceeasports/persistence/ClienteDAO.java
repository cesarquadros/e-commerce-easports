package br.com.ecommerceeasports.persistence;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.util.ConverteData;

public class ClienteDAO extends DAO{

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

		}

		stmt.close();

		fechaConexao();

		return cliente;

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

		}

		stmt.close();

		fechaConexao();

		return cliente;

	}
	
}
