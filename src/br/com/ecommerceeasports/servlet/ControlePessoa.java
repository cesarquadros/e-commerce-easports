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
	public static HttpSession session;

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

		response.setContentType("text/plain");
		String acao = request.getParameter("acao");
		String page = request.getParameter("page");

		if (acao.equals("cadastrar")) {

			// Coletando cada par�metro da p�gina atrav�s do "name" do
			// formul�rio,
			// utilizando o request.getParameter() e atribuindo � entidade
			// Endereco
			// atrav�s dos setters
			try {

				final Endereco endereco = new Endereco();

				Cliente clienteCpf = new Cliente();
				Cliente clienteEmail = new Cliente();

				String cpf = request.getParameter("cpf");
				String email = request.getParameter("email");

				ClienteDAO clienteDAO = new ClienteDAO();

				clienteCpf = clienteDAO.findByCpf(cpf);
				clienteEmail = clienteDAO.findByEmail(email);

				if (clienteCpf != null && clienteEmail != null) {

					endereco.setLogradouro(request.getParameter("logradouro"));
					endereco.setNumero(Integer.parseInt(request.getParameter("numero")));
					endereco.setCep(request.getParameter("cep"));
					endereco.setBairro(request.getParameter("bairro"));
					endereco.setCidade(request.getParameter("cidade"));
					endereco.setEstado(request.getParameter("estado"));
					endereco.setComplemento(request.getParameter("complemento"));

					System.out.println(request.getParameter("logradouro"));
					// Instanciando a classe respons�el por gravar, alterar e
					// excluir Endere�os no banco

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
				}

				else {

					request.setAttribute("mensagemErro", "Cliente j� cadatrado.");
					request.getRequestDispatcher("cadastro.jsp").forward(request, response);

				}

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
					request.setAttribute("mensagem", "Usu�rio ou senha inv�lidos");
					// throw new Exception("Acesso negado, tente novamente.");
				}
			} catch (Exception e) {
				System.out.println(e.toString());
				request.setAttribute("mensagem", e.getMessage());

			} finally {
				request.getRequestDispatcher(destino).forward(request, response);
			}

		} else if (acao.equals("logout")) {

			final HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("/e-commerce-easports/index.jsp");

		} else if (acao.equals("updateendereco")) {

			try {
				session = request.getSession();

				Cliente cliente;

				if (session.getAttribute("usuarioLogado") == null) {

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

					request.setAttribute("cliente", cliente);
					request.setAttribute("valorTotal", valorTotalFormatado);
					request.setAttribute("quantidade", carrinho.size());
					request.setAttribute("carrinhocount", carrinhoCount);
					request.getRequestDispatcher(page + ".jsp").forward(request, response);
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
				cliente = (Cliente) session.getAttribute("usuarioLogado");
				request.setAttribute("cliente", cliente);
				request.getRequestDispatcher("minhaconta.jsp").forward(request, response);
			}
		} else if (acao.equals("update")) {

			try {
				Cliente clienteCpf = new Cliente();
				Cliente clienteEmail = new Cliente();

				String cpf = request.getParameter("cpf");
				String email = request.getParameter("email");

				ClienteDAO clienteDAO = new ClienteDAO();

				clienteCpf = clienteDAO.findByCpf(cpf);

				clienteEmail = clienteDAO.findByEmail(email);

				if (clienteCpf != null && clienteEmail != null) {
					
					Cliente cliente = new Cliente();
					ClienteDAO clienteDAO2 = new ClienteDAO();
										
					cliente.setEmail(request.getParameter("email"));
					cliente.setNome(request.getParameter("nome"));
					cliente.setCpf(request.getParameter("cpf"));
					cliente.setDataNascimento(ConverteData.stringToDate(request.getParameter("datanasc")));
					cliente.setTelefone(request.getParameter("telefone"));
					cliente.setSexo(request.getParameter("sexo"));
					clienteDAO.update(cliente);
					
					session.setAttribute("usuarioLogado", cliente);
					request.setAttribute("usuarioLogado", cliente);

					CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
					ArrayList<ItemCarrinho> carrinho = carrinhoDAO.itensPorCliente(cliente.getIdCliente());

					cliente.setListaItens(carrinho);

					ItemCarrinho itemCarrinho = new ItemCarrinho();

					FormataValor formataValor = new FormataValor();

					Double valorTotal = itemCarrinho.getValorTotal(carrinho);

					String valorTotalFormatado = formataValor.valorFormatado(valorTotal);
					ArrayList<CountCarrinho> carrinhoCount = carrinhoDAO.countByBliente(cliente.getIdCliente());

					request.setAttribute("cliente", cliente);
					request.setAttribute("valorTotal", valorTotalFormatado);
					request.setAttribute("quantidade", carrinho.size());
					request.setAttribute("carrinhocount", carrinhoCount);
					request.getRequestDispatcher(page + ".jsp").forward(request, response);
					
				} else {
					request.setAttribute("mensagemErro", "Cliente j� cadatrado.");
					request.getRequestDispatcher("minhaconta.jsp").forward(request, response);
				}
			} catch (Exception e) {
				
			}
		}
	}
}
