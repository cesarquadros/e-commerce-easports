package br.com.ecommerceeasports.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.ecommerceeasports.entities.Endereco;
import br.com.ecommerceeasports.util.WebServiceCep;

/**
 * Servlet implementation class EnderecoServlet
 */
@WebServlet("/EnderecoServlet")
public class EnderecoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EnderecoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/plain");

		StringBuilder sb = new StringBuilder();
		BufferedReader br = request.getReader();
		String str = null;

		while ((str = br.readLine()) != null) {
			sb.append(str);
		}

		String opcao = sb.toString();

		String cep = opcao = opcao.replace("[", "").replace("]", "").replace("\"", "");
		
		Endereco endereco = new Endereco();
		
		endereco = WebServiceCep.buscaCep(cep);
		
		PrintWriter out = response.getWriter();
		ObjectMapper mapper = new ObjectMapper();
		
		String json = mapper.writeValueAsString(endereco);
		json = "{\"endereco\":"+json+"}";
		System.out.println(json);
		out.println(json);
		
	}

}
