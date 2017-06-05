package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ecommerceeasports.util.Criptografia;
import br.com.ecommerceeasports.util.FormataValor;
import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.CountCarrinho;
import br.com.ecommerceeasports.entities.Endereco;
import br.com.ecommerceeasports.entities.ItemCarrinho;
import br.com.ecommerceeasports.persistence.CarrinhoDAO;
import br.com.ecommerceeasports.persistence.ClienteDAO;
import br.com.ecommerceeasports.persistence.EnderecoDAO;
import br.com.ecommerceeasports.util.ConverteData;

@WebServlet("/ClienteServlet")
public class ControlePessoa extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControlePessoa() {
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

		HttpSession session;
		response.setContentType("text/plain");
		String acao = request.getParameter("acao");
		String page = request.getParameter("page");

		if (acao.equals("cadastrar")) {

			// Coletando cada parâmetro da página através do "name" do
			// formulário,
			// utilizando o request.getParameter() e atribuindo à entidade
			// Endereco
			// através dos setters
			try {

				final Endereco endereco = new Endereco();

				Cliente clienteCpf = new Cliente();
				Cliente clienteEmail = new Cliente();

				String cpf = request.getParameter("cpf");
				String email = request.getParameter("email");

				ClienteDAO clienteDAO = new ClienteDAO();
				clienteEmail = clienteDAO.findByEmail(email);
				clienteCpf = clienteDAO.findByCpf(cpf);


					endereco.setLogradouro(request.getParameter("logradouro"));
					endereco.setNumero(Integer.parseInt(request.getParameter("numero")));
					endereco.setCep(request.getParameter("cep"));
					endereco.setBairro(request.getParameter("bairro"));
					endereco.setCidade(request.getParameter("cidade"));
					endereco.setEstado(request.getParameter("estado"));
					endereco.setComplemento(request.getParameter("complemento"));

					System.out.println(request.getParameter("logradouro"));
					// Instanciando a classe responsáel por gravar, alterar e
					// excluir Endereços no banco

					EnderecoDAO enderecoDAO = new EnderecoDAO();

					Cliente cliente = new Cliente();

					final Integer idEndereco = enderecoDAO.insertReturnID(endereco);

					cliente.setEmail(request.getParameter("email"));
					cliente.setSenha(Criptografia.criptografar(request.getParameter("senha")));
					cliente.setNome(request.getParameter("nome"));
					cliente.setCpf(request.getParameter("cpf"));
					cliente.setDataNascimento(ConverteData.stringToDate(request.getParameter("datanasc")));
					cliente.setTelefone(request.getParameter("telefone"));
					cliente.setSexo(request.getParameter("sexo"));

					clienteDAO.insert(cliente, idEndereco);

					request.setAttribute("modal", "1");
					request.setAttribute("titulo", "BEM VINDO!");
					request.setAttribute("mensagem", "Cadastro efetuado com sucesso!");
					request.setAttribute("retorno", cliente.getNome());
					request.getRequestDispatcher("login.jsp").forward(request, response);

			} catch (Exception e) {
				request.setAttribute("modal", "1");
				request.setAttribute("titulo", "OPS! Ocorreu um erro");
				request.setAttribute("mensagem", e.toString());
				request.getRequestDispatcher("login.jsp").forward(request, response);
				e.printStackTrace();
			}

		} else if (acao.equals("autenticar")) {

			String destino = "login.jsp";
			try {
				final String email = request.getParameter("email");
				final String senha = request.getParameter("senha");

				String senhaCriptografada = Criptografia.criptografar(senha);
				final ClienteDAO clienteDAO = new ClienteDAO();
				final Cliente cliente = clienteDAO.findByLogin(email, senhaCriptografada);

				if (cliente != null) {

					session = request.getSession();
					session.setAttribute("usuarioLogado", cliente);
					request.setAttribute("usuarioLogado", cliente);
					destino = "index.jsp";

				} else {
					request.setAttribute("mensagem", "Usuário ou senha inválidos");
					// throw new Exception("Acesso negado, tente novamente.");
				}
			} catch (Exception e) {
				System.out.println(e.toString());
				request.setAttribute("mensagem", e.getMessage());

			} finally {
				request.getRequestDispatcher(destino).forward(request, response);
			}

		} else if (acao.equals("logout")) {

			session = request.getSession();
			session.invalidate();
			response.sendRedirect("/e-commerce-easports/index.jsp");

		} else if (acao.equals("updateendereco")) {

			try {
				session = request.getSession();

				Cliente cliente;

				if (session.getAttribute("usuarioLogado") == null) {
					request.getRequestDispatcher("login.jsp").forward(request, response);
				} else {

					cliente = (Cliente) session.getAttribute("usuarioLogado");

					CarrinhoDAO carrinhoDAO = new CarrinhoDAO();

					final Endereco endereco = new Endereco();
					endereco.setLogradouro(request.getParameter("logradouro"));
					endereco.setNumero(Integer.parseInt(request.getParameter("numero")));
					endereco.setCep(request.getParameter("cep"));
					endereco.setBairro(request.getParameter("bairro"));
					endereco.setCidade(request.getParameter("cidade"));
					endereco.setEstado(request.getParameter("estado"));
					endereco.setComplemento(request.getParameter("complemento"));
					endereco.setIdEndereco(cliente.getEndereco().getIdEndereco());

					EnderecoDAO enderecoDAO = new EnderecoDAO();

					enderecoDAO.update(endereco);

					cliente.setEndereco(endereco);

					session.setAttribute("usuarioLogado", cliente);
					request.setAttribute("usuarioLogado", cliente);

					ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());

					cliente.setListaItens(carrinho);

					ItemCarrinho itemCarrinho = new ItemCarrinho();

					FormataValor formataValor = new FormataValor();

					Double valorTotal = itemCarrinho.getValorTotal(carrinho);

					String valorTotalFormatado = formataValor.valorFormatado(valorTotal);
					ArrayList<CountCarrinho> carrinhoCount = carrinhoDAO.countByBliente(cliente.getIdCliente());

					session.setAttribute("cliente", cliente);
					session.setAttribute("valorTotal", valorTotalFormatado);
					session.setAttribute("quantidade", carrinho.size());
					session.setAttribute("carrinhocount", carrinhoCount);

					if (page.equals("minhaconta")) {
						session.setAttribute("mensagem", "Editado com sucesso");
						session.setAttribute("modal", "1");
					}
					response.sendRedirect(page + ".jsp");

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (acao.equals("minhaconta")) {

			session = request.getSession();

			Cliente cliente;

			if (session.getAttribute("usuarioLogado") == null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {
				try {
					cliente = (Cliente) session.getAttribute("usuarioLogado");
					ClienteDAO clienteDAO = new ClienteDAO();
					cliente = clienteDAO.findByCpf(cliente.getCpf());
					session.setAttribute("cliente", cliente);
					response.sendRedirect("minhaconta.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else if (acao.equals("update")) {

			try {

				ClienteDAO clienteDAO = new ClienteDAO();
				Cliente cliente = new Cliente();
				session = request.getSession();
				cliente = (Cliente) session.getAttribute("usuarioLogado");

				/*
				 * cliente.setEmail(request.getParameter("email"));
				 * cliente.setNome(request.getParameter("nome"));
				 * cliente.setCpf(request.getParameter("cpf"));
				 * cliente.setDataNascimento(ConverteData.stringToDate(request.
				 * getParameter("datanasc")));
				 * cliente.setSexo(request.getParameter("sexo"));
				 */
				cliente.setTelefone(request.getParameter("telefone"));
				clienteDAO.update(cliente);

				clienteDAO = new ClienteDAO();

				cliente = clienteDAO.findByCpf(cliente.getCpf());

				CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
				ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());

				cliente.setListaItens(carrinho);

				ItemCarrinho itemCarrinho = new ItemCarrinho();

				FormataValor formataValor = new FormataValor();

				Double valorTotal = itemCarrinho.getValorTotal(carrinho);

				String valorTotalFormatado = formataValor.valorFormatado(valorTotal);
				ArrayList<CountCarrinho> carrinhoCount = carrinhoDAO.countByBliente(cliente.getIdCliente());

				session.setAttribute("usuarioLogado", cliente);

				session.setAttribute("cliente", cliente);
				session.setAttribute("mensagem", "Dados alterados com sucesso");
				session.setAttribute("modal", "1");
				response.sendRedirect(page + ".jsp");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.toString());
				System.out.println(e.getMessage());
			}
		} else if (acao.equals("comprasbycliente")) {
			session = request.getSession();

			Cliente cliente;

			if (session.getAttribute("usuarioLogado") == null) {
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} else {

				request.getRequestDispatcher("relatoriocompracliente.jsp").forward(request, response);
			}
		}
	}
}
