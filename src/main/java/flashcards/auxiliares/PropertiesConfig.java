package main.java.flashcards.auxiliares;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;

public class PropertiesConfig {
	
	private PropertiesConfig() {}
	
	@Value("file")
	final private static String filePath="filePath";
	
	public static String getProperties(String name) {
		return getValue(name);
	}
	
	private static String getValue(String name) {
		String property;
		try {
			Properties prop = new Properties();
		    InputStream inputStream = new FileInputStream(filePath);
		    prop.load(inputStream);
		    property =  prop.getProperty(name);
		    inputStream.close();
		} catch (Exception e) {
			property = "";
		}
		return property;
	}
	
	
}
