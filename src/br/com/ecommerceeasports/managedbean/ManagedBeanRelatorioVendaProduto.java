package br.com.ecommerceeasports.managedbean;
import java.util.List;

import br.com.ecommerceeasports.entities.CountCarrinho;
import br.com.ecommerceeasports.persistence.CarrinhoDAO;

public class ManagedBeanRelatorioVendaProduto {

	private List<CountCarrinho> listagemCategorias;

	public List<CountCarrinho> getListagemCategorias() {

		try {
			CarrinhoDAO c = new CarrinhoDAO();

			listagemCategorias = c.relatorioVendaPorItens();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listagemCategorias;
	}
}