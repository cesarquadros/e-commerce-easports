package br.com.ecommerceeasports.util;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConverteData {
	
	public static Date stringToDate(String data) { 
 		if (data == null || data.equals(""))
 			return null;
         Date date = null;
         try {
             SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
             date = formatter.parse(data);
         } catch (Exception e) {  
        	 SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
             try {
				date = formatter.parse(data);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
             e.printStackTrace();
         }
         return date;
 	}
	
	public static String dateToString(Date data) { 
 		if (data == null || data.equals(""))
 			return null;
         String dataString = null;
         try {
        	 Format formatter = new SimpleDateFormat("dd-MM-yyyy");
        	 dataString = formatter.format(data);
         } catch (Exception e) {            
        	 e.printStackTrace();
         }
         return dataString;
 	}
	
	public static Date getDataAtual() throws ParseException {        
	    SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
	    Date dataAtual = new Date();
	    String data = sd.format(dataAtual);
	    Date dataDate = sd.parse(data);
	    return dataDate;
	}

}
