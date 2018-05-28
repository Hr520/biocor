package com.biocor.util.wx;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.biocor.util.wx.util.ConstantUtil;
import com.biocor.util.wx.util.WXUtil;

public class WxSign {

	public static Map<String, Object> createSign(HttpServletRequest request,
			HttpServletResponse response, String out_trade_no, String money) {

		Map<String, Object> res = new HashMap<String, Object>();
		Map<String, String> result = new HashMap<>();
		
		PrepayIdRequestHandler prepayReqHandler = new PrepayIdRequestHandler(request, response);// 获取prepayid的请求类
		ClientRequestHandler clientHandler = new ClientRequestHandler(request,response);// 返回客户端支付参数的请求类

		try {
			String noncestr = WXUtil.getNonceStr();
			String timestamp = WXUtil.getTimeStamp();

			// 设置获取prepayid支付参数
			prepayReqHandler.setParameter("appid", ConstantUtil.APP_ID);
			prepayReqHandler.setParameter("attach", "山莓订单");
			prepayReqHandler.setParameter("body", "山莓订单");
			prepayReqHandler.setParameter("mch_id", ConstantUtil.PARTNER);
			prepayReqHandler.setParameter("nonce_str", noncestr);
			prepayReqHandler
					.setParameter("notify_url", ConstantUtil.notify_url);
			prepayReqHandler.setParameter("out_trade_no", out_trade_no);
			prepayReqHandler.setParameter("spbill_create_ip", "127.0.0.1");
			prepayReqHandler.setParameter("total_fee", money);
			prepayReqHandler.setParameter("trade_type", "APP");

			// 生成获取预支付签名
			String sign = prepayReqHandler.createMD5Sign();
			// 增加非参与签名的额外参数
			prepayReqHandler.setParameter("sign", sign);
			// 获取prepayId
			result = prepayReqHandler.sendPrepay();
			String prepayid = result.get("prepay_id").toString();
			// 吐回给客户端的参数
			if (null != prepayid && !"".equals(prepayid)) {
				// 输出参数列表
				Map<String, String> map = new HashMap<String, String>();
				map.put("appid", ConstantUtil.APP_ID);
				map.put("noncestr", noncestr);
				map.put("package", "Sign=WXPay");
				map.put("partnerid", ConstantUtil.PARTNER);
				map.put("prepayid", prepayid);
				map.put("timestamp", timestamp);

				clientHandler.setParameter("appid", ConstantUtil.APP_ID);
				clientHandler.setParameter("noncestr", noncestr);
				clientHandler.setParameter("package", "Sign=WXPay");
				clientHandler.setParameter("partnerid", ConstantUtil.PARTNER);
				clientHandler.setParameter("prepayid", prepayid);
				clientHandler.setParameter("timestamp", timestamp);
				// 生成签名
				sign = clientHandler.createMD5Sign();
				map.put("sign", sign);

				res.put("map", map);
				res.put("state", "0");
				res.put("msg", "请求成功");

			} else {
				res.put("state", "1");
				res.put("msg", "预订单未生成");
			}
		} catch (Exception e) {
			res.put("state", "1");
			res.put("msg", result.get("err_code_des"));
			e.printStackTrace();
		}
		return res;
	}

	/***
	 * XML 转map
	 * 
	 * @param xml
	 * @return
	 * @throws Exception
	 */
	public static Map<String, String> parseXml(String xml) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		Document document = DocumentHelper.parseText(xml);
		Element root = document.getRootElement();
		List<Element> elementList = root.elements();
		for (Element e : elementList)
			map.put(e.getName(), e.getText());
		return map;
	}

}
