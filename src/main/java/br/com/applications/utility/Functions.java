package br.com.applications.utility;

import br.com.applications.interfaces.MinimumAge;
import com.google.common.base.Charsets;
import org.apache.tomcat.util.http.fileupload.IOUtils;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.text.MaskFormatter;
import java.awt.*;
import java.io.*;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.ReadableByteChannel;
import java.nio.charset.Charset;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.*;

public class Functions {

    public long lMemLivre;
    public long lMemTotal;
    public long lMemUtilizada;
    public long lMemMaxima;

    public static final long UM_KB = 1024;
    public static final long UM_MB = UM_KB * UM_KB;
    public static final long UM_GB = UM_KB * UM_MB;

    public static final int OS_LINUX = 0;
    public static final int OS_WINDOWS = 1;
    public static final int OS_OSX = 3;
    public static final int OS_VERSION_WINDOWS_XP = 10;
    public static final int OS_VERSION_WINDOWS_VISTA = 11;
    public static final int OS_VERSION_WINDOWS_SEVEN = 12;

    public final static String jpeg = "jpeg";
    public final static String jpg = "jpg";
    public final static String gif = "gif";
    public final static String tiff = "tiff";
    public final static String tif = "tif";
    public final static String png = "png";

    public static int CARACTER_HIFEN = 45;
    public static int CARACTER_PONTO = 46;
    public static int CARACTER_UNDESCORE = 95;
    public static int CARACTER_ARROBA = 64;
    public static String CARACTERES_ESPECIAIS = "_.-@";


    public Font FONT_PADRAO = new Font("Verdana", Font.PLAIN, 10);
    public Font FONT_PADRAO_PRESSED = new Font("Verdana", Font.BOLD, 10);
    public Border BORDER_PADRAO = BorderFactory.createMatteBorder(0, 0, 1, 1, Color.GRAY);

    public static SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    public Charset UTF8_CHARSET = Charset.forName("UTF-8");

    public static final int JAVA_VERSION_TRIM_SIZE = 3;
    public static final String OS_NAME_WINDOWS_PREFIX = "Windows";
    public static final String USER_HOME_KEY = "user.home";
    public static final String USER_DIR_KEY = "user.dir";
    public static final String JAVA_IO_TMPDIR_KEY = "java.io.tmpdir";
    public static final String JAVA_HOME_KEY = "java.home";
    public static final String AWT_TOOLKIT = getSystemProperty("awt.toolkit");

    public static final String FILE_ENCODING = getSystemProperty("file.encoding");

    public static final String FILE_SEPARATOR = getSystemProperty("file.separator");

    public static final String JAVA_AWT_FONTS = getSystemProperty("java.awt.fonts");

    public static final String JAVA_AWT_GRAPHICSENV = getSystemProperty("java.awt.graphicsenv");

    public static final String JAVA_AWT_PRINTERJOB = getSystemProperty("java.awt.printerjob");

    public static final String JAVA_CLASS_PATH = getSystemProperty("java.class.path");

    public static final String JAVA_CLASS_VERSION = getSystemProperty("java.class.version");

    public static final String JAVA_COMPILER = getSystemProperty("java.compiler");

    public static final String JAVA_ENDORSED_DIRS = getSystemProperty("java.endorsed.dirs");

    public static final String JAVA_EXT_DIRS = getSystemProperty("java.ext.dirs");

    public static final String JAVA_HOME = getSystemProperty("java.home");

    public static final String JAVA_IO_TMPDIR = getSystemProperty("java.io.tmpdir");

    public static final String JAVA_LIBRARY_PATH = getSystemProperty("java.library.path");

    public static final String JAVA_RUNTIME_NAME = getSystemProperty("java.runtime.name");

    public static final String JAVA_RUNTIME_VERSION = getSystemProperty("java.runtime.version");

    public static final String JAVA_SPECIFICATION_NAME = getSystemProperty("java.specification.name");

    public static final String JAVA_SPECIFICATION_VENDOR = getSystemProperty("java.specification.vendor");

    public static final String JAVA_SPECIFICATION_VERSION = getSystemProperty("java.specification.version");

    public static final String JAVA_UTIL_PREFS_PREFERENCES_FACTORY = getSystemProperty(
            "java.util.prefs.PreferencesFactory");

    public static final String JAVA_VENDOR = getSystemProperty("java.vendor");

    public static final String JAVA_VENDOR_URL = getSystemProperty("java.vendor.url");

    public static final String JAVA_VERSION = getSystemProperty("java.version");

    public static final String JAVA_VM_INFO = getSystemProperty("java.vm.info");

