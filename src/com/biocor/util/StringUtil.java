package com.biocor.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class StringUtil {

	public static int getTotalPage(int totalCount, int everypage) {
		int totalPage = 0;
		if (totalCount % everypage == 0)
			totalPage = totalCount / everypage;
		else
			totalPage = totalCount / everypage + 1;
		return totalPage;
	}

	public static boolean isNull(String b) {
		boolean result = false;
		if ("".equals(b) || b == null) {
			result = true;
		}
		return result;
	}

	private static long orderNum = 0l;
	private static String date;

	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}

	public static synchronized String getOrderNo() {
		String str = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		Random random = new Random();

		int x = random.nextInt(899999);

		return str + String.valueOf(x+100000);
	}

	public static void main(String[] args) {
		String s = StringUtil.getOrderNo();
		System.out.println(s+","+s.length());
	}
}
