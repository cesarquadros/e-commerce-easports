package br.com.ecommerceeasports.managedbean;

import java.util.List;

import br.com.ecommerceeasports.entities.Categoria;
import br.com.ecommerceeasports.persistence.CategoriaDAO;

public class ManagedBeanCategoria {

	private List<Categoria> listagemCategorias;

	public List<Categoria> getListagemCategorias() {

		try {
			CategoriaDAO c = new CategoriaDAO();

			listagemCategorias = c.listAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listagemCategorias;
	}
}
