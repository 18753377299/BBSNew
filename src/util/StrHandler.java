package util;

/**
 *<h4>功能描述：字符串处理器 </h4>
 *<h5><pre>
 *author lsy
 *date 2014年11月17日
 *version 1.0
 *email lishengyuan11@foxmail.com
 *</pre></h5>
 */
public class StrHandler {
	/**
	 * 去掉字符串str首尾空格，如果str为null、"null",则返回""(空串).
	 * @param str 待去空字符串
	 * @return 去掉了首尾空格的字符串
	 */
	public static String trim(String str){
		if(null == str)
			return "";
		str = str.trim();
		if(str.equalsIgnoreCase("null"))
			return "";
		return str;
	}
	
	/**
	 * 判断字符串是否为""、null、"null".
	 * @param str 待测字符串
	 * @return true/false
	 */
	public static boolean isEmpty(String str){
		return "".equals(StrHandler.trim(str))?true:false;
	}
	/**
	 * 判断字符串是否 不为""、null、"null".
	 */
	public static boolean isNotEmpty(String str){
		return !StrHandler.isEmpty(str);
	}
	
	/**
	 * 判断字符串str是否是纯数字串(0-9).
	 * @param str 待判断字符串
	 * @return true/false
	 */
	public static boolean isNumber(String str){
		return str==null?false:str.matches("\\d+");
	}
	/**
	 * 判断字符串str是否是纯字母串(a-z||A-Z).
	 * @param str 待判断字母串
	 * @return true/false
	 */
	public static boolean isLetter(String str){
		return str==null?false:str.matches("[a-zA-Z]+");
	}
	/**
	 * 判断字符串str是否是单词字符串(0-9||a-z||A-Z||_).
	 * @param str 待判断字符串
	 * @return true/false
	 */
	public static boolean isWord(String str){
		return str==null?false:str.matches("\\w+");
	}
	
	/**
	 * 判断两字符串是否  相等
	 * @param src 字符串1
	 * @param dest 字符串2
	 * @return 两串相等，返回true
	 */
	public static boolean equals(String src,String dest){
		if(src==null)
			return dest==null?true:false;
		else
			return src.equals(dest);
	}
	/**
	 * 判断两字符串是否  不相等
	 */
	public static boolean notEquals(String src,String dest) {
		return !equals(src,dest);
	}
	
	/**
	 * 将字符串首字母大写
	 * @param str
	 * @return Str
	 */
	public static String toTitleCase(String str){
		if(isEmpty(str))
			return str;
		char ch = str.charAt(0);
		if(ch>='a'&&ch<='z')
			ch -= 32;
		return ch+str.substring(1);
	}
	/**
     * 将空串（null,"","null"）转换为"&nbsp;",用于页面中字符串的显示.
     */
    public static String v2nbsp(String str) {
        return trim(str).equals("")?"&nbsp":str;
    }
}
