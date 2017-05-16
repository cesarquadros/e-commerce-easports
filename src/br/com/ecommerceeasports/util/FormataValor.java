package br.com.ecommerceeasports.util;


import java.math.BigDecimal;
import java.text.NumberFormat;

public class FormataValor {
	
	public String valorFormatado(Double valor){
		
		BigDecimal bigDecimal = new BigDecimal (valor);  
		NumberFormat nf = NumberFormat.getCurrencyInstance();  
		String formatado = nf.format (bigDecimal);
		return formatado;
	}
}
