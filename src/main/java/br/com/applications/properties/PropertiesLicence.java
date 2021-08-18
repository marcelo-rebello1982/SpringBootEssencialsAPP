package br.com.applications.properties;

import java.util.HashMap;

public class PropertiesLicence {

	@SuppressWarnings("rawtypes")
	private static HashMap propsLicence;
	public static PropertiesManager propertiesManager = new PropertiesManager();

	static {
		new PropertiesManager();

		propsLicence = propertiesManager
				.readFileProperties("./props/licence.properties");
	}

	public static String loadString(String key) {
		String str = null;
		str = (String) propsLicence.get(key);
		return str;

	}
}
