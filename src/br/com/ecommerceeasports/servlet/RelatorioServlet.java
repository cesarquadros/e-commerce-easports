package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ecommerceeasports.entities.Cliente;
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

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		HttpSession session = request.getSession();

		if (acao.equals("relatorioperiodo")) {
			try {
				String dataInicio = request.getParameter("datainicio");
				String dataFim = request.getParameter("datafim");

				CompraDao compraDao = new CompraDao();

				ArrayList<Compra> relatorioPeriodo = compraDao.relatorioPeriodo(dataInicio, dataFim);

				session.setAttribute("listacompras", relatorioPeriodo);
				response.sendRedirect("relatoriocompras.jsp");

			} catch (Exception e) {
				request.setAttribute("erro666", e.toString());
				request.getRequestDispatcher("paginaerro.jsp").forward(request, response);
			}
		} else if (acao.equals("relatorioperiodobycliente")) {
			session = request.getSession();

			Cliente cliente;

			if (session.getAttribute("usuarioLogado") == null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				try {
					cliente = (Cliente) session.getAttribute("usuarioLogado");

					String dataInicio = request.getParameter("datainicio");
					String dataFim = request.getParameter("datafim");

					CompraDao compraDao = new CompraDao();

					ArrayList<Compra> relatorioPeriodo = compraDao.relatorioPeriodoByCliente(dataInicio, dataFim, cliente.getIdCliente());
					
					session.setAttribute("listacompras", relatorioPeriodo);
					response.sendRedirect("relatoriocompracliente.jsp");
				} catch (Exception e) {
					request.setAttribute("erro666", e.toString());
					request.getRequestDispatcher("paginaerro.jsp").forward(request, response);
				}
			}
		}
	}
}
