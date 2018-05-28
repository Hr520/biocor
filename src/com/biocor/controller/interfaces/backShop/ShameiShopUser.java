package com.biocor.controller.interfaces.backShop;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.shoping.backGoodsType;
import com.biocor.service.interfaces.backShop.ShameiShopUserService;
import com.biocor.util.Constants;
import com.biocor.util.General;
import com.biocor.util.PageData;
import com.biocor.util.ResponseEntity;
import com.biocor.util.push.JPushshanmei;

import net.sf.json.JSONObject;

@Controller

/**
 * 
 * @author Administrator 山莓商户端app用户模块
 */
@RequestMapping(value = "interface/ShopUser")
public class ShameiShopUser extends BaseController {
	// 商户用户登录

	@Resource
	private ShameiShopUserService shopuserService;

	@RequestMapping(value = "SHOPuserlogin")
	@ResponseBody
	public ResponseEntity<?> userLogin(HttpServletRequest request) {
		// 获取用户传递的参数
		PageData pd = new PageData();
		String login_name = request.getParameter("name");
		String password = request.getParameter("pwd");
		// 设备唯一标识码
		String onlycode = request.getParameter("onlycode");
		// 加密用户的登录密码
		password = new SimpleHash("SHA-1", login_name, password).toString();
		try {
			// 根据用户民称查询用户的密码
			pd.put("login_name", login_name);
			// 查询用户相关信息
			pd = shopuserService.getUserPwd(pd);
			// 根据用户相关信息再查询出店铺的相关信息
			if (onlycode != null && onlycode != "") {
				if (pd == null || pd.equals("")) {
					pd = new PageData();
					return new ResponseEntity<PageData>().setState(Constants.FAILED).setData(pd).setMsg("用户不存在");
				} else {
					if (password.equals(pd.get("password").toString())) {
						// 密码正确写入onlycode推送给原来的code
						String onlycodes = pd.get("onlycode").toString();
						if (onlycodes != null && !onlycodes.equals("")) {
							// 设备id之前存在
							// 如果登录状态在线才发出该推送消息
							String login = pd.get("login_state").toString();
							if (login.equals("0")) {
								// 直接登录
								PageData pd2 = new PageData();
								pd2.put("id", pd.get("id").toString());
								pd2.put("login_state", 1);
								pd2.put("onlycode", onlycode);
								// 写入用户登录信息登录成功
								shopuserService.ShopUSerlogin(pd2);
								String shop_id = pd.get("shop_id").toString();
								PageData pd3 = new PageData();
								pd3.put("shop_id", shop_id);
								// 根据店铺id查询到店铺相关的订单交易数据
								pd3 = shopuserService.getSHOpperINfo(pd3);
								pd.remove("password");
								pd.remove("onlycode");
								pd.put("order_total", pd3.get("order_total").toString());
								pd.put("total_moeny", pd3.get("total_moeny").toString());
								return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd)
										.setMsg("登录成功");
							} else {
								// 修改用户状态为下线

								PageData pd2 = new PageData();
								if (onlycodes.equals(onlycode)) {
									String id = pd.get("id").toString();
									int login_state = 1;
									pd2 = new PageData();
									pd2.put("id", id);
									pd2.put("login_state", login_state);
									pd2.put("onlycode", onlycode);
									// 写入用户登录信息登录成功
									shopuserService.ShopUSerlogin(pd2);
									String shop_id = pd.get("shop_id").toString();
									PageData pd3 = new PageData();
									pd3.put("shop_id", shop_id);
									// 根据店铺id查询到店铺相关的订单交易数据
									pd3 = shopuserService.getSHOpperINfo(pd3);
									pd.remove("password");
									pd.remove("onlycode");
									pd.put("order_total", pd3.get("order_total").toString());
									pd.put("total_moeny", pd3.get("total_moeny").toString());
									return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd)
											.setMsg("登录成功");
								} else {
									JPushshanmei.sendByRegisterId("该账号已在其他设备登录", onlycodes);
								    pd2 = new PageData();
									pd2.put("id", pd.get("id").toString());
									pd2.put("login_state", 0);
									pd2.put("onlycode", onlycodes);
									shopuserService.ShopUSerlogin(pd2);
									String id = pd.get("id").toString();
									int login_state = 1;
									pd2 = new PageData();
									pd2.put("id", id);
									pd2.put("login_state", login_state);
									pd2.put("onlycode", onlycode);
									// 写入用户登录信息登录成功
									shopuserService.ShopUSerlogin(pd2);
									String shop_id = pd.get("shop_id").toString();
									PageData pd3 = new PageData();
									pd3.put("shop_id", shop_id);
									// 根据店铺id查询到店铺相关的订单交易数据
									pd3 = shopuserService.getSHOpperINfo(pd3);
									pd.remove("password");
									pd.remove("onlycode");
									pd.put("order_total", pd3.get("order_total").toString());
									pd.put("total_moeny", pd3.get("total_moeny").toString());
									return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd)
											.setMsg("登录成功");
								}

							}

						} else {
							// 直接登录
							PageData pd2 = new PageData();
							pd2.put("id", pd.get("id").toString());
							pd2.put("login_state", 1);
							pd2.put("onlycode", onlycode);
							// 写入用户登录信息登录成功
							shopuserService.ShopUSerlogin(pd2);
							String shop_id = pd.get("shop_id").toString();
							PageData pd3 = new PageData();
							pd3.put("shop_id", shop_id);
							// 根据店铺id查询到店铺相关的订单交易数据
							pd3 = shopuserService.getSHOpperINfo(pd3);
							pd.remove("password");
							pd.remove("onlycode");
							pd.put("order_total", pd3.get("order_total").toString());
							pd.put("total_moeny", pd3.get("total_moeny").toString());
							return new ResponseEntity<PageData>().setState(Constants.SUCCESS).setData(pd)
									.setMsg("登录成功");
						}
					} else {
						pd = new PageData();
						return new ResponseEntity<PageData>().setState(Constants.EXCEPTION).setData(pd).setMsg("密码错误");
					}
				}
			} else {
				// 原因是因为没有设备唯一码
				pd = new PageData();
				return new ResponseEntity<PageData>().setState(Constants.EXCEPTION).setData(pd).setMsg("登录失败");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询菜品管理列表
	@RequestMapping(value = "getShopGoodSBYtypelist")
	@ResponseBody
	public ResponseEntity<?> getShopGoodSBYtypelist(HttpServletRequest request) {
		// 传入店铺id
		String shop_id = request.getParameter("shop_id");
		String type = request.getParameter("type");
		PageData pd = new PageData();
		pd.put("shop_id", shop_id);
		int id = 0;
		try {
			if (type != null && !type.equals("")) {
				// 查询上架
				pd.put("type", type);
				List<backGoodsType> listGoods = shopuserService.getGOOdlistByshop(pd);
				for (int i = 0; i < listGoods.size(); i++) {
					for (int j = 0; j < listGoods.get(i).getGoods().size(); j++) {
						id = listGoods.get(i).getGoods().get(j).getGid();
						PageData pd2 = new PageData();
						pd2.put("gid", id);
						// 查询当前的菜品已经销售的份数
						int salesCount = shopuserService.getGoodsTotal(pd2);
						listGoods.get(i).getGoods().get(j).setSalesCount(salesCount);
					}
				}
				return new ResponseEntity<List<backGoodsType>>().setState(Constants.SUCCESS).setData(listGoods)
						.setMsg("数据获取成功");
			} else {
				// 查询未上架
				List<backGoodsType> listGoods = shopuserService.getGOOdlistByshop(pd);
				for (int i = 0; i < listGoods.size(); i++) {
					for (int j = 0; j < listGoods.get(i).getGoods().size(); j++) {
						id = listGoods.get(i).getGoods().get(j).getGid();
						PageData pd2 = new PageData();
						pd2.put("gid", id);
						// 查询当前的菜品已经销售的份数
						int salesCount = shopuserService.getGoodsTotal(pd2);
						listGoods.get(i).getGoods().get(j).setSalesCount(salesCount);
					}
				}
				return new ResponseEntity<List<backGoodsType>>().setState(Constants.SUCCESS).setData(listGoods)
						.setMsg("数据获取成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 查询店铺下所有的菜品类型
	@RequestMapping(value = "getShopbygoodslist")
	@ResponseBody
	public ResponseEntity<?> getShopbygoodslist(HttpServletRequest request) {
		PageData pd = new PageData();
		try {
			List<PageData> list = new ArrayList<>();
			// 查询系统下所有的菜品类型
			list = shopuserService.getShopbygoodslist(pd);
			if (list.size() > 0) {
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据获取成功");
			} else {
				return new ResponseEntity<List<PageData>>().setState(Constants.FAILED).setData(list).setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 新增菜品
	@RequestMapping(value = "AddGoods")
	@ResponseBody
	public ResponseEntity<?> AddGoods(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		String t_id = request.getParameter("t_id");
		PageData pd = new PageData();
		try {
			// 获取商品其他信息
			String goods_name = request.getParameter("goods_name");
			String goods_moeny = request.getParameter("goods_moeny");
			String goods_taste = request.getParameter("goods_taste");
			String goods_remark = "/份";
			String goods_images = request.getParameter("goods_images");
			String goods_dis_money = request.getParameter("goods_dis_money");
			if (goods_moeny != null && goods_moeny != "") {
			} else {
				goods_moeny = String.valueOf(0);
				Integer.parseInt(goods_moeny);
			}
			if (goods_dis_money != null && goods_dis_money != "") {
			} else {
				goods_dis_money = String.valueOf(0);
				Integer.parseInt(goods_dis_money);
			}

			pd.put("goods_name", goods_name);
			pd.put("shop_id", shop_id);
			pd.put("t_id", t_id);
			pd.put("goods_moeny", goods_moeny);
			pd.put("goods_taste", goods_taste);
			pd.put("goods_remark", goods_remark);
			pd.put("goods_images", goods_images);
			pd.put("goods_dis_money", goods_dis_money);
			// 新增菜品
			shopuserService.AddGoods(pd);
			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("新增成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 图片上传通用方法
	/**
	 * 上传 图片，文件，视频
	 * 
	 * @param request
	 * @param response
	 * @param files
	 * @param folder
	 * @return
	 */
	@RequestMapping(value = "upload")
	@ResponseBody
	public void upload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "files", required = false) MultipartFile[] files, String folder) {
		response.setContentType("text/html;charset=UTF-8"); // 目的是为了控制浏览器的行为，即控制浏览器用UTF-8进行解码；
		response.setCharacterEncoding("UTF-8"); // 的目的是用于response.getWriter()输出的字符流的乱码问题，如果是response.getOutputStream()是不
		JSONObject jsonObject = new JSONObject();
		PrintWriter out = null;
		String state = "";
		String msg = "";
		String imgurl = "";
		try {
			out = response.getWriter();
			int i = 0;
			for (MultipartFile f : files) {
				String fileName = f.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				String fileEnd = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				fileName = uuid + "." + fileEnd;

				String str = request.getSession().getServletContext().getRealPath("/");
				String url = str + "upload/img/" + folder + "/";

				File targetFile = new File(url, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}

				f.transferTo(targetFile);
				if (i == 0) {
					imgurl = "upload/img/" + folder + "/" + fileName;
				} else {
					imgurl = imgurl + "," + "upload/img/" + folder + "/" + fileName;
				}
				i++;
			}
			state = General.SUCCESS;
			msg = "请求成功";

		} catch (Exception e) {
			state = General.ERROR_2001;
			msg = "系统错误";
			logger.info("interface----upload:e=" + e);
			return;
		} finally {
			JSONObject data = new JSONObject();
			data.put("imgurl", imgurl);
			jsonObject.put("state", state);
			jsonObject.put("msg", msg);
			jsonObject.put("data", data);
			out.print(jsonObject);
			out.flush();
			out.close();
		}
	}

	// 菜品上架下架售罄改价
	@RequestMapping(value = "updateGoods")
	@ResponseBody
	public ResponseEntity<?> updateGoods(HttpServletRequest request) {
		String gid = request.getParameter("gid");
		// 钱或者积分数量
		String Moneyintegral = request.getParameter("Moneyintegral");
		PageData pd = new PageData();
		pd.put("gid", gid);
		// 判定是否为积分菜
		try {
			pd = shopuserService.getgoodSType(pd);
			int isJIfen = Integer.parseInt(pd.get("jifen").toString());
			// 接收修改的参数类型
			Integer type = Integer.parseInt(request.getParameter("type"));
			if (type == 1) {
				// 上架
				// 先判定菜品是否是已经上架过的菜品
				if (Integer.parseInt(pd.get("goods_ISshelves").toString()) != 0) {
					// 商品之前上架过，无需审核直接上架
					pd = new PageData();
					pd.put("gid", gid);
					pd.put("goods_ISshelves", 1);
					shopuserService.updateGOODsshelves(pd);
					return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("上架成功");
				} else {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("商品在审核中,不可执行该操作");
				}

			} else if (type == 2) {
				if (Integer.parseInt(pd.get("goods_ISshelves").toString()) == 0) {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData("")
							.setMsg("该商品还未上架过，不可执行该操作");
				}
				// 下架

				// 判断商品是否是售罄状态如果是给定状态为
				if (Integer.parseInt(pd.get("goods_ISshelves").toString()) == 3) {
					pd.put("goods_ISshelves", 2);
				} else {
					pd.put("goods_ISshelves", 2);
				}
				pd.put("gid", gid);

				shopuserService.updateGOODsshelves(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("下架成功");
			} else if (type == 3) {
				if (isJIfen > 0) {
					if (Integer.parseInt(pd.get("goods_ISshelves").toString()) == 0) {
						return new ResponseEntity<String>().setState(Constants.FAILED).setData("")
								.setMsg("该菜品在上架审核中，不可执行该操作");
					}
					// 是积分菜修改积分价格
					pd = new PageData();
					pd.put("gid", gid);
					pd.put("goods_dis_money", Moneyintegral);
					pd.put("goods_moeny", 0);
					// 修改菜品价格
					shopuserService.updaGoodsByMoneyintegral(pd);
					// 写入菜品修改价格历史
					shopuserService.insertGoodsMoneyUPdateinfo(pd);
					return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("价格修改成功");
				} else {
					if (Integer.parseInt(pd.get("goods_ISshelves").toString()) == 0) {
						return new ResponseEntity<String>().setState(Constants.FAILED).setData("")
								.setMsg("该菜品在上架审核中，不可执行该操作");
					}
					// 不是积分菜修改商品价格
					pd = new PageData();
					pd.put("gid", gid);
					pd.put("goods_dis_money", 0);
					pd.put("goods_moeny", Moneyintegral);
					shopuserService.updaGoodsByMoneyintegral(pd);
					shopuserService.insertGoodsMoneyUPdateinfo(pd);
					return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("价格修改成功");
				}

			} else if (type == 4) {
				if (Integer.parseInt(pd.get("goods_ISshelves").toString()) == 0) {
					return new ResponseEntity<String>().setState(Constants.FAILED).setData("")
							.setMsg("该菜品在上架审核中，不可执行该操作");
				}
				// 菜品售罄
				if (Integer.parseInt(pd.get("goods_ISshelves").toString()) == 2) {
					pd.put("goods_ISshelves", -1);
				} else {
					pd.put("goods_ISshelves", 3);
				}

				pd.put("gid", gid);

				shopuserService.updateGOODsshelves(pd);
				return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("售罄成功");
			} else {
				return new ResponseEntity<String>().setState(Constants.FAILED).setData("").setMsg("输入参数有误 ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());

		}
	}

	// 菜品搜索当前店
	@RequestMapping(value = "sreachGoodslist")
	@ResponseBody
	public ResponseEntity<?> sreachGoodslist(HttpServletRequest request) {
		String shop_id = request.getParameter("shop_id");
		String goods_name = request.getParameter("goods_name");
		// 分页
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
			pd.put("shop_id", shop_id);
			pd.put("goods_name", goods_name);
			// 菜品搜索当前店结果集
			int salesCount = 0;
			list = shopuserService.getsreachGoodslist(pd);
			if (list.size() > 0) {
				// 遍历list取到菜品id
				for (int i = 0; i < list.size(); i++) {
					String gid = list.get(i).get("gid").toString();
					// 取到对应的菜品销售统计
					PageData pd2 = new PageData();
					pd2.put("gid", gid);
					salesCount = shopuserService.getGoodsTotal(pd2);
					list.get(i).put("salesCount", salesCount);
				}
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("数据查询成功");
			} else {
				return new ResponseEntity<List<PageData>>().setState(Constants.SUCCESS).setData(list).setMsg("暂无数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 商品修改
	@RequestMapping(value = "GoodsUPdate")
	@ResponseBody
	public ResponseEntity<?> GoodsUPdate(HttpServletRequest request) {
		String gid = request.getParameter("gid");
		// 修改菜品信息必须是售罄或者下架才能修改 修改后需要重新审核
		String t_id = request.getParameter("t_id");
		String goods_name = request.getParameter("goods_name");
		String goods_moeny = request.getParameter("goods_moeny");
		String goods_taste = request.getParameter("goods_taste");
		String goods_remark = "份";
		String goods_images = request.getParameter("goods_images");
		String goods_dis_money = request.getParameter("goods_dis_money");
		String goods_ISshelves = String.valueOf(0);
		String goodmoney=String.valueOf(0);
		PageData pd = new PageData();
		try {
			pd.put("goods_name", goods_name);
			pd.put("gid", gid);
			if(t_id.equals("10")){
				pd.put("goods_moeny", goodmoney);
				pd.put("goods_dis_money", goods_dis_money);
			}else {
				pd.put("goods_moeny", goods_moeny);
				pd.put("goods_dis_money", goodmoney);
				
			}
			pd.put("goods_taste", goods_taste);
			pd.put("goods_remark", goods_remark);
			pd.put("goods_images", goods_images);
			pd.put("goods_ISshelves", goods_ISshelves);
			pd.put("t_id", t_id);
			// 修改菜品修改菜品为申请上架中状态
			shopuserService.GoodsUPdate(pd);
			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("修改成功提交审核申请");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 用户退出登录
	@RequestMapping(value = "UserexitLogin")
	@ResponseBody
	public ResponseEntity<?> UserexitLogin(HttpServletRequest request) {
		String id = request.getParameter("id");
		PageData pd = new PageData();
		pd.put("id", id);
		try {
			// 用户退出
			shopuserService.UserexitLogin(pd);
			return new ResponseEntity<String>().setState(Constants.SUCCESS).setData("").setMsg("退出成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>().setState(Constants.ERROR).setData("").setMsg(e.getMessage());
		}

	}

	// 引导页
	@RequestMapping(value = "getwelcomeH5")
	@ResponseBody
	public ResponseEntity<?> getwelcomeH5(HttpServletRequest request) {
		String welcom = "upload/img/welcome/620cd046-9973-4482-8fcf-0d18a04aa870.png,upload/img/welcome/34caaf58-daf4-49ed-8fdf-cf05ceab1659.png";
		return new ResponseEntity<String>().setState(Constants.SUCCESS).setData(welcom).setMsg("数据获取成功");
	}

}
