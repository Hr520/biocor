package com.biocor.controller.admin.print;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biocor.controller.base.BaseController;
import com.biocor.service.admin.orders.OrdersService;
import com.biocor.service.admin.print.PrintService;
import com.biocor.util.Const;
import com.biocor.util.PageData;
import com.biocor.util.print.PrintMessage;
@Controller
@RequestMapping(value = "interface/print")
public class PrintInfoController extends BaseController{

	@Resource(name = "ordersService")
	private OrdersService ordersService;
	
	@Resource(name="printService")
	private PrintService printService;
	
	@RequestMapping("/info")
	@ResponseBody 
	public void printInfo(HttpServletRequest request,HttpServletResponse response){
		try {
			StringBuffer sb = new StringBuffer("");
			String  orderNo=request.getParameter("orderNo");
			PageData res = new PageData();
			//查询订单详情
			PageData pd = new PageData();
			pd.put("orderNo", orderNo);
			res = ordersService.findOrdersInfo(pd);
			//查询订单所有商品
			pd = new PageData();
			pd.put("orderNo", orderNo);
			List<PageData> list = ordersService.findOrdersGoods(pd);
			sb.append(res.get("order_shopName")+"\r\r");
			sb.append("----------------------\r");
			sb.append("订单时间："+(res.getString("order_date"))+"\r");
			sb.append("订单号："+orderNo+"\r");
			switch (res.getString("order_pay_type").toString()) {
			case "0":
				sb.append("支付类型：现金\r");
				break;
			case "1":
				sb.append("支付类型：支付宝\r");
				break;
			case "2":
				sb.append("支付类型：微信\r");
				break;
			case "3":
				sb.append("支付类型：余额\r");
				break;
			}
			sb.append("----------------------\r");
			sb.append("菜品明细\r\r");
			for (int i=0;i<list.size();i++){
				PageData p= list.get(i);
				String name=p.get("od_goodsName").toString();
				String num=p.get("od_goodsNum").toString();
				sb.append((i+1)+"."+name+"("+num+"/份)"+"\r");
			}
			sb.append("<right>合计："+res.get("order_money").toString()+"</right>"+"\r");
			sb.append("----------------------\r");
			sb.append("其他信息\r");
			sb.append("订单类型："+(res.getString("order_type").equals("0")?"预定点餐":"点餐")+"\r");
			sb.append("就餐时间:："+(res.getString("order_repast_date")));
			//根据订单号查询商铺打印信息
			PageData ps= printService.findPintInfo(orderNo);
			String machine_code=ps.getString("machine_code");//打印机终端号
			String mKey=ps.getString("mKey");//打印机密钥
			PrintMessage.sendContent(Const.YP_PARTNER,Const.YP_APIKEY,machine_code,mKey, sb.toString());//打印消息
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		
	}
}
