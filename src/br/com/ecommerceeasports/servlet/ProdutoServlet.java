package br.com.ecommerceeasports.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import br.com.ecommerceeasports.entities.Produto;
import br.com.ecommerceeasports.persistence.ProdutoDAO;


/**
 * Servlet implementation class ProdutoServlet
 */
@WebServlet("/ProdutoServlet")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdutoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}
	
	protected void execute (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String acao = request.getParameter("acao");
		
		if(acao.equals("cadastrar")){
			
			Produto produto = new Produto();

			ProdutoDAO produtoDao = new ProdutoDAO();

		produto.setNome(request.getParameter("nome"));
			produto.setPrecoCusto(Double.parseDouble(request.getParameter("precocusto").replaceAll(",", ".")));
			produto.setPrecoVenda(Double.parseDouble(request.getParameter("precovenda").replaceAll(",", ".")));
			produto.setCodigo(request.getParameter("codigo"));	
			Integer categoria = Integer.parseInt(request.getParameter("categoria"));
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------------------------
			UUID guid = UUID.randomUUID();

			produto.setImagem(guid.toString() + ".jpg");

			// upload...
			// resgatar o campo imagem (file)

			Part imagem = request.getPart("imagem"); // arquivo

			// definir o local onde o arquivo será salvo

			// Notebook Diego -> System.getProperty("user.home") +
			// "\\Desktop\\PI\\easports\\EASPORTS\\easports\\WebContent\\img";

			// String pasta = System.getProperty("user.home") +
			// "\\Desktop\\PI\\easports\\EASPORTS\\easports\\WebContent\\img";

			String pasta = System.getProperty("user.home") + "Desktop\\pi4\\e-commerce-easports\\WebContent\\img";
			//String pasta = System.getProperty("user.dir") + "\\tomcat\\webapps\\easports\\img";

			FileOutputStream stream = new FileOutputStream(pasta + "/" + produto.getImagem());

			InputStream input = imagem.getInputStream(); // lendo o
															// arquivo

			byte[] buffer = new byte[1024];

			while (input.read(buffer) > 0) {

				stream.write(buffer);

			}

			stream.close();
			//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
		}
		
	}

}
