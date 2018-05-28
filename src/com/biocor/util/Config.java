package com.biocor.util;

import java.io.InputStream;
import java.util.Properties;

public class Config {

	private static String fileName="config.properties";
	
	/**
	 * 多线程请求基地址
	 */
	public static String threadURL = "";
	
	
	static{
        try { 
            Properties prop = new Properties();    
            InputStream in =  Config.class.getClassLoader().getResourceAsStream(fileName);  
            prop.load(in);    
            threadURL = prop.getProperty("threadURL").trim();  
            
        } catch (Exception e) {  
            e.printStackTrace();
        }  
	}

	public static void main(String[] args){
		System.out.println(threadURL);
	}
	
}
