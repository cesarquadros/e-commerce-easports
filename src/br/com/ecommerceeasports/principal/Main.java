package br.com.ecommerceeasports.principal;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.Endereco;
import br.com.ecommerceeasports.entities.ItemCarrinho;
import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.managedbean.ManagedBeanProduto;
import br.com.ecommerceeasports.persistence.CarrinhoDAO;
import br.com.ecommerceeasports.persistence.ClienteDAO;
import br.com.ecommerceeasports.persistence.DAO;
import br.com.ecommerceeasports.persistence.EnderecoDAO;
import br.com.ecommerceeasports.persistence.ProdutoDAO;
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
		
		
/*		Endereco endereco = new Endereco();
		
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
		
		Produto p = new Produto();
		
		p.setCodigo("100");
		p.setNome("tenis");
		p.setPrecoCusto(10.50);
		p.setPrecoVenda(20.90);
		p.setImagem("imagem");
		
		ProdutoDAO pDao = new ProdutoDAO();
		
		pDao.insert(p, 1);
		
		ManagedBeanProduto m = new ManagedBeanProduto();
		
		m.getListagemProdutos();
		
		ClienteDAO c = new ClienteDAO();
		
		c.findByLogin("teste@teste", "190788");*/
		
		Cliente cli = new Cliente();
		
		cli.setEmail("teste@teste");
		cli.setSenha("190788");
		cli.setNome("cesar");
		cli.setSexo("M");
		cli.setCpf("37765289829");
		cli.setDataNascimento(ConverteData.stringToDate("19-07-1988"));
		cli.setTelefone("56214658");
		cli.setIdCliente(1);
		
		Produto p = new Produto();
		
		p.setCodigo("100");
		p.setNome("tenis");
		p.setPrecoCusto(10.50);
		p.setPrecoVenda(20.90);
		p.setImagem("imagem");
		p.setIdProduto(1);
			
		
		ItemCarrinho i = new ItemCarrinho();
		
		i.setCliente(cli);
		i.setProduto(p);
		i.setIdItem(1);
		
		
		CarrinhoDAO carrinho = new CarrinhoDAO();
		
		carrinho.insert(i);
		
		
		
	}

}
