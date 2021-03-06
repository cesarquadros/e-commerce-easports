package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ecommerceeasports.entities.Cartao;
import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.CountCarrinho;
import br.com.ecommerceeasports.entities.ItemCarrinho;
import br.com.ecommerceeasports.persistence.CarrinhoDAO;
import br.com.ecommerceeasports.persistence.CartaoDAO;
import br.com.ecommerceeasports.persistence.ClienteDAO;
import br.com.ecommerceeasports.util.ConverteData;
import br.com.ecommerceeasports.util.FormataValor;

@WebServlet("/CartaoServlet")
public class CartaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static HttpSession session;

	public CartaoServlet() {
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
		String page = request.getParameter("page");

		if (acao.equals("insert")) {
			
			try {

				session = request.getSession();
				Cliente cliente = null;
				
				if (session.getAttribute("usuarioLogado") == null) {

				} else {

					cliente = (Cliente) session.getAttribute("usuarioLogado");
					
					Cartao cartao = new Cartao();

					cartao.setNumero(request.getParameter("numero"));
					cartao.setNomeImpresso(request.getParameter("nome"));
					cartao.setValidade(request.getParameter("data"));
					cartao.setCodigoSeguranca(Integer.parseInt(request.getParameter("codigo")));

					CartaoDAO cartaoDAO = new CartaoDAO();
					
					int idCartao = cartaoDAO.inserir(cartao);
					
					cartao.setIdCartao(idCartao);
					
					ClienteDAO clienteDAO = new ClienteDAO();
					
					clienteDAO.updateCartao(cliente.getIdCliente(), idCartao);
					cliente.setCartao(cartao);
					
					session.setAttribute("usuarioLogado", cliente);
					request.setAttribute("usuarioLogado", cliente);
					
					

					CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
					ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());
					ItemCarrinho itemCarrinho = new ItemCarrinho();
					
					FormataValor formataValor = new FormataValor();

					Double valorTotal = itemCarrinho.getValorTotal(cliente.getListaItens());

					String valorTotalFormatado = formataValor.valorFormatado(valorTotal);
					ArrayList<CountCarrinho> carrinhoCount = carrinhoDAO.countByBliente(cliente.getIdCliente());
					
					session.setAttribute("usuarioLogado", cliente);
					request.setAttribute("usuarioLogado", cliente);
					
					request.setAttribute("cliente", cliente);
					request.setAttribute("valorTotalFormatado", valorTotalFormatado);
					request.setAttribute("valorTotal", valorTotal);
					request.setAttribute("quantidade", carrinho.size());
					request.setAttribute("carrinhocount", carrinhoCount);
					
					request.getRequestDispatcher(page+".jsp").forward(request, response);
					
				}
			} catch (Exception e) {
				request.setAttribute("erro666", e.toString());
				request.getRequestDispatcher("paginaerro.jsp").forward(request, response);
			}
		} else if (acao.equals("update")) {
			try {

				session = request.getSession();

				Cliente cliente;

				if (session.getAttribute("usuarioLogado") == null) {
					request.getRequestDispatcher("login.jsp").forward(request, response);
				} else {

					Cartao cartao = new Cartao();
					cliente = (Cliente) session.getAttribute("usuarioLogado");

					CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
					ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());
					carrinhoDAO = new CarrinhoDAO();
					cartao.setNumero(request.getParameter("numero"));
					cartao.setNomeImpresso(request.getParameter("nome"));
					cartao.setValidade(request.getParameter("data"));
					cartao.setCodigoSeguranca(Integer.parseInt(request.getParameter("codigo")));
					cartao.setIdCartao(cliente.getCartao().getIdCartao());

					CartaoDAO cartaoDAO = new CartaoDAO();

					cartaoDAO.update(cartao);

					cliente.setCartao(cartao);

					ItemCarrinho itemCarrinho = new ItemCarrinho();

					FormataValor formataValor = new FormataValor();

					Double valorTotal = itemCarrinho.getValorTotal(cliente.getListaItens());

					String valorTotalFormatado = formataValor.valorFormatado(valorTotal);
					ArrayList<CountCarrinho> carrinhoCount = carrinhoDAO.countByBliente(cliente.getIdCliente());

					request.setAttribute("cliente", cliente);
					request.setAttribute("valorTotalFormatado", valorTotalFormatado);
					request.setAttribute("valorTotal", valorTotal);
					request.setAttribute("quantidade", carrinho.size());
					request.setAttribute("carrinhocount", carrinhoCount);
					session.setAttribute("mensagem", "Dados alterados com sucesso");
					session.setAttribute("modal", "1");
					request.getRequestDispatcher(page+".jsp").forward(request, response);
				}

			} catch (Exception e) {
				request.setAttribute("erro666", e.toString());
				request.getRequestDispatcher("paginaerro.jsp").forward(request, response);
			}
		}
	}

}
