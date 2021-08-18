package br.com.applications.properties;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

public class PropertiesManager {

	private String fileName;
	private PropertiesManager properties;

	public PropertiesManager() {
		super();


	}

	public PropertiesManager(String fileName) {
		this.fileName = fileName;
	}

	public void createFileProperties(HashMap<?, ?> data) throws IOException {

		Properties props = new Properties();
		Set<?> values = data.entrySet();
		Iterator<?> it = values.iterator();

		while (it.hasNext()) {

			Map.Entry me = (Map.Entry) it.next();
			String chave = (String) me.getKey();
			String valor = (String) me.getValue();
			props.setProperty(chave, valor);
		}

		FileOutputStream out = new FileOutputStream(fileName);
		props.store(out, null);
		out.close();
	}

	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	public HashMap readFileProperties(String filename) {

		Properties properties;
		StringTokenizer sToken;
		HashMap lista = new HashMap();
		int count = 0;

		// InputStream is = getClass().getResourceAsStream(nomeDoArquivo);

		FileInputStream file;
		try {
			file = new FileInputStream(filename);
			properties = new Properties();
			properties.load(file);

			for (Enumeration list = properties.propertyNames(); list.hasMoreElements(); count++) {
				String input = (String) list.nextElement();
				lista.put(input, properties.getProperty(input));
			}
		} catch (FileNotFoundException e) {
		} catch (IOException e) {
			e.printStackTrace();
		}

		return lista;
	}

	public void WriteProperty(String file, String property, String value) {
		Properties p = PropertiesManager.Read(file);
		try {
			p.setProperty(property, value);
			PropertiesManager.Write(p, file);
		} catch (Exception e) {

		}
	}

	public String ReadProperty(String file, String property) {
		Properties p = PropertiesManager.Read(file);
		try {
			return p.getProperty(property);
		} catch (NullPointerException e) {
			System.out.println("chave sem dados");
			return null;
		}
	}

	public static Properties Read(String file) {
		Properties p = new Properties();
		FileInputStream f = null;
		try {
			f = new FileInputStream(file);
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		}
		try {
			p.load(f);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return p;
	}

	public static Boolean Write(Properties p, String file) {
		FileOutputStream f = null;
		try {
			f = new FileOutputStream(file);
		} catch (FileNotFoundException ex) {
			return false;
		}
		try {
			p.store(f, null);
		} catch (IOException ex) {
			return false;
		}
		return true;
	}
}
