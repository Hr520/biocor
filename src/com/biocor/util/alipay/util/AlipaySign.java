package com.biocor.util.alipay.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.biocor.util.alipay.config.AlipayConfig;
import com.biocor.util.alipay.sign.RSA;

public class AlipaySign {

	//签名
	public static String getSign(String orderNo,double money){
		String[] params ={
		    "partner=\""+AlipayConfig.partner+"\"",
			"seller_id=\"kingwing@xinzhiqing.cn\"",
			"out_trade_no=\""+orderNo+"\"",
			"subject=\"山莓订单\"",
			"body=\"山莓订单\"",
			"total_fee=\""+money+"\"",
			"notify_url=\""+AlipayConfig.notify_url+"\"",
			"service=\"mobile.securitypay.pay\"",
			"payment_type=\"1\"",
			"_input_charset=\""+AlipayConfig.input_charset+"\"",
			"it_b_pay=\"30m\"",
			"show_url=\"m.alipay.com\""
		};
		String result = signAllString(params);
		System.out.println( result );
		return result;
	}
	
	private static String signAllString(String [] array){
		StringBuffer sb = new StringBuffer("");
		for (int i = 0; i < array.length; i++) {
			if (i == (array.length - 1)) {
				sb.append(array[i]);
			} else {
				sb.append(array[i] + "&");
			}
		}
		String sign = "";
		try {
			sign = URLEncoder.encode(
					RSA.sign(sb.toString(), AlipayConfig.private_key, "utf-8"),
					"utf-8");// private_key私钥
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		sb.append("&sign=\"" + sign + "\"&");
		sb.append("sign_type=\"RSA\"");
		return sb.toString();
	}
	
	
	public static void main(String[] args){

		Map<String, String> params = new HashMap<String, String>();
		params.put("buyer_id", "2088102978048784");
		params.put("trade_no", "2016092321001004780261280863");
		params.put("body", "љࠍ֩ե");
		params.put("use_coupon", "N");
		params.put("notify_time", "2016-09-23 16:35:16");
		params.put("subject", "љࠍ֩ե");
		params.put("sign_type", "RSA");
		params.put("is_total_fee_adjust", "N");
		params.put("notify_type", "trade_status_sync");
		params.put("out_trade_no", "BK20160923163503894619");
		params.put("discount", "0.00");
		params.put("sign", "cqcGX0+g4uBPHrNDmu0TwPTTmBNXkuFvFU0RiHlzYtFUmoRAHMc913sl8Lc8WhST/kWgsV1eJlk+WqXn1E5Q8pHj2t1qfe1pLfR3cc5qBK0GfLR0eZf3P1beOqSC8Ku6WYC/GnbHLE1sIf207o3PwE0W2WMeeZPloSHmHWuKqEU=");
		params.put("buyer_email", "ganlin1472@163.com");
		params.put("gmt_create", "2016-09-23 16:35:15");
		params.put("price", "0.01");
		params.put("total_fee", "0.01");
		params.put("quantity", "1");
		
		params.put("seller_id", "2088421638206332");
		params.put("notify_id", "c72cb3b3cf3abb8614bc16d2360c975m0q");
		params.put("seller_email", "xishuaibaojian@163.com");
		params.put("payment_type", "1");

		System.out.println(AlipayNotify.verify(params) );
	}
	
	
}
