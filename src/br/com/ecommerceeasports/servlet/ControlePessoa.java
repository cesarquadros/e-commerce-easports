package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.ecommerceeasports.util.Criptografia;
import br.com.ecommerceeasports.entities.Cliente;
import br.com.ecommerceeasports.entities.Endereco;
import br.com.ecommerceeasports.persistence.ClienteDAO;
import br.com.ecommerceeasports.persistence.EnderecoDAO;
import br.com.ecommerceeasports.util.ConverteData;

/**
 * Servlet implementation class ClienteServlet
 */
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

		if (acao.equals("cadastrar")) {

			final Endereco endereco = new Endereco();

			// Coletando cada parâmetro da página através do "name" do
			// formulário,
			// utilizando o request.getParameter() e atribuindo à entidade
			// Endereco
			// através dos setters
			try {
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

				final Integer idEndereco = enderecoDAO.insertReturnID(endereco);

				Cliente cliente = new Cliente();

				cliente.setEmail(request.getParameter("email"));
				cliente.setSenha(Criptografia.criptografar(request.getParameter("senha")));
				cliente.setNome(request.getParameter("nome"));
				cliente.setCpf(request.getParameter("cpf"));
				cliente.setDataNascimento(ConverteData.stringToDate(request.getParameter("datanasc")));
				cliente.setTelefone(request.getParameter("telefone"));
				cliente.setSexo(request.getParameter("sexo"));

				ClienteDAO clienteDAO = new ClienteDAO();

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
				request.setAttribute("mensagem", e.getMessage());
				
				
			} finally {

				request.getRequestDispatcher(destino).forward(request, response);
			}

		} else if (acao.equals("logout")) {
			
			final HttpSession session = request.getSession();

			session.invalidate();

			response.sendRedirect("/e-commerce-easports/index.jsp");
		}

	}

}
