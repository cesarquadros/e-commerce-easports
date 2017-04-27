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
	
}
