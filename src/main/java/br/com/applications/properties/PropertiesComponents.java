package br.com.applications.properties;

import java.util.HashMap;

public class PropertiesComponents {

	@SuppressWarnings("rawtypes")
	private static HashMap propsComponentes;
	public static PropertiesManager propertiesManager = new PropertiesManager();

	static {
		new PropertiesManager();

		propsComponentes = propertiesManager
				.readFileProperties("./props/swing.properties");
	}

	public static String loadString(String key) {
		String sql = null;
		sql = (String) propsComponentes.get(key);
		return sql;

	}
}
