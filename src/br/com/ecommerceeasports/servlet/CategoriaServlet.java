package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ecommerceeasports.entities.Categoria;
import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.CategoriaDAO;
import br.com.ecommerceeasports.persistence.ProdutoDAO;

@WebServlet("/CategoriaServlet")
public class CategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CategoriaServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			
			String categoriaString = request.getParameter("categoria").toUpperCase();

			CategoriaDAO categoriaDao = new CategoriaDAO();
			Categoria categoria = new Categoria();
			
			categoria = categoriaDao.findByName(categoriaString);
			
			ProdutoDAO produtoDao = new ProdutoDAO();
			
			List<Produto> lista = produtoDao.findByCategoria(categoria);
			
			
			request.setAttribute("listaProdutos", lista);
			request.getRequestDispatcher("produtocategoria.jsp").forward(request, response);
			
		} catch (Exception e) {
			request.setAttribute("erro666", e.toString());
			request.getRequestDispatcher("paginaerro.jsp").forward(request, response);
		}
		
	}

}
