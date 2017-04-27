package br.com.ecommerceeasports.persistence;

import java.sql.*;

public class DAO {

	//private static final String DIRETORIO = "\\WebContent\\WEB-INF\\lib\\easports.db";
	private static final String DRIVER = "org.sqlite.JDBC";
	private static final String DATABASE = "jdbc:sqlite:";
	//private static final String URL = System.getProperty("user.dir") + "\\tomcat\\webapps\\easports";
	private static final String URL = System.getProperty("user.dir");
	private static final String BANCO = "\\e-commerce.db";

	protected Connection con;
	protected PreparedStatement stmt;
	protected ResultSet rs;

	public void abreConexao() throws Exception {

		Class.forName(DRIVER);

		if (con == null) {
			
			//COPIAR O ARQUIVO DO BANCO DE DADOS, LOCALIZADO NA PASTA RAIZ DO PROJETO, PARA A PASTA RAIZ DO ECLIPSE
			
			con = DriverManager.getConnection(DATABASE + URL + BANCO);

			//con = DriverManager.getConnection(DATABASE +"C:\\Users\\cquadros\\workspace\\EASPORTS\\easports\\WebContent\\WEB-INF\\lib\\easports.db");
			
		}
	}

	protected void fechaConexao() throws Exception {

		if (con != null) {

			con.close();

		}

	}
}
