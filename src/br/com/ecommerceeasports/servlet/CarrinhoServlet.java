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
import br.com.ecommerceeasports.entities.Cliente;
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
				if (session.getAttribute("usuarioLogado") == null) {

				} else {
					cliente = (Cliente) session.getAttribute("usuarioLogado");

					ItemCarrinho itemCarrinho = new ItemCarrinho();
					itemCarrinho.setCliente(cliente);
					itemCarrinho.setProduto(produto);

					CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
					carrinhoDAO.insert(itemCarrinho);
					carrinhoDAO = new CarrinhoDAO();
					ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());
					cliente.setListaItens(carrinho);
					out.println("OK");

				}

			} catch (Exception e) {				
				e.printStackTrace();
				out.println(e.toString());
			}
		
		} else if (acao.equals("carrinhobycli")) {

			session = request.getSession();

			Cliente cliente;
			
			if (session.getAttribute("usuarioLogado") == null) {
				
			} else {
				cliente = (Cliente) session.getAttribute("usuarioLogado");
				
				CarrinhoDAO carrinhoDAO = new CarrinhoDAO();

				try {
					ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());
					cliente.setListaItens(carrinho);
					
					request.setAttribute("cliente", cliente);
					request.getRequestDispatcher("carrinho.jsp").forward(request, response);	
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
			}	
		} else if (acao.equals("excluiritem")) {
			try {
			Integer idItem = Integer.parseInt(parametros[0]);
			CarrinhoDAO carrinhoDAO = new CarrinhoDAO();			
			
				carrinhoDAO.excluirItem(idItem);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
}
