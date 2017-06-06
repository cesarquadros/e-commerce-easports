package br.com.ecommerceeasports.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.ProdutoDAO;
import br.com.ecommerceeasports.util.FormataValor;

@WebServlet("/ProdutoServlet")
@MultipartConfig
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdutoServlet() {
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
		HttpSession session;

		if (acao.equals("cadastrar")) {

			try {
				Produto produto = new Produto();

				ProdutoDAO produtoDao = new ProdutoDAO();

				produto.setCodigo(request.getParameter("codigo"));
				produto.setNome(request.getParameter("nome"));
				produto.setPrecoCusto(Double.parseDouble(request.getParameter("precocusto").replaceAll(",", ".")));
				produto.setPrecoVenda(Double.parseDouble(request.getParameter("precovenda").replaceAll(",", ".")));
				produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
				Integer codCategoria = Integer.parseInt(request.getParameter("categoria"));

				produto.setOrigem(request.getParameter("origem"));
				produto.setDimensoes(request.getParameter("dimensoes"));
				produto.setPeso(request.getParameter("peso"));
				produto.setGarantia(request.getParameter("garantia"));
				produto.setDescricao(request.getParameter("descricao"));

				// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
				UUID guid = UUID.randomUUID();

				produto.setImagem(guid.toString() + ".jpg");

				// upload...
				// resgatar o campo imagem (file)

				Part imagem = request.getPart("img"); // arquivo

				// definir o local onde o arquivo será salvo

				String pasta = System.getProperty("user.home") + "\\git\\e-commerce-easports\\WebContent\\img";
				// String pasta = System.getProperty("user.dir") +
				// "\\tomcat\\webapps\\easports\\img";

				FileOutputStream stream = new FileOutputStream(pasta + "/" + produto.getImagem());

				InputStream input = imagem.getInputStream(); // lendo o

				byte[] buffer = new byte[1024];

				while (input.read(buffer) > 0) {
					stream.write(buffer);
				}

				stream.close();
				// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

				produtoDao.insert(produto, codCategoria);

				session = request.getSession();
				session.setAttribute("titulo", "Cadastro de Produtos");
				session.setAttribute("mensagem","Produto " + produto.getNome().toUpperCase() + " cadastrado com sucesso");
				session.setAttribute("modal", 1);

				response.sendRedirect("cadastroproduto.jsp");
			} catch (Exception e) {
				session = request.getSession();
				session.setAttribute("titulo", "Cadastro de Produtos");
				session.setAttribute("mensagem", "OPS! Ocorreu o erro:");
				session.setAttribute("erro", e.toString());
				session.setAttribute("modal", 1);

				response.sendRedirect("cadastroproduto.jsp");
			}
		} else if (acao.equals("findById")) {

			Produto produto;
			ProdutoDAO p = new ProdutoDAO();
			Integer idProduto = Integer.parseInt(request.getParameter("id"));

			try {
				produto = p.findById(idProduto);

				request.setAttribute("produto", produto);
				request.getRequestDispatcher("detalheproduto.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (acao.equals("paginaeditar")) {

			Produto produto;
			ProdutoDAO p = new ProdutoDAO();
			Integer idProduto = Integer.parseInt(request.getParameter("id"));

			try {
				FormataValor format = new FormataValor();
				produto = p.findById(idProduto);
				produto.setValorCustoFormatado(format.valorCasaDecimal(produto.getPrecoCusto()));
				produto.setValorVendaFormatado(format.valorCasaDecimal(produto.getPrecoVenda()));
				
				request.setAttribute("produto", produto);
				request.getRequestDispatcher("editarproduto.jsp").forward(request, response);

			} catch (Exception e) {
				session = request.getSession();
				session.setAttribute("titulo", "Editar Produtos");
				session.setAttribute("mensagem", "OPS! Ocorreu o erro:");
				session.setAttribute("erro", e.toString());
				session.setAttribute("modal", 1);

				response.sendRedirect("indexbackoffice.jsp");
				e.printStackTrace();
			}
		} else if (acao.equals("editarproduto")) {
			try {
				Produto produto = new Produto();

				produto.setIdProduto(Integer.parseInt(request.getParameter("idProduto")));
				produto.setNome(request.getParameter("nome"));
				produto.setPrecoCusto(Double.parseDouble(request.getParameter("precocusto").replaceAll(",", ".")));
				produto.setPrecoVenda(Double.parseDouble(request.getParameter("precovenda").replaceAll(",", ".")));
				produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
				Integer idCategoria = Integer.parseInt(request.getParameter("categoria"));

				produto.setOrigem(request.getParameter("origem"));
				produto.setDimensoes(request.getParameter("dimensoes"));
				produto.setPeso(request.getParameter("peso"));
				produto.setGarantia(request.getParameter("garantia"));
				produto.setDescricao(request.getParameter("descricao"));

				ProdutoDAO produtoDAO = new ProdutoDAO();

				produtoDAO.update(produto, idCategoria);
				
				session = request.getSession();
				session.setAttribute("titulo", "Editar Produtos");
				session.setAttribute("mensagem",produto.getNome().toUpperCase() + " \n alterada com sucesso");
				session.setAttribute("modal", 1);

				response.sendRedirect("indexbackoffice.jsp");
				
			} catch (Exception e) {
				session = request.getSession();
				session.setAttribute("titulo", "Editar Produtos");
				session.setAttribute("mensagem", "OPS! Ocorreu o erro:");
				session.setAttribute("erro", e.toString());
				session.setAttribute("modal", 1);

				response.sendRedirect("indexbackoffice.jsp");
				e.printStackTrace();
			}
		}
	}
}
