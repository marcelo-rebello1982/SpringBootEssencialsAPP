package br.com.applications.utility;

import javax.swing.*;
import java.awt.*;

public class OS {

	private static final boolean osIsMacOsX;
	private static final boolean osIsLinux;
	private static final boolean osIsWindows;
	private static final boolean osIsWindowsXP;
	private static final boolean osIsWindows2003;
	private static final boolean osIsWindowsVista;
	private static final boolean osIsWindows81;
	private static final boolean osIsWindows8;

	static {

		String os = System.getProperty("os.name").toLowerCase();

		osIsMacOsX = "mac os x".equals(os);
		osIsWindows = os.indexOf("windows") != -1;
		osIsWindowsXP = "windows xp".equals(os);
		osIsWindows2003 = "windows 2003".equals(os);
		osIsWindows81 = "windows 8.1".equals(os);
		osIsWindows8 = "windows 8".equals(os);
		osIsWindowsVista = "windows vista".equals(os);
		osIsLinux = os != null && os.indexOf("linux") != -1;
	}

	public static void main(String[] args) {

		String os = System.getProperty("os.name").toLowerCase();
		System.out.println("os : " + os);

	}

	public static boolean isMacOSX() {
		return osIsMacOsX;
	}

	public static boolean isWindows() {
		return osIsWindows;
	}

	public static boolean isWindowsXP() {
		return osIsWindowsXP;
	}

	public static boolean isWindows2003() {
		return osIsWindows2003;
	}

	public static boolean isWindowsVista() {
		return osIsWindowsVista;
	}

	public static boolean isWindows81() {
		return osIsWindows81;
	}

	public static boolean isWindows8() {
		return osIsWindows8;
	}

	public static boolean isLinux() {
		return osIsLinux;
	}

	public static boolean isUsingWindowsVisualStyles() {
		if (!isWindows()) {
			return false;
		}

		boolean xpthemeActive = Boolean.TRUE.equals(Toolkit.getDefaultToolkit()
				.getDesktopProperty("win.xpstyle.themeActive"));
		if (!xpthemeActive) {
			return false;
		} else {
			try {
				return System.getProperty("swing.noxp") == null;
			} catch (RuntimeException e) {
				return true;
			}
		}
	}

	public static String getWindowsVisualStyle() {
		String style = UIManager.getString("win.xpstyle.name");
		if (style == null) {
			// guess the name of the current XPStyle
			// (win.xpstyle.colorName property found in
			// awt_DesktopProperties.cpp in
			// JDK source)
			style = (String) Toolkit.getDefaultToolkit().getDesktopProperty(
					"win.xpstyle.colorName");
		}
		return style;
	}
}
