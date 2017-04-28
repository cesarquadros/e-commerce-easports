package br.com.ecommerceeasports.managedbean;

import java.util.List;

import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.ProdutoDAO;



public class ManagedBeanProduto {
	
	private List<Produto> listagemProdutos;
	
	public List<Produto> getListagemProdutos(){
		
		try{
			
			ProdutoDAO p = new ProdutoDAO();
			
			listagemProdutos = p.listAll();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return listagemProdutos;
	}

}