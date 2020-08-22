package com.recruit.util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtils {

	/**
	 * 获取当前时间
	 */
	public static String getCurrentTime() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}
	/**
	 * 判断是否为空
	 * @param str
	 * @return
	 */
	public static boolean isNotNull(String str) {
		return str != null && !"".equals(str);
	}
	/**
	 * 转编码
	 * @param str
	 * @return
	 */

	public static String toUTF8(String str) {
		try {
			return isNotNull(str)?new String(str.getBytes("ISO-8859-1"),"UTF-8"):null;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}
}
