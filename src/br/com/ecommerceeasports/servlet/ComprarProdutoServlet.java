package br.com.ecommerceeasports.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.glass.ui.Pixels.Format;

import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.ItemCarrinho;
import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.CarrinhoDAO;
import br.com.ecommerceeasports.persistence.ProdutoDAO;
import br.com.ecommerceeasports.util.FormataValor;

@WebServlet("/ComprarProdutoServlet")
public class ComprarProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static HttpSession session;

	public ComprarProdutoServlet() {
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
		
		if(acao.equals("finalizarbyid")){
			
			session = request.getSession();

			Cliente cliente;
			
			if (session.getAttribute("usuarioLogado") == null) {
				
			} else {
				cliente = (Cliente) session.getAttribute("usuarioLogado");
				
				CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
				
				try {
				ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());
				
				cliente.setListaItens(carrinho);
				
				ItemCarrinho itemCarrinho = new ItemCarrinho();
				
				FormataValor formataValor = new FormataValor();
				
				
				Double valorTotal = itemCarrinho.getValorTotal(carrinho);
				
				String valorTotalFormatado = formataValor.valorFormatado(valorTotal);
				
				request.setAttribute("cliente", cliente);
				request.setAttribute("valorTotal", valorTotalFormatado);
				request.setAttribute("quantidade", carrinho.size());
				request.getRequestDispatcher("finalizarcompra.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
