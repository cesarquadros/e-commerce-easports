package br.com.easports.principal;

import br.com.easports.entities.Cliente;
import br.com.easports.persistence.ClienteDAO;
import br.com.easports.persistence.DAO;
import br.com.easports.util.ConverteData;

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
