package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.ProdutoDAO;

@WebServlet("/CarregarProdutosEstoque")
public class CarregarProdutosEstoque extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CarregarProdutosEstoque() {
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

	private void execute(HttpServletRequest request, HttpServletResponse response) {

		response.setContentType("text/plain");

		PrintWriter out = null;
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			
			out = response.getWriter();

			ProdutoDAO p = new ProdutoDAO();

			List<Produto> listagemProdutos;

			listagemProdutos = p.listAllEstoque();

			String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(listagemProdutos);
			json = "{\"produtos\":" + json + "}";

			//System.out.println(json);
			out.println(json);

		} catch (Exception e) {
			out.println(e.toString());
			e.printStackTrace();
		}
	}

}
