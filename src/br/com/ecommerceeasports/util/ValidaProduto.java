package br.com.ecommerceeasports.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.ClienteDAO;
import br.com.ecommerceeasports.persistence.ProdutoDAO;
@WebServlet("/ValidaProduto")
public class ValidaProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ValidaProduto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		response.setContentType("text/plain");

		StringBuilder sb = new StringBuilder();
		BufferedReader br = request.getReader();
		String str = null;

		while ((str = br.readLine()) != null) {
			sb.append(str);
		}
		String opcao = sb.toString();
		
		ProdutoDAO produtoDAO = new ProdutoDAO();
		Produto produto = produtoDAO.findByCodProduto(opcao);
		
		PrintWriter out = response.getWriter();
		
		if(produto.getCodigo() != null){
			out.println("ERRO");
		}
	}
}
