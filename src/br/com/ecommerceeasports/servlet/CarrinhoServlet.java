package br.com.ecommerceeasports.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.CountCarrinho;
import br.com.ecommerceeasports.entities.ItemCarrinho;
import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.CarrinhoDAO;
import br.com.ecommerceeasports.persistence.ProdutoDAO;

@WebServlet("/CarrinhoServlet")
public class CarrinhoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static HttpSession session;

	public CarrinhoServlet() {
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

	protected void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/plain");

		PrintWriter out = response.getWriter();
		StringBuilder sb = new StringBuilder();
		BufferedReader br = request.getReader();
		String str = null;

		while ((str = br.readLine()) != null) {
			sb.append(str);
		}

		String parametros[] = sb.toString().replace("[", "").replace("]", "").replace("\"", "").split(",");

		String acao = "";
		if (parametros.length >= 1 && !parametros[0].equals("")) {
			acao = parametros[1];
		} else {
			acao = request.getParameter("acao");
		}

		if (acao.equals("adicionar")) {

			Integer idProduto = Integer.parseInt(parametros[0]);
			ProdutoDAO produtoDAO = new ProdutoDAO();
			try {

				session = request.getSession();

				Produto produto = produtoDAO.findById(idProduto);
				Cliente cliente;
				ArrayList<ItemCarrinho> carrinho = null;
				if (session.getAttribute("usuarioLogado") == null) {
					out = response.getWriter();
					ObjectMapper mapper = new ObjectMapper();
					
					String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(carrinho);
					json = "{\"carrinho\":"+json+"}";
					
					out.println(json);
				} else {
					cliente = (Cliente) session.getAttribute("usuarioLogado");

					ItemCarrinho itemCarrinho = new ItemCarrinho();
					itemCarrinho.setCliente(cliente);
					itemCarrinho.setProduto(produto);

					CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
					carrinhoDAO.insert(itemCarrinho);
					carrinhoDAO = new CarrinhoDAO();
					carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());
					cliente.setListaItens(carrinho);
					
					out = response.getWriter();
					ObjectMapper mapper = new ObjectMapper();
					
					String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(carrinho);
					json = "{\"carrinho\":"+json+"}";
					
					out.println(json);
				}

			} catch (Exception e) {
				e.printStackTrace();
				out.println(e.toString());
			}

		} else if (acao.equals("carrinhobycli")) {

			session = request.getSession();

			Cliente cliente;

			if (session.getAttribute("usuarioLogado") == null) {
				try {
					request.getRequestDispatcher("login.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				}
			} else {
				cliente = (Cliente) session.getAttribute("usuarioLogado");

				CarrinhoDAO carrinhoDAO = new CarrinhoDAO();

				try {
					ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());
					cliente.setListaItens(carrinho);

					ArrayList<CountCarrinho> carrinhoCount = carrinhoDAO.countByBliente(cliente.getIdCliente());

					session.setAttribute("carrinhocount", carrinhoCount);

					request.setAttribute("carrinhoCount", carrinhoCount);
					request.setAttribute("cliente", cliente);
					request.getRequestDispatcher("carrinho.jsp").forward(request, response);

				} catch (Exception e) {
					System.out.println(e.toString());
				}
			}
		} else if (acao.equals("excluiritem")) {
			try {
				Integer idProduto = Integer.parseInt(parametros[0]);
				CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
				session = request.getSession();

				Cliente cliente = (Cliente) session.getAttribute("usuarioLogado");

				carrinhoDAO.excluirItem(idProduto, cliente.getIdCliente());
				
				session.setAttribute("usuarioLogado", cliente);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
