package br.com.ecommerceeasports.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.ecommerceeasports.entities.Categoria;
import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.CategoriaDAO;
import br.com.ecommerceeasports.persistence.ProdutoDAO;

/**
 * Servlet implementation class ProdutoServlet
 */
@WebServlet("/ProdutoServlet")
@MultipartConfig
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProdutoServlet() {
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

		Part temp = request.getPart("nome");

		if (acao.equals("cadastrar")) {

			try {
				Produto produto = new Produto();

				ProdutoDAO produtoDao = new ProdutoDAO();

				produto.setNome(request.getParameter("nome"));
				produto.setPrecoCusto(Double.parseDouble(request.getParameter("precocusto").replaceAll(",", ".")));
				produto.setPrecoVenda(Double.parseDouble(request.getParameter("precovenda").replaceAll(",", ".")));
				produto.setCodigo(request.getParameter("codigo"));
				Integer codCategoria = Integer.parseInt(request.getParameter("categoria"));

				// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
				UUID guid = UUID.randomUUID();

				produto.setImagem(guid.toString() + ".jpg");

				// upload...
				// resgatar o campo imagem (file)

				Part imagem = request.getPart("img"); // arquivo

				// definir o local onde o arquivo será salvo

				// Notebook Diego -> System.getProperty("user.home") +
				// "\\Desktop\\PI\\easports\\EASPORTS\\easports\\WebContent\\img";

				// String pasta = System.getProperty("user.home") +
				// "\\Desktop\\PI\\easports\\EASPORTS\\easports\\WebContent\\img";

				String pasta = System.getProperty("user.home") + "\\Desktop\\pi4\\e-commerce-easports\\WebContent\\img";
				// String pasta = System.getProperty("user.dir") +
				// "\\tomcat\\webapps\\easports\\img";

				FileOutputStream stream = new FileOutputStream(pasta + "/" + produto.getImagem());

				InputStream input = imagem.getInputStream(); // lendo o
																// arquivo

				byte[] buffer = new byte[1024];

				while (input.read(buffer) > 0) {

					stream.write(buffer);

				}

				stream.close();
				// -------------------------------------------------------------------------------------------------------------------------------------------------------------------


				produtoDao.insert(produto, codCategoria);
				
				request.setAttribute("titulo", "Cadastro de Produtos");
				request.setAttribute("mensagem", "Produto " + produto.getNome().toUpperCase() + " cadastrado com sucesso");
				request.setAttribute("imagem", produto.getImagem());
				request.setAttribute("modal", 1);
				
				request.getRequestDispatcher("cadastroproduto.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (acao.equals("find")){
			
			List<Produto> listagemProdutos;
			ProdutoDAO p = new ProdutoDAO();
			
			try {
				listagemProdutos = p.listAll();
								
				ObjectMapper mapper = new ObjectMapper();
				
				String json = mapper.writeValueAsString(listagemProdutos);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

	}

}
