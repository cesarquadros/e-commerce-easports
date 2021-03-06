package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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
import br.com.ecommerceeasports.entities.Compra;
import br.com.ecommerceeasports.entities.CountCarrinho;
import br.com.ecommerceeasports.entities.ItemCarrinho;
import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.CarrinhoDAO;
import br.com.ecommerceeasports.persistence.CartaoDAO;
import br.com.ecommerceeasports.persistence.ClienteDAO;
import br.com.ecommerceeasports.persistence.CompraDao;
import br.com.ecommerceeasports.persistence.ProdutoDAO;
import br.com.ecommerceeasports.util.ConverteData;
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

		if (acao.equals("finalizarbyid")) {

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

					carrinhoDAO = new CarrinhoDAO();

					ArrayList<CountCarrinho> carrinhoCount = carrinhoDAO.countByBliente(cliente.getIdCliente());
					
					session.setAttribute("carrinhocount", carrinhoCount);
					
					request.setAttribute("cliente", cliente);
					request.setAttribute("valorTotalFormatado", valorTotalFormatado);
					request.setAttribute("valorTotal", valorTotal);
					request.setAttribute("quantidade", carrinho.size());
					request.setAttribute("carrinhocount", carrinhoCount);
					request.getRequestDispatcher("finalizarcompra.jsp").forward(request, response);

				} catch (Exception e) {
					request.setAttribute("erro666", e.toString());
					request.getRequestDispatcher("paginaerro.jsp").forward(request, response);
				}
			}
		} else if (acao.equals("comprar")) {
			
			session = request.getSession();

			Cliente cliente;

			if (session.getAttribute("usuarioLogado") == null) {

			} else {
				cliente = (Cliente) session.getAttribute("usuarioLogado");

				try {

					ArrayList<ItemCarrinho> listItem = cliente.getListaItens();

					Compra compra = new Compra();
					String formaPagamento = request.getParameter("formapagamento");

					compra.setDataCompra(ConverteData.getDataAtual());
					compra.setParcelas(Integer.parseInt(request.getParameter("parcelas")));
					compra.setNumProtocolo(ConverteData.getNumProtocolo()+ cliente.getIdCliente());
					CompraDao compraDao = new CompraDao();
					
					int idCompra = 0;
					
					if(formaPagamento.equals("boleto")){
						compra.setTipoPagamento("BOLETO");
						idCompra = compraDao.compraBoleto(compra);	
					} else {
						compra.setTipoPagamento("CART�O");
						idCompra = compraDao.compraCartao(compra, cliente.getCartao().getIdCartao());
					}					

					for (int i = 0; i < listItem.size(); i++) {

						CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
						carrinhoDAO.finalizarItem(listItem.get(i).getIdItem(), idCompra);
					}
					
					ArrayList<CountCarrinho> carrinhoCount = (ArrayList<CountCarrinho>) session.getAttribute("carrinhocount");
					
					ProdutoDAO produtoDAO = new ProdutoDAO();
					for (int i = 0; i < carrinhoCount.size(); i++) {
						produtoDAO.updateQtd(carrinhoCount.get(i).getProduto(), carrinhoCount.get(i).getQuantidade());
						
					}

					compraDao = new CompraDao();

					ArrayList<Compra> listaCompras = compraDao.listCompraFinalizadas();
					request.setAttribute("listacompras", listaCompras);

					ClienteDAO clienteDAO = new ClienteDAO();
					cliente = clienteDAO.findById(cliente.getIdCliente());

					session.setAttribute("usuarioLogado", cliente);
					session.setAttribute("usuarioLogado", cliente);
					
					session.setAttribute("protocolo", compra.getNumProtocolo());
					session.setAttribute("carrinhocount", session.getAttribute("carrinhocount"));
					session.setAttribute("cliente", cliente);
					response.sendRedirect("confirmacaocompra.jsp");
				} catch (Exception e) {
					request.setAttribute("erro666", e.toString());
					request.getRequestDispatcher("paginaerro.jsp").forward(request, response);
				}
			}
		} else if (acao.equals("listacompra")) {

			session = request.getSession();

			Cliente cliente;

			if (session.getAttribute("usuarioLogado") == null) {

			} else {
				try {
					cliente = (Cliente) session.getAttribute("usuarioLogado");
					CompraDao compraDao = new CompraDao();
					ArrayList<Compra> listaCompras;
					listaCompras = compraDao.listCompraFinalizadas();
					request.setAttribute("listacompras", listaCompras);
					request.getRequestDispatcher("comprasfinalizadas.jsp").forward(request, response);
				} catch (Exception e) {
					request.setAttribute("erro666", e.toString());
					request.getRequestDispatcher("paginaerro.jsp").forward(request, response);
				}

			}
		}
	}
}
