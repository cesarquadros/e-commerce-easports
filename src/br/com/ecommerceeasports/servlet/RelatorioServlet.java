package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ecommerceeasports.entities.Compra;
import br.com.ecommerceeasports.persistence.CompraDao;

@WebServlet("/RelatorioServlet")
public class RelatorioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RelatorioServlet() {
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

	protected void execute(HttpServletRequest request, HttpServletResponse response) {

		String acao = request.getParameter("acao");
		
		HttpSession session =  request.getSession();

		if (acao.equals("relatorioperiodo")) {
			try {
				String dataInicio = request.getParameter("datainicio");
				String dataFim = request.getParameter("datafim");

				CompraDao compraDao = new CompraDao();

				ArrayList<Compra> relatorioPeriodo = compraDao.relatorioPeriodo(dataInicio, dataFim);
				
				session.setAttribute("listacompras", relatorioPeriodo);
				response.sendRedirect("relatoriocompras.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
