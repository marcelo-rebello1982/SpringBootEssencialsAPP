package br.com.applications.properties;

import java.util.HashMap;

public class PropertiesSQL {

	@SuppressWarnings("rawtypes")
	private static HashMap propsCadastro;
	public static PropertiesManager propertiesManager = new PropertiesManager();

	static {
		new PropertiesManager();
		propsCadastro = propertiesManager
				.readFileProperties("./props/sql.properties");
	}

	public static String loadSQL(String key) {
		String sql = null;
		sql = (String) propsCadastro.get(key);
		return sql;

	}
}