    public static final String JAVA_VM_NAME = getSystemProperty("java.vm.name");

    public static final String JAVA_VM_SPECIFICATION_NAME = getSystemProperty("java.vm.specification.name");

    public static final String JAVA_VM_SPECIFICATION_VENDOR = getSystemProperty("java.vm.specification.vendor");

    public static final String JAVA_VM_SPECIFICATION_VERSION = getSystemProperty("java.vm.specification.version");

    public static final String JAVA_VM_VENDOR = getSystemProperty("java.vm.vendor");

    public static final String LINE_SEPARATOR = getSystemProperty("line.separator");

    public static final String OS_ARCH = getSystemProperty("os.arch");

    public static final String OS_NAME = getSystemProperty("os.name");

    public static final String OS_VERSION = getSystemProperty("os.version");

    public static final String PATH_SEPARATOR = getSystemProperty("path.separator");

    public static final String USER_COUNTRY = getSystemProperty("user.country") == null
            ? getSystemProperty("user.region")
            : getSystemProperty("user.country");

    public static final String USER_DIR = getSystemProperty("user.dir");

    public static final String USER_HOME = getSystemProperty("user.home");

    public static final String USER_LANGUAGE = getSystemProperty("user.language");

    public static final String USER_NAME = getSystemProperty("user.name");

    public static final String USER_TIMEZONE = getSystemProperty("user.timezone");

    // **********************************************************
    // BOOLEAN //BOOLEAN //BOOLEAN //BOOLEAN //BOOLEAN //BOOLEAN
    // BOOLEAN // BOOLEAN // BOOLEAN // BOOLEAN // BOOLEAN //BOOLEAN
    // BOOLEAN // BOOLEAN // BOOLEAN // BOOLEAN // BOOLEAN //BOOLEAN
    //
    // **********************************************************

    public static final boolean IS_JAVA_1_1 = getJavaVersionMatches("1.1");

    public static final boolean IS_JAVA_1_2 = getJavaVersionMatches("1.2");

    public static final boolean IS_JAVA_1_3 = getJavaVersionMatches("1.3");

    public static final boolean IS_JAVA_1_4 = getJavaVersionMatches("1.4");

    public static final boolean IS_JAVA_1_5 = getJavaVersionMatches("1.5");

    public static final boolean IS_JAVA_1_6 = getJavaVersionMatches("1.6");

    public static final boolean IS_JAVA_1_7 = getJavaVersionMatches("1.7");

    public static final String JAVA_VM_VERSION = getSystemProperty("java.vm.version");

    public static final boolean IS_OS_AIX = getOSMatchesName("AIX");

    public static final String JAVA_AWT_HEADLESS = getSystemProperty("java.awt.headless");

    public static final boolean IS_OS_HP_UX = getOSMatchesName("HP-UX");

    public static final boolean IS_OS_IRIX = getOSMatchesName("Irix");

    public static final boolean IS_OS_LINUX = (getOSMatchesName("Linux")) || (getOSMatchesName("LINUX"));

    public static final boolean IS_OS_MAC = getOSMatchesName("Mac");

    public static final boolean IS_OS_MAC_OSX = getOSMatchesName("Mac OS X");

    public static final boolean IS_OS_OS2 = getOSMatchesName("OS/2");

    public static final boolean IS_OS_SOLARIS = getOSMatchesName("Solaris");

    public static final boolean IS_OS_SUN_OS = getOSMatchesName("SunOS");

    public static final boolean IS_OS_UNIX = (IS_OS_AIX) || (IS_OS_HP_UX) || (IS_OS_IRIX) || (IS_OS_LINUX)
            || (IS_OS_MAC_OSX) || (IS_OS_SOLARIS) || (IS_OS_SUN_OS);

    public static final boolean IS_OS_WINDOWS = getOSMatchesName("Windows");

    public static final boolean IS_OS_WINDOWS_2000 = getOSMatches("Windows", "5.0");

    public static final boolean IS_OS_WINDOWS_95 = getOSMatches("Windows 9", "4.0");

    public static final boolean IS_OS_WINDOWS_98 = getOSMatches("Windows 9", "4.1");

    public static final boolean IS_OS_WINDOWS_ME = getOSMatches("Windows", "4.9");

    public static final boolean IS_OS_WINDOWS_NT = getOSMatchesName("Windows NT");

    public static final boolean IS_OS_WINDOWS_XP = getOSMatches("Windows", "5.1");

    public static final boolean IS_OS_WINDOWS_VISTA = getOSMatches("Windows", "6.0");

    public static final boolean IS_OS_WINDOWS_7 = getOSMatches("Windows", "6.1");

