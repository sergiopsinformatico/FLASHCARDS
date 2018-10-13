package com.flashcards.auxiliares;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ReadDBProperties {
	
	private Properties prop;
	private InputStream inputStream;
	private String file;
	private Resource resource;
	
	public ReadDBProperties() {
		setFile("resources/db.properties");
		chargeFile();
	}
	
	private void chargeFile() {
		try {
			resource = new ClassPathResource(getFile());
			inputStream = resource.getInputStream();
			prop = new Properties(); 
			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + getFile() + "' not found in the classpath");
			}
		}catch(Exception ex) {
			ex.getMessage();
		}
	}
	
	public String getProperty(String property) {
		return prop.getProperty(property);
	}
	
	private void setFile(String nFile) {
		this.file = nFile;
	}
	
	private String getFile() {
		return this.file;
	}
}
