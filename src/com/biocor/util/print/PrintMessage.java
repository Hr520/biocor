package com.biocor.util.print;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import com.biocor.util.Const;
public class PrintMessage {
	
	public static void main(String[] args) {
		//pmRequest();//查询打印机状态

		StringBuffer sb = new StringBuffer("");
		sb.append("点菜清单\r");
		sb.append("----------------------\r");
		sb.append("联系人：测试打印\r");
		sb.append("电话：13408086368\r");
		sb.append("用餐时间：2015-04-09 13:01-13:30\r");
		sb.append("用餐地址：打印测试\r");
		sb.append("----------------------\r");
		sb.append("菜品明细\r\r");
		sb.append("1.麻辣牛肉(1份)\r");
		sb.append("2.极品鲜毛肚(1份)\r");
		sb.append("3.精品千层肚(1份)\r");
		sb.append("4.金针肥牛卷(1份)\r");
		sb.append("5.水晶牛肉(1份)\r");
		sb.append("6.一次性牛油红锅（中辣）(1份)\r");
		sb.append("7.干碟(1份)\r");
		sb.append("8.油碟(葱蒜香菜盐味精耗油醋、碗筷)(1份)\r");
		sb.append("9.鹌鹑蛋(1份)\r");
		sb.append("10.脆皮肠(1份)\r");
		sb.append("11.带鱼(1份)\r");
		sb.append("12.耗儿鱼(1份)\r");
		sb.append("13.金针菇(1份)\r");
		sb.append("14.豆皮(1份)\r");
		sb.append("15.冬瓜(1份)\r");
		sb.append("16.豆芽(1份)\r");
		sb.append("17.脆皮香蕉(1份)\r");
		sb.append("18.麻圆(1份)\r");
		sb.append("19.大唯怡(1份)\r");
		sb.append("----------------------\r");
		sb.append("器具明细\r\r");
		sb.append("电磁炉：1\r");
		sb.append("锅具、汤勺、漏勺：1\r");
		sb.append("插线板：0\r");
		sb.append("----------------------\r");
		sb.append("客户备注\r\r");
		sb.append("无备注\r");
		sb.append("----------------------\r");
		sb.append("器具押金：170元\r");
		sb.append("外送费用：20.00元\r");
		sb.append("菜品金额：272元\r");
		sb.append("应付金额：462.0元\r"); 		
		sb.append("<right>合计：81.0</right>"); 		
		System.out.println(sb.toString());
		
		try{
			String machine_code="4004514561";//打印机终端号
			String mKey="ix27w288tkc8";//打印机密钥
			PrintMessage.sendContent(Const.YP_PARTNER,Const.YP_APIKEY,machine_code,mKey,sb.toString());//打印消息
			//sendRequest(sb.toString());//打印消息
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	 
	
	/***
	 * 
	 * @param partner  //用户id
	 * @param apiKey   //用户秘钥
	 * @param machine_code //终端号
	 * @param mKey  终端秘钥
	 * @param content 打印内容
	 * @return
	 */
	public static boolean sendContent(String partner,String apiKey,String machine_code,String mKey,String content){
		try{
		Map<String,String> params=new HashMap<String,String>();
		params.put("partner", partner);
		params.put("machine_code", machine_code);
		String time = String.valueOf(System.currentTimeMillis());
		params.put("time", time);
		String sign=signRequest(params,mKey);
		StringBuffer sb = new StringBuffer("<q>"+Const.YP_QRIMAGEURL+"</q>"); //添加二维码
		content=content+sb.toString();
		content = java.net.URLEncoder.encode(content, "utf-8");
		System.out.println(content);
		byte[] data = ("partner="+partner+"&machine_code="+machine_code+"&content="+content+"&sign="+sign+"&time="+time).getBytes();
		System.out.println("data:"+data.toString());
		URL url = new URL("http://open.10ss.net:8888");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setConnectTimeout(5 * 1000);
		conn.setDoOutput(true);
		conn.setRequestProperty("Content-Type","text/html; charset=utf-8");
		conn.setRequestProperty("Content-Length",String.valueOf(data.length));
		
		//获取输出流
		OutputStream outStream = conn.getOutputStream();
		//传入参数
		outStream.write(data);
		outStream.flush();
		outStream.close();

		
		//获取输入流
		InputStream is = conn.getInputStream();
		
		System.out.println(conn.getResponseCode());
		if (conn.getResponseCode() == 200) {
			int i = -1;
			byte[] b = new byte[1024];
			StringBuffer result = new StringBuffer();
			while ((i = is.read(b)) != -1) {
				result.append(new String(b, 0, i));
			}
			
			String sub = result.toString();
			if(sub.equals("1")){//数据已经发送到客户端
				System.out.println("打印成功");
				return true;
			}else{
				System.out.println("打印失败,返回值："+result);
				return false;
			}
		}
		return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 打印签名
	 * @param params
	 * @param mKey
	 * @return
	 */
	public static String signRequest(Map<String,String> params,String mKey){
		Map<String,String> sortedParams=new TreeMap<String,String>();
		sortedParams.putAll(params);
		Set<Map.Entry<String,String>> paramSet=sortedParams.entrySet();
		StringBuilder query=new StringBuilder();
		query.append(Const.YP_APIKEY);
		for (Map.Entry<String, String> param:paramSet) {
			query.append(param.getKey());
			query.append(param.getValue());
		}
		query.append(mKey);
		String encryptStr=PMD5.MD5Encode(query.toString()).toUpperCase();
		return encryptStr;
	}
}