    public static String getSystemProperty(String property) {
        try {
            return System.getProperty(property);
        } catch (SecurityException ex) {
            System.err.println("Caught a SecurityException reading the system property '" + property
                    + "'; the SystemUtils property value will default to null.");
        }
        return null;
    }

    public static boolean getOSMatches(String osNamePrefix, String osVersionPrefix) {
        return isOSMatch(OS_NAME, OS_VERSION, osNamePrefix, osVersionPrefix);
    }

    static boolean isOSMatch(String osName, String osVersion, String osNamePrefix, String osVersionPrefix) {
        if ((osName == null) || (osVersion == null)) {
            return false;
        }
        return (osName.startsWith(osNamePrefix)) && (osVersion.startsWith(osVersionPrefix));
    }


    public static boolean getJavaVersionMatches(String versionPrefix) {
        return true;
        // isJavaVersionMatch(JAVA_VERSION_TRIMMED, versionPrefix);
    }

    public static boolean getOSMatchesName(String osNamePrefix) {
        return isOSNameMatch(OS_NAME, osNamePrefix);
    }

    static boolean isOSNameMatch(String osName, String osNamePrefix) {
        if (osName == null) {
            return false;
        }
        return osName.startsWith(osNamePrefix);
    }


//    public boolean usuarioValido(Student student) {
//        if (!student.getName().matches("[a-zA-Záàâãéèêíïóôõöúçñ\\s]+")) {
//            return false;
//        }
//        if (!student.getCpf().matches("[^0-9]+")) {
//            return false;
//        }
//        return Period.between(student.getDateOfBirth(), LocalDate.now()).getYears() >= 18;
//    }

    public static boolean IsFile(String paramString) {
        if (paramString.length() == 0)
            return false;
        File localFile = new File(paramString);
        return localFile.isFile();
    }


    public static boolean isZero(BigDecimal value) {
        if (null == value) {
            return true;
        } else {
            return BigDecimal.ZERO.compareTo(value) == 0 ? true : false;
        }
    }


    public String removerParteDeUmaString(String tmp, String start, String end) {
        int startPosi = -1;
        int endPosi = -1;
        startPosi = tmp.indexOf(start);
        if (startPosi >= 0) {
            endPosi = tmp.indexOf(end, startPosi);
            if (endPosi >= startPosi) {
                tmp = tmp.substring(0, startPosi) + tmp.substring(endPosi + 2);
            }
        }
        return tmp;
    }

    public String substituiParteDeUmaString(String inputString, String beReplaced, String replaceTo) {
        int index = 0;
        String returnString = "";
        returnString = inputString;

        do {
            index = inputString.indexOf(beReplaced, index);
            if (index == -1) {
                break;
            }
            returnString = inputString.substring(0, index) + replaceTo
                    + inputString.substring(index + beReplaced.length());
            index += replaceTo.length();
            inputString = returnString;
        } while (true);
        return returnString.substring(0, returnString.length());
    }




    public static boolean assertSameDate(Date d1, Date d2) {
        return d1.equals(d2);
    }

    protected boolean isAllWhiteSpace(CharSequence sb) {
        boolean result = true;
        for (int i = 0; i < sb.length(); i++) {
            char c = sb.charAt(i);
            if (!Character.isWhitespace(c)) {
                return false;
            }
        }
        return result;
    }

    public static boolean hasLength(String str) {
        return (str != null && str.length() > 0);
    }

    public static boolean validaCep(String cep) {
        StringBuffer novoCep = new StringBuffer();
        boolean retorno = true;

        if ((cep.equals("")) || (cep.length() < 8)) {
            retorno = false;
        } else {
            for (int i = 0; i < cep.length(); i++) {
                char c = cep.charAt(i);
                if (Character.isDigit(c)) {
                    novoCep.append(c);
                }
            }
            if (novoCep.length() != 8) {
                retorno = false;
            }
        }
        return retorno;
    }

    public static String tiraMascaraCep(String cep) {

        StringBuffer novoCep = new StringBuffer();
        for (int i = 0; i < cep.length(); i++) {
            char c = cep.charAt(i);
            if (Character.isDigit(c)) {
                novoCep.append(c);
            }
        }
        if (novoCep.length() == 8) {
            return novoCep.toString();
        }
        return "";
    }



    public static boolean isNumeric(String paramString) {
        for (int i = 0; i < paramString.length(); i++)
            if (!Character.isDigit(paramString.charAt(i)))
                return false;
        return true;
    }

    public boolean contains(StringBuilder input, char c) {
        for (int i = 0; i < input.length(); i++) {
            if (input.charAt(i) == c)
                return true;
        }
        return false;
    }


