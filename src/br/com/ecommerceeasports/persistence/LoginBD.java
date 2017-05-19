package br.com.ecommerceeasports.persistence;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class LoginBD {

	static String[] loginBd(){
		
		String caminho = System.getProperty("user.dir");
		String path = (caminho+"\\bd\\loginBD.txt");
		String vetor[] = new String[2];
		try {
			BufferedReader leitor = new BufferedReader(new FileReader(path));			
			vetor[0]= leitor.readLine();
			vetor[1]= leitor.readLine();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vetor;		
	}
}
