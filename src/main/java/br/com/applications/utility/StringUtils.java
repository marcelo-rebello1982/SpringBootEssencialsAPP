package br.com.applications.utility;

public class StringUtils {

//    private Charset UTF8_CHARSET = Charset.forName("UTF-8");
//
//    public String convertByteArrayToString2(byte[] bytes) {
//        return new String(bytes, UTF8_CHARSET);
//    }
//
//    public String convertByteArrayToString1(byte[] bytes) {
//        return new String(bytes, Charset.forName("UTF-8"));
//    }
//
//    // String tmp = he.numbers(new Integer[]{18,24,39});
//    public String convertArrayIntegerToString(Integer[] numbers) {
//        List<Integer> list = Arrays.asList(numbers);
//        StringBuilder commaSepValueBuilder = new StringBuilder();
//
//        for (int i = 0; i < list.size(); i++) {
//            commaSepValueBuilder.append(list.get(i));
//            if (i != list.size() - 1) {
//                commaSepValueBuilder.append(", ");
//            }
//        }
//        return commaSepValueBuilder.toString();
//    }
//
//    public final String convertListToString(List<String> list, String delimiter) {
//        if (list == null || list.size() == 0) {
//            return null;
//        }
//
//        StringBuffer sb = new StringBuffer();
//        for (int i = 0; i < list.size(); i++) {
//            sb.append(list.get(i));
//            // Don't add the delimiter to last one
//            if (i != list.size() - 1) {
//                sb.append(delimiter);
//            }
//        }
//        return sb.toString();
//    }
//
//    public String convertArrayToString(String[] array) {
//        if (array == null || array.length == 0) {
//            return null;
//        }
//        StringBuilder sb = new StringBuilder();
//        for (String retorno : array) {
//            sb.append(retorno);
//        }
//        return sb.toString();
//    }
//
//
//    public static byte[] toByteArray(byte byteArray) {
//        return new byte[]{byteArray};
//    }
//
//    public static byte[] toByteArray(byte[] byteArray) {
//        return byteArray;
//    }
//
//    public static byte[] toByteArray(short data) {
//        return new byte[]{(byte) ((data >> 8) & 0xff),
//                (byte) ((data >> 0) & 0xff),};
//    }
//
//    public static boolean hasLength(@Nullable String str) {
//        return (str != null && !str.isEmpty());
//    }
//
//    public static byte[] toByteArray(short[] data) {
//        if (data == null)
//            return null;
//
//        byte[] byts = new byte[data.length * 2];
//
//        for (int i = 0; i < data.length; i++)
//            System.arraycopy(toByteArray(data[i]), 0, byts, i * 2, 2);
//
//        return byts;
//    }
//
//    public static byte[] toByteArray(char data) {
//        return new byte[]{(byte) ((data >> 8) & 0xff),
//                (byte) ((data >> 0) & 0xff),};
//    }
//
//    public static byte[] toByteArray(char[] data) {
//        if (data == null)
//            return null;
//
//        byte[] byts = new byte[data.length * 2];
//
//        for (int i = 0; i < data.length; i++)
//            System.arraycopy(toByteArray(data[i]), 0, byts, i * 2, 2);
//
//        return byts;
//    }
//
//    public static byte[] toByteArray(int data) {
//        return new byte[]{(byte) ((data >> 24) & 0xff),
//                (byte) ((data >> 16) & 0xff), (byte) ((data >> 8) & 0xff),
//                (byte) ((data >> 0) & 0xff),};
//    }
//
//    public static byte[] toByteArray(int[] data) {
//        if (data == null)
//            return null;
//
//        byte[] byts = new byte[data.length * 4];
//
//        for (int i = 0; i < data.length; i++)
//            System.arraycopy(toByteArray(data[i]), 0, byts, i * 4, 4);
//
//        return byts;
//    }
//
//    public final String convertArrayToString(String[] array, String delimiter) {
//        if (array == null || array.length == 0) {
//            return null;
//        }
//
//        StringBuffer sb = new StringBuffer();
//        for (int i = 0; i < array.length; i++) {
//            sb.append(array[i]);
//            // Don't add the delimiter to last one
//            if (i != array.length - 1) {
//                sb.append(delimiter);
//            }
//        }
//        return sb.toString();
//    }
//
//    public static byte[] toByteArray(long data) {
//        return new byte[]{(byte) ((data >> 56) & 0xff),
//                (byte) ((data >> 48) & 0xff), (byte) ((data >> 40) & 0xff),
//                (byte) ((data >> 32) & 0xff), (byte) ((data >> 24) & 0xff),
//                (byte) ((data >> 16) & 0xff), (byte) ((data >> 8) & 0xff),
//                (byte) ((data >> 0) & 0xff),};
//    }
//
//    public static byte[] toByteArray(long[] data) {
//        if (data == null)
//            return null;
//
//        byte[] byts = new byte[data.length * 8];
//
//        for (int i = 0; i < data.length; i++)
//            System.arraycopy(toByteArray(data[i]), 0, byts, i * 8, 8);
//
//        return byts;
//    }
//
//    public static byte[] toByteArray(float data) {
//        return toByteArray(Float.floatToRawIntBits(data));
//    }
//
//    public static byte[] toByteArray(float[] data) {
//        if (data == null)
//            return null;
//
//        byte[] byts = new byte[data.length * 4];
//
//        for (int i = 0; i < data.length; i++)
//            System.arraycopy(toByteArray(data[i]), 0, byts, i * 4, 4);
//
//        return byts;
//    }
//
//    public static byte[] toByteArray(double data) {
//        return toByteArray(Double.doubleToRawLongBits(data));
//    }
//
//    public static byte[] toByteArray(double[] data) {
//        if (data == null)
//            return null;
//
//        byte[] byts = new byte[data.length * 8];
//
//        for (int i = 0; i < data.length; i++)
//            System.arraycopy(toByteArray(data[i]), 0, byts, i * 8, 8);
//
//        return byts;
//    }
//
//    public static byte[] toByteArray(boolean data) {
//        return new byte[]{(byte) (data ? 0x01 : 0x00)};
//    }
//
//    public static byte[] toByteArray(boolean[] data) {
//        if (data == null)
//            return null;
//
//        int len = data.length;
//        byte[] lena = toByteArray(len);
//        byte[] byts = new byte[lena.length + (len / 8) + (len % 8 != 0 ? 1 : 0)];
//
//        System.arraycopy(lena, 0, byts, 0, lena.length);
//
//        for (int i = 0, j = lena.length, k = 7; i < data.length; i++) {
//            byts[j] |= (data[i] ? 1 : 0) << k--;
//            if (k < 0) {
//                j++;
//                k = 7;
//            }
//        }
//
//        return byts;
//    }
//
//    public static byte[] toByteArray(String data) {
//        return (data == null) ? null : data.getBytes();
//    }
//
//    public static byte[] toByteArray(String[] data) {
//        if (data == null)
//            return null;
//
//        int totalLength = 0;
//        int bytesPos = 0;
//
//        byte[] dLen = toByteArray(data.length);
//        totalLength += dLen.length;
//
//        int[] sLens = new int[data.length];
//        totalLength += (sLens.length * 4);
//        byte[][] strs = new byte[data.length][];
//
//        for (int i = 0; i < data.length; i++) {
//            if (data[i] != null) {
//                strs[i] = toByteArray(data[i]);
//                sLens[i] = strs[i].length;
//                totalLength += strs[i].length;
//            } else {
//                sLens[i] = 0;
//                strs[i] = new byte[0];
//            }
//        }
//
//        byte[] bytes = new byte[totalLength];
//        System.arraycopy(dLen, 0, bytes, 0, 4);
//
//        byte[] bsLens = toByteArray(sLens);
//        System.arraycopy(bsLens, 0, bytes, 4, bsLens.length);
//
//        bytesPos += 4 + bsLens.length; // mark position
//
//        for (byte[] sba : strs) {
//            System.arraycopy(sba, 0, bytes, bytesPos, sba.length);
//            bytesPos += sba.length;
//        }
//
//        return bytes;
//    }
//
//    public static byte toByte(byte[] byteArray) {
//        return (byteArray == null || byteArray.length == 0) ? 0x0
//                : byteArray[0];
//    }
//
//    public static short toShort(byte[] byteArray) {
//        if (byteArray == null || byteArray.length != 2)
//            return 0x0;
//        // ----------
//        return (short) ((0xff & byteArray[0]) << 8 | (0xff & byteArray[1]) << 0);
//    }
//
//    public static short[] toShortArray(byte[] byteArray) {
//        if (byteArray == null || byteArray.length % 2 != 0)
//            return null;
//
//        short[] shts = new short[byteArray.length / 2];
//
//        for (int i = 0; i < shts.length; i++) {
//            shts[i] = toShort(new byte[]{byteArray[(i * 2)],
//                    byteArray[(i * 2) + 1]});
//        }
//
//        return shts;
//    }
//
//    public static char toChar(byte[] byteArray) {
//        if (byteArray == null || byteArray.length != 2)
//            return 0x0;
//
//        return (char) ((0xff & byteArray[0]) << 8 | (0xff & byteArray[1]) << 0);
//    }
//
//    public static char[] toCharArray(byte[] byteArray) {
//        if (byteArray == null || byteArray.length % 2 != 0)
//            return null;
//
//        char[] chrs = new char[byteArray.length / 2];
//
//        for (int i = 0; i < chrs.length; i++) {
//            chrs[i] = toChar(new byte[]{byteArray[(i * 2)],
//                    byteArray[(i * 2) + 1],});
//        }
//
//        return chrs;
//    }
//
//    public static int toInt(byte[] byteArray) {
//        if (byteArray == null || byteArray.length != 4)
//            return 0x0;
//
//        return (int) ((0xff & byteArray[0]) << 24 | (0xff & byteArray[1]) << 16
//                | (0xff & byteArray[2]) << 8 | (0xff & byteArray[3]) << 0);
//    }
//
//    public static int[] toIntArray(byte[] byteArray) {
//        if (byteArray == null || byteArray.length % 4 != 0)
//            return null;
//
//        int[] ints = new int[byteArray.length / 4];
//
//        for (int i = 0; i < ints.length; i++) {
//            ints[i] = toInt(new byte[]{byteArray[(i * 4)],
//                    byteArray[(i * 4) + 1], byteArray[(i * 4) + 2],
//                    byteArray[(i * 4) + 3],});
//        }
//
//        return ints;
//    }
//
//    public static long toLong(byte[] byteArray) {
//        if (byteArray == null || byteArray.length != 8)
//            return 0x0;
//
//        return (long) ((long) (0xff & byteArray[0]) << 56
//                | (long) (0xff & byteArray[1]) << 48
//                | (long) (0xff & byteArray[2]) << 40
//                | (long) (0xff & byteArray[3]) << 32
//                | (long) (0xff & byteArray[4]) << 24
//                | (long) (0xff & byteArray[5]) << 16
//                | (long) (0xff & byteArray[6]) << 8 | (long) (0xff & byteArray[7]) << 0);
//    }
//
//    public static long[] toLongArray(byte[] byteArray) {
//        if (byteArray == null || byteArray.length % 8 != 0)
//            return null;
//
//        long[] lngs = new long[byteArray.length / 8];
//
//        for (int i = 0; i < lngs.length; i++) {
//            lngs[i] = toLong(new byte[]{byteArray[(i * 8)],
//                    byteArray[(i * 8) + 1], byteArray[(i * 8) + 2],
//                    byteArray[(i * 8) + 3], byteArray[(i * 8) + 4],
//                    byteArray[(i * 8) + 5], byteArray[(i * 8) + 6],
//                    byteArray[(i * 8) + 7],});
//        }
//
//        return lngs;
//    }
//
//    public static float toFloat(byte[] byteArray) {
//        if (byteArray == null || byteArray.length != 4)
//            return 0x0;
//
//        return Float.intBitsToFloat(toInt(byteArray));
//    }
//
//    public static float[] toFloatArray(byte[] byteArray) {
//        if (byteArray == null || byteArray.length % 4 != 0)
//            return null;
//
//        float[] flts = new float[byteArray.length / 4];
//
//        for (int i = 0; i < flts.length; i++) {
//            flts[i] = toFloat(new byte[]{byteArray[(i * 4)],
//                    byteArray[(i * 4) + 1], byteArray[(i * 4) + 2],
//                    byteArray[(i * 4) + 3],});
//        }
//
//        return flts;
//    }
//
//    public static double toDouble(byte[] byteArray) {
//        if (byteArray == null || byteArray.length != 8)
//            return 0x0;
//
//        return Double.longBitsToDouble(toLong(byteArray));
//    }
//
//    public static double[] toDoubleArray(byte[] byteArray) {
//        if (byteArray == null)
//            return null;
//
//        if (byteArray.length % 8 != 0)
//            return null;
//
//        double[] dbls = new double[byteArray.length / 8];
//
//        for (int i = 0; i < dbls.length; i++) {
//            dbls[i] = toDouble(new byte[]{byteArray[(i * 8)],
//                    byteArray[(i * 8) + 1], byteArray[(i * 8) + 2],
//                    byteArray[(i * 8) + 3], byteArray[(i * 8) + 4],
//                    byteArray[(i * 8) + 5], byteArray[(i * 8) + 6],
//                    byteArray[(i * 8) + 7],});
//        }
//
//        return dbls;
//    }
//
//    public static boolean toBoolean(byte[] byteArray) {
//        return (byteArray == null || byteArray.length == 0) ? false
//                : byteArray[0] != 0x00;
//    }
//
//    public static boolean[] toBooleanArray(byte[] byteArray) {
//        if (byteArray == null || byteArray.length < 4)
//            return null;
//
//        int len = toInt(new byte[]{byteArray[0], byteArray[1], byteArray[2],
//                byteArray[3]});
//        boolean[] bools = new boolean[len];
//
//        for (int i = 0, j = 4, k = 7; i < bools.length; i++) {
//            bools[i] = ((byteArray[j] >> k--) & 0x01) == 1;
//            if (k < 0) {
//                j++;
//                k = 7;
//            }
//        }
//
//        return bools;
//    }
//
//    public static String toString(byte[] byteArray) {
//        return (byteArray == null) ? null : new String(byteArray);
//    }
//
//    public static String[] toStringArray(byte[] byteArray) {
//        if (byteArray == null || byteArray.length < 4)
//            return null;
//
//        byte[] bBuff = new byte[4];
//
//        System.arraycopy(byteArray, 0, bBuff, 0, 4);
//        int saLen = toInt(bBuff);
//
//        if (byteArray.length < (4 + (saLen * 4)))
//            return null;
//
//        bBuff = new byte[saLen * 4];
//        System.arraycopy(byteArray, 4, bBuff, 0, bBuff.length);
//        int[] sLens = toIntArray(bBuff);
//        if (sLens == null)
//            return null;
//
//        String[] strs = new String[saLen];
//        for (int i = 0, dataPos = 4 + (saLen * 4); i < saLen; i++) {
//            if (sLens[i] > 0) {
//                if (byteArray.length >= (dataPos + sLens[i])) {
//                    bBuff = new byte[sLens[i]];
//                    System.arraycopy(byteArray, dataPos, bBuff, 0, sLens[i]);
//                    dataPos += sLens[i];
//                    strs[i] = toString(bBuff);
//                } else
//                    return null;
//            }
//        }
//        return strs;
//    }
//
//    // Converts a String to a float
//    public static float string2float(String str) {
//        return Float.valueOf(str).floatValue();
//    }
//
//    // Converts a String to a double
//    public static double string2double(String str) {
//        return Double.valueOf(str).doubleValue();
//    }
//
//    // Converts a String to an int
//    public static int string2int(String str) {
//        return Integer.valueOf(str).intValue();
//    }
//
//    public static float[] string2float(String[] strs) {
//        float[] values = null;
//        if (strs != null && strs.length > 0) {
//            values = new float[strs.length];
//            for (int i = 0; i < strs.length; i++)
//                values[i] = string2float(strs[i]);
//        }
//
//        return values;
//    }
//
//    public static double[] string2double(String[] strs) {
//        double[] values = null;
//        if (strs != null && strs.length > 0) {
//            values = new double[strs.length];
//            for (int i = 0; i < strs.length; i++)
//                values[i] = string2double(strs[i]);
//        }
//
//        return values;
//    }
//
//    public static int[] string2int(String[] strs) {
//        int[] values = null;
//        if (strs != null && strs.length > 0) {
//            values = new int[strs.length];
//            for (int i = 0; i < strs.length; i++)
//                values[i] = string2int(strs[i]);
//        }
//
//        return values;
//    }
//
//    public static InputStream toInputStream(String str) {
//        ByteArrayInputStream stream = null;
//        try {
//            stream = new ByteArrayInputStream(str.getBytes("UTF-8"));
//        } catch (UnsupportedEncodingException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//
//        return stream;
//    }
//
//    public static InputStream toInputStream(String[] stringArray) {
//        return toInputStream(stringArray, 0);
//    }
//
//    public static InputStream toInputStream(String[] stringArray, int startIndex) {
//        return toInputStream(stringArray, startIndex, stringArray.length);
//    }
//
//    public static InputStream toInputStream(String[] stringArray,
//                                            int startIndex, int endIndex) {
//        String str = toString(stringArray, startIndex, endIndex);
//
//        return toInputStream(str);
//    }
//
//    public static String toString(String[] stringArray) {
//        return toString(stringArray, 0);
//    }
//
//    public static String toString(String[] stringArray, int startIndex) {
//        return toString(stringArray, startIndex, stringArray.length - 1);
//    }
//
//    public static String toString(String[] stringArray, int startIndex,
//                                  int endIndex) {
//        if (startIndex < 0)
//            startIndex = 0;
//        if (startIndex > stringArray.length - 1)
//            startIndex = stringArray.length - 1;
//        if (endIndex < startIndex)
//            endIndex = startIndex;
//        if (endIndex > stringArray.length - 1)
//            endIndex = stringArray.length - 1;
//
//        StringBuilder str = new StringBuilder();
//        for (int i = startIndex; i <= endIndex; i++) {
//            str.append(stringArray[i]).append(
//                    System.getProperty("line.separator"));
//        }
//
//        return str.toString();
//    }
//
//    public String[] toStringAsArraysList(String[] names) {
//        List<String> list = Arrays.asList(names);
//        names = (String[]) list.toArray();
//        for (String string : names) {
//        }
//        return names;
//    }
//
//    public String[] toStringArray(Integer[] tmp) {
//        String[] out = new String[tmp.length];
//        for (int i = 0; i < tmp.length; i++) {
//            out[i] = new String(tmp[i].toString());
//        }
//        return out;
//    }
//
//    public static int[] toIntArray(List<Integer> list) {
//        int n = list.size();
//        int[] array = new int[n];
//        for (int i = 0; i < n; i++) {
//            array[i] = list.get(i);
//        }
//        return array;
//    }
//
//    public int[] toIntArray2(List<String> list) {
//        int n = list.size();
//        int[] array = new int[n];
//        for (int i = 0; i < n; i++) {
//            array[i] = Integer.parseInt(list.get(i));
//        }
//        return array;
//    }
//
//    public static double[] toDoubleArray(List<Double> list) {
//        int n = list.size();
//        double[] array = new double[n];
//        for (int i = 0; i < n; i++) {
//            array[i] = list.get(i);
//        }
//        return array;
//    }
//
//    public static <T> String toString(T[][] array) {
//        verifyNonNull(array);
//
//        StringBuilder builder = new StringBuilder();
//        for (int i = 0; i < array.length; i++) {
//            builder.append('[');
//            for (int j = 0; j < array[i].length; j++) {
//                if (j > 0) {
//                    builder.append(", ");
//                }
//                builder.append(array[i][j]);
//            }
//            builder.append("]\n");
//        }
//        return builder.toString();
//    }
//
//    public static void verifyNonNull(Object value) {
//        if (value == null) {
//            throw new NullPointerException("Argument must be non-null.");
//        }
//    }
//
//    public static List toList(int[] array) {
//        List list = new ArrayList();
//        for (int i = 0; i < array.length; i++) {
//            list.add(array[i]);
//        }
//        return list;
//    }
//
//    public static List<Double> toList(double[] array) {
//        List<Double> list = new ArrayList<Double>();
//        for (int i = 0; i < array.length; i++) {
//            list.add(array[i]);
//        }
//        return list;
//    }
//
//    public List<Integer> toIntegerArrayList(int[] array) {
//        List<Integer> list = new ArrayList<Integer>();
//        for (int i = 0; i < array.length; i++) {
//            list.add(array[i]);
//        }
//        return list;
//    }
//
//    public List<Integer> toConvertStringNumbersToList(String str) {
//        List<Integer> numbers = new LinkedList<Integer>();
//        Pattern p = Pattern.compile("\\d+");
//        Matcher m = p.matcher(str);
//        while (m.find()) {
//            numbers.add(Integer.parseInt(m.group()));
//        }
//        return numbers;
//    }
//
//    public static int[] toIntArray(double[] vector) {
//        int n = vector.length;
//        int[] result = new int[n];
//        for (int i = 0; i < n; i++) {
//            result[i] = (int) vector[i];
//        }
//        return result;
//    }
//
//    public static int[] toIntArray(Collection<Integer> collection) {
//        int n = collection.size();
//        int[] result = new int[n];
//        int index = 0;
//        for (Integer element : collection) {
//            result[index] = element;
//            index++;
//        }
//        return result;
//    }
//
//    public static double[] toSortAscending(double[] vector) {
//        double[] arr1 = java.util.Arrays.copyOf(vector, vector.length);
//        java.util.Arrays.sort(arr1);
//        return arr1;
//    }
//
//    public static String toString(int[] array) {
//        verifyNonNull(array);
//        StringBuilder builder = new StringBuilder();
//        builder.append('[');
//        for (int i = 0; i < array.length; i++) {
//            if (i > 0) {
//                builder.append(", ");
//            }
//            builder.append(array[i]);
//        }
//        builder.append("]");
//        return builder.toString();
//    }
//
//    public static int sum(Collection<Integer> values) {
//        return sum(toIntArray(values));
//    }
//
//    public static int sum(int[] values) {
//        int sum = 0;
//        for (int v : values) {
//            sum += v;
//        }
//        return sum;
//    }
//
//    public static String toString(Collection<int[]> list) {
//        StringBuilder builder = new StringBuilder();
//        builder.append('{');
//        for (int[] element : list) {
//            builder.append(toString(element));
//            builder.append("\n");
//        }
//        builder.append('}');
//        return builder.toString();
//    }
//
//    public static double[] toDoubleArray(int[] vector) {
//        int n = vector.length;
//        double[] result = new double[n];
//        for (int i = 0; i < n; i++) {
//            result[i] = vector[i];
//        }
//        return result;
//    }
//
//
//    public Integer[] toReverseIntegerArray(Integer[] numbers) {
//        List<Integer> list = Arrays.asList(numbers);
//        Collections.reverse(list);
//        numbers = (Integer[]) list.toArray();
//        Arrays.sort(numbers = (Integer[]) list.toArray());
//        for (Integer integer : numbers) {
//            System.out.println(integer);
//        }
//        return numbers;
//    }
//
//    public String[] toStringArray(String[] names) {
//        List<String> list = Arrays.asList(names);
//        names = (String[]) list.toArray();
//        // for (String string : names) {
//        // System.out.println(string);
//        // }
//        return names;
//    }
//
//
//    public static String toString(double[] array) {
//        verifyNonNull(array);
//        StringBuilder builder = new StringBuilder();
//        builder.append('[');
//        for (int i = 0; i < array.length; i++) {
//            if (i > 0) {
//                builder.append(", ");
//            }
//            builder.append(array[i]);
//        }
//        builder.append("]");
//        return builder.toString();
//    }
}