    public static <T> boolean validador(T object) {
        Class<?> classEntity = object.getClass();
        for (Field field : classEntity.getDeclaredFields()) {
            if (field.isAnnotationPresent(MinimumAge.class)) {
                MinimumAge minimumAge = field.getAnnotation(MinimumAge.class);
                try {
                    field.setAccessible(true);
                    LocalDate birthDate = (LocalDate) field.get(object);
                    return Period.between(birthDate, LocalDate.now()).getYears() >= minimumAge.value();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }


    public boolean validarDomain(String s) {

        if (!validar(s))
            return false;
        if (s.indexOf("" + (char) CARACTER_PONTO) == -1 || s.indexOf("" + (char) CARACTER_PONTO) == 0
                || s.indexOf("" + (char) CARACTER_PONTO) == s.length())
            return false;
        return !s.endsWith("" + (char) CARACTER_ARROBA) && !s.endsWith("" + (char) CARACTER_HIFEN)
                && !s.endsWith("" + (char) CARACTER_PONTO) && !s.endsWith("" + (char) CARACTER_UNDESCORE);
    }

    public static boolean validar(String s) {

        int i = 0;
        if (s.indexOf(' ') != -1)
            return false;
        for (; i < s.length(); i++) {
            if (!isCaractereValido(s.charAt(i)))
                return false;
            if (CARACTERES_ESPECIAIS.indexOf(s.charAt(i)) != -1 && CARACTERES_ESPECIAIS.indexOf(s.charAt(i - 1)) != -1)
                return false;
        }
        return !s.startsWith("" + (char) CARACTER_ARROBA) && !s.startsWith("" + (char) CARACTER_HIFEN)
                && !s.startsWith("" + (char) CARACTER_PONTO) && !s.startsWith("" + (char) CARACTER_UNDESCORE);
    }

    public static boolean isCaractereValido(int i) {
        if (i == CARACTER_ARROBA)
            return false;
        if (i == CARACTER_HIFEN)
            return true;
        if (i == CARACTER_PONTO)
            return true;
        if (i == CARACTER_UNDESCORE)
            return true;
        if (i < 48 || i > 122)
            return false;
        if (i >= 58 && i <= 64)
            return false;
        return i < 91 || i > 96;
    }


    public static String trimEnd(String s, char[] toTrim) {
        char[] sChars = s.toCharArray();
        String toTrimStr = new String(toTrim);
        StringBuffer sb = new StringBuffer(s);

        for (int i = sChars.length - 1; i >= 0; i--) {
            if (toTrimStr.indexOf(sChars[i]) <= -1)
                break;
            sb.deleteCharAt(i);
        }
        return sb.toString();
    }

    public static String getNumericString(final String string) {
        final StringBuilder stringBuilder = new StringBuilder();

        for (int i = 0; i < string.length(); i++) {
            final char c = string.charAt(i);

            if ('0' <= c && c <= '9') {
                stringBuilder.append(c);
            }
        }

        return stringBuilder.toString();
    }

    public static boolean equals(String str1, String str2) {
        return str1 == null ? str2 == null : str1.equals(str2);
    }

    public static final String MYSQL_EXTENSION = ".mysql.sql";
    public static final Charset CHARSET = Charsets.UTF_8;

    public static File stream2file(InputStream in) throws IOException {

        final File tempFile = File.createTempFile("stream2file", ".tmp");
        tempFile.deleteOnExit();
        try (FileOutputStream out = new FileOutputStream(tempFile)) {
            IOUtils.copy(in, out);
        }
        return tempFile;
    }

    public String createFullPath(String... dirsAndFilename) {
        StringBuilder fullPath = new StringBuilder();
        for (int i = 0; i < dirsAndFilename.length - 1; i++) {
            fullPath.append(dirsAndFilename[i]);
            fullPath.append(File.separator);
        }
        fullPath.append(dirsAndFilename[dirsAndFilename.length - 1]);

        return fullPath.toString();
    }

    public static String fileAsString(String fileName) {
        File f = null;
        BufferedReader reader = null;
        try {
            f = new File(fileName);

            reader = new BufferedReader(new FileReader(f));
            StringBuilder result = new StringBuilder(10000);
            String line = null;
            while ((line = reader.readLine()) != null) {
                result.append(line + "\n");
            }
            return result.toString();
        } catch (IOException e) {
            throw new RuntimeException("Error reading file: " + f.getAbsolutePath(), e);
        } finally {
            try {
                reader.close();
            } catch (Throwable t) {
            }
        }
    }

    public void writeToFile(InputStream stream) throws IOException {
        String filePath = "C:\\Test.jpg";
        FileChannel outChannel = new FileOutputStream(filePath).getChannel();
        ReadableByteChannel inChannel = Channels.newChannel(stream);
        ByteBuffer buffer = ByteBuffer.allocate(1024);

        while (inChannel.read(buffer) >= 0 || buffer.position() > 0) {
            buffer.flip();
            outChannel.write(buffer);
            buffer.compact();
        }

        inChannel.close();
        outChannel.close();
    }

    public static boolean deleteDir_(File dir) {

        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i = 0; i < children.length; i++) {
                deleteDir(new File(dir, children[i]));
            }
        }
        return dir.delete();
    }

    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i = 0; i < children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        return dir.delete();
    }

