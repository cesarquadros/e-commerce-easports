package br.com.ecommerceeasports.principal;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.Endereco;
import br.com.ecommerceeasports.persistence.ClienteDAO;
import br.com.ecommerceeasports.persistence.DAO;
import br.com.ecommerceeasports.persistence.EnderecoDAO;
import br.com.ecommerceeasports.util.ConverteData;

public class Main {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		DAO dao = new DAO();
		
		try {
			dao.abreConexao();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Endereco endereco = new Endereco();
		
		endereco.setLogradouro("santa julieta");
		endereco.setCep("04426090");
		endereco.setNumero(91);
		endereco.setComplemento("casa 1");
		endereco.setBairro("missionaria");
		endereco.setCidade("Sampa");
		endereco.setEstado("Sampa");
		
		EnderecoDAO e = new EnderecoDAO();
		
		e.insert(endereco);
		
		
		
		Cliente cli = new Cliente();
		
		cli.setEmail("teste@teste");
		cli.setSenha("190788");
		cli.setNome("cesar");
		cli.setSexo("M");
		cli.setCpf("37765289829");
		cli.setDataNascimento(ConverteData.stringToDate("19-07-1988"));
		cli.setTelefone("56214658");

		
		ClienteDAO c = new ClienteDAO();
		
		c.insert(cli, 1);
	}

}
