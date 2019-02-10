package main.java.flashcards.auxiliares;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesConfig {
	
	public static String getProperties(String name) {
		return getValue(name);
	}
	
	private static String getValue(String name) {
		String property;
		try {
			Properties prop = new Properties();
			File initialFile = new File("src/main/resources/conexionDB.properties");
		    InputStream inputStream = new FileInputStream(initialFile);
		    prop.load(inputStream);
		    property =  prop.getProperty(name);
		    inputStream.close();
		} catch (Exception e) {
			property = "";
		}
		return property;
	}
	
	
}
