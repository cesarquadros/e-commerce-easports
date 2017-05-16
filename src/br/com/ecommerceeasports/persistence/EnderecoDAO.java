package br.com.ecommerceeasports.persistence;


import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.ecommerceeasports.entities.Endereco;

public class EnderecoDAO extends DAO {

	public void delete(final Integer id_endereco) throws Exception {

		final String query = "delete from endereco where id_endereco = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, id_endereco);

		stmt.execute();

		stmt.close();

		fechaConexao();

	}

	public Endereco findById(final Integer id_endereco) throws Exception {

		final String query = "select * from Endereco where idEndereco = ?";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setInt(1, id_endereco);

		rs = stmt.executeQuery();

		final Endereco endereco = new Endereco();

		while (rs.next()) {
			endereco.setIdEndereco(id_endereco);
			endereco.setLogradouro(rs.getString("logradouro"));
			endereco.setNumero(rs.getInt("numero"));
			endereco.setComplemento(rs.getString("complemento"));
			endereco.setCep(rs.getString("cep"));
			endereco.setBairro(rs.getString("bairro"));
			endereco.setCidade(rs.getString("cidade"));
			endereco.setEstado(rs.getString("estado"));

		}

		stmt.close();

		fechaConexao();

		return endereco;

	}

	public void insert(final Endereco endereco) throws Exception {

		final String query = "insert into endereco(logradouro, cep, numero, complemento, bairro, cidade, estado)VALUES(?,?,?,?,?,?,?)";

		abreConexao();

		stmt = con.prepareStatement(query);

		stmt.setString(1, endereco.getLogradouro());
		stmt.setString(2, endereco.getCep());
		stmt.setInt(3, endereco.getNumero());
		stmt.setString(4, endereco.getComplemento());
		stmt.setString(5, endereco.getBairro());
		stmt.setString(6, endereco.getCidade());
		stmt.setString(7, endereco.getEstado());

		stmt.execute();

		stmt.close();

		fechaConexao();

	}

	public int insertReturnID(final Endereco endereco) throws Exception {

		int idEndereco = 0;

		final String query = "insert into endereco(logradouro, cep, numero, complemento, bairro, cidade, estado)VALUES(?,?,?,?,?,?,?)";

		abreConexao();

		stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

		stmt.setString(1, endereco.getLogradouro());
		stmt.setString(2, endereco.getCep());
		stmt.setInt(3, endereco.getNumero());
		stmt.setString(4, endereco.getComplemento());
		stmt.setString(5, endereco.getBairro());
		stmt.setString(6, endereco.getCidade());
		stmt.setString(7, endereco.getEstado());
		
		stmt.execute();

		rs = stmt.getGeneratedKeys();

		while (rs.next()) {

			idEndereco = rs.getInt(1);

		}

		stmt.close();

		fechaConexao();

		return idEndereco;

	}

	public List<Endereco> listAll() throws Exception {

		final String query = "select * from endereco";

		abreConexao();

		stmt = con.prepareStatement(query);

		rs = stmt.executeQuery();

		final List<Endereco> lista = new ArrayList<Endereco>();

		while (rs.next()) {

			final Endereco endereco = new Endereco();

			endereco.setIdEndereco(rs.getInt("idEndereco"));
			endereco.setLogradouro(rs.getString("logradouro"));
			endereco.setNumero(rs.getInt("numero"));
			endereco.setCep(rs.getString("cep"));
			endereco.setBairro(rs.getString("bairro"));
			endereco.setCidade(rs.getString("cidade"));
			endereco.setEstado(rs.getString("estado"));
			endereco.setComplemento(rs.getString("complemento"));

			lista.add(endereco);

		}

		stmt.close();

		fechaConexao();

		return lista;

	}

	public void update(final Endereco endereco) throws Exception {

		abreConexao();

		final String query = "update endereco set logradouro = ?, cep = ?, numero = ?, complemento = ?,bairro = ?, cidade = ?, estado = ? where idEndereco = ?";

		stmt = con.prepareStatement(query);

		stmt.setString(1, endereco.getLogradouro());
		stmt.setString(2, endereco.getCep());
		stmt.setInt(3, endereco.getNumero());
		stmt.setString(4, endereco.getComplemento());
		stmt.setString(5, endereco.getBairro());
		stmt.setString(6, endereco.getCidade());
		stmt.setString(7, endereco.getEstado());
		stmt.setInt(8, endereco.getIdEndereco());
		
		stmt.execute();

		stmt.close();

		fechaConexao();

	}

}
