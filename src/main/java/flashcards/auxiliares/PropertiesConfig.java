package main.java.flashcards.auxiliares;

import java.io.InputStream;
import java.util.Properties;

public class PropertiesConfig {
	
	private PropertiesConfig() {}
		
	public static String getProperties(String name) {
		return getValue(name);
	}
	
	private static String getValue(String name) {
		String property;
		try {
			Properties prop = new Properties();
		    InputStream inputStream = PropertiesConfig.class.getClassLoader().getResourceAsStream("conexionDB.properties");
		    prop.load(inputStream);
		    property =  prop.getProperty(name);
		    inputStream.close();
		} catch (Exception e) {
			property = "";
		}
		return property;
	}
	
	
}
