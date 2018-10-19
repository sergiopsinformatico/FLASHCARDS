package com.flashcards.auxiliares;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

public class DBConnection {
	
	private String endpoint;
	private Properties prop;
	private String nFile;
	private InputStream inputStream;
	
	public DBConnection() {
		activateFileProperties();
	}
	
	private void activateFileProperties() {
		try {
			prop = new Properties();
			nFile = "db.properties";
			inputStream = getClass().getClassLoader().getResourceAsStream(nFile);
			if(inputStream==null) {
				throw new FileNotFoundException("ERROR. File '"+nFile+"' not found.");
			}
			prop.load(inputStream);
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	public String dbEndpoint(String property) {
		searchEndpoint(property);
		return getEndpoint();
	}
	
	private void searchEndpoint(String property) {
		setEndpoint(prop.getProperty(property));
	}
	
	private String getEndpoint() {
		return this.endpoint;
	}
	
	private void setEndpoint(String eP) {
		this.endpoint = eP;
	}
	
}
