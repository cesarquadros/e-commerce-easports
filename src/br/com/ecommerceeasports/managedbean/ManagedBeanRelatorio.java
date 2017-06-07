package br.com.ecommerceeasports.managedbean;

import java.util.List;

import br.com.ecommerceeasports.entities.CountCarrinho;
import br.com.ecommerceeasports.persistence.CarrinhoDAO;

public class ManagedBeanRelatorio {
	private List<CountCarrinho> teste;

	public List<CountCarrinho> getListagemCategorias() {

		try {
			CarrinhoDAO c = new CarrinhoDAO();

			teste = c.relatorioVendaPorItens();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return teste;
	}
}
