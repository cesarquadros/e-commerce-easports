package br.com.easports.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComprarProdutoServlet")
public class ComprarProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ComprarProdutoServlet() {
        // TODO Auto-generated constructor stub
    }

    protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

}
