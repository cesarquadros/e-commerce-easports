package br.com.ecommerceeasports.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.sun.javafx.scene.paint.GradientUtils.Parser;

import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.ProdutoDAO;

@WebServlet("/ComprarProdutoServlet")
public class ComprarProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ComprarProdutoServlet() {
		// TODO Auto-generated constructor stub
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/plain");
		               

	try {
			PrintWriter out = response.getWriter();
			ObjectMapper mapper = new ObjectMapper();

			ProdutoDAO p = new ProdutoDAO();

			List<Produto> listagemProdutos;

			listagemProdutos = p.listAll();

			String json = mapper.writeValueAsString(listagemProdutos);
			json = "{\"produtos\":"+json+"}";
			
			System.out.println(json);
			out.println(json);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);

	}

}