    public static int findInMap(int[][] map, int ind0) {
        for (int i = 0; i < map.length; i++) {
            if (map[i][0] == ind0)
                return map[i][1];
        }

        return -1;
    }

    public static int findInMapReverse(int[][] map, int ind1) {
        for (int i = 0; i < map.length; i++) {
            if (map[i][1] == ind1)
                return map[i][0];
        }

        return -1;
    }


    public String formatarStringPassandoMaskara(String texto, String mascara) throws ParseException {
        MaskFormatter mf = new MaskFormatter(mascara);
        mf.setValueContainsLiteralCharacters(false);
        return mf.valueToString(texto);
    }

    public static File getJavaHome() {
        return new File(System.getProperty("java.home"));
    }

    public static File getJavaIoTmpDir() {
        return new File(System.getProperty("java.io.tmpdir"));
    }

    public static String mapToString(Map<String, String> map) {
        StringBuilder stringBuilder = new StringBuilder();

        for (String key : map.keySet()) {
            if (stringBuilder.length() > 0) {
                stringBuilder.append("&");
            }
            String value = map.get(key);
            try {
                stringBuilder.append((key != null ? URLEncoder.encode(key, "UTF-8") : ""));
                stringBuilder.append("=");
                stringBuilder.append(value != null ? URLEncoder.encode(value, "UTF-8") : "");
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException("This method requires UTF-8 encoding support", e);
            }
        }

        return stringBuilder.toString();
    }

    public static Map<String, String> stringToMap(String input) {
        Map<String, String> map = new HashMap<String, String>();

        String[] nameValuePairs = input.split("&");
        for (String nameValuePair : nameValuePairs) {
            String[] nameValue = nameValuePair.split("=");
            try {
                map.put(URLDecoder.decode(nameValue[0], "UTF-8"),
                        nameValue.length > 1 ? URLDecoder.decode(nameValue[1], "UTF-8") : "");
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException("This method requires UTF-8 encoding support", e);
            }
        }

        return map;
    }

    public static String getZerosAEsquerda(final String valor, final int digitos) {
        StringBuilder builder = new StringBuilder(digitos);
        int length = (digitos - valor.length());
        for (int iCount = 0; iCount < length; iCount++)
            builder.append("0");
        builder.append(valor);
        return builder.toString();
    }

    public static boolean isExists(String value) {
        return (value != null && !value.isEmpty());
    }

    public static final String[] PREPOSICOES = { "a", "ao", "à", "aos", "às", "de", "do", "da", "dos", "das", "em",
            "no", "na", "nos", "nas", "por", "pelo", "pela", "pelos", "pelas", "ante", "após", "até", "com", "contra",
            "desde", "entre", "para", "perante", "sem", "sob", "sobre", "trás" };

    static String getRegexPreposicoes() {
        final int length = PREPOSICOES.length;
        StringBuilder builder = new StringBuilder(length * 2);
        for (byte count = 0; count < length; count++) {
            if (count == 0)
                builder.append("[");
            if (count > 0)
                builder.append("-");
            builder.append(PREPOSICOES[count]);
            if ((count + 1) == length)
                builder.append("]");
        }
        return builder.toString();
    }

    public HashMap<String, Object> resultSetToHashMap(ResultSet rs) throws SQLException {
        ResultSetMetaData md = rs.getMetaData();
        int columns = md.getColumnCount();
        HashMap<String, Object> row = new HashMap<String, Object>();
        while (rs.next()) {
            for (int i = 1; i <= columns; i++) {
                row.put(md.getColumnName(i), rs.getObject(i));
            }
        }
        return row;
    }

    public static Object[] toArray(Collection c) {

        Object[] objs = new Object[c.size()];
        int i = 0;
        for (Iterator localIterator = c.iterator(); localIterator.hasNext();) {
            Object o = localIterator.next();
            objs[(i++)] = o;
        }
        return objs;
    }

}
