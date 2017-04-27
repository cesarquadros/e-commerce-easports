package br.com.ecommerceeasports.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControlePessoa() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao.equals("cadastrar")) {

			final Endereco endereco = new Endereco();
			

			

			// Coletando cada par�metro da p�gina atrav�s do "name" do
			// formul�rio,
			// utilizando o request.getParameter() e atribuindo � entidade
			// Endereco
			// atrav�s dos setters
			try {
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
				
				final Integer idEndereco = enderecoDAO.insertReturnID(endereco);
				
				Cliente cliente = new Cliente();
				
				cliente.setEmail(request.getParameter("email"));
				cliente.setSenha(request.getParameter("senha"));
				cliente.setNome(request.getParameter("email"));
				cliente.setCpf(request.getParameter("cpf"));
				cliente.setDataNascimento(ConverteData.stringToDate("19-07-1988"));
				cliente.setTelefone(request.getParameter("telefone"));
				cliente.setSexo(request.getParameter("sexo"));
				
				ClienteDAO clienteDAO = new ClienteDAO();
				
				clienteDAO.insert(cliente, idEndereco);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
