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
import br.com.ecommerceeasports.persistence.ClienteDAO;

@WebServlet("/ValidaCpf")
public class ValidaCpf extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ValidaCpf() {
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
		String cpf = opcao = opcao.replace("[", "").replace("]", "").replace("\"", "");
		
		ClienteDAO clienteDAO = new ClienteDAO();
		Cliente clienteCpf = clienteDAO.findByCpf(cpf);
		
		PrintWriter out = response.getWriter();
		
		if(clienteCpf != null){
			out.println("ERRO");
		}
	}
}
