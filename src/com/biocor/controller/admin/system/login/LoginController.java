package com.biocor.controller.admin.system.login;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.system.Menu;
import com.biocor.entity.system.Role;
import com.biocor.entity.system.User;
import com.biocor.service.admin.system.menu.MenuService;
import com.biocor.service.admin.system.role.RoleService;
import com.biocor.service.admin.system.user.UserService;
import com.biocor.util.AppUtil;
import com.biocor.util.Const;
import com.biocor.util.DateUtil;
import com.biocor.util.PageData;
import com.biocor.util.RightsHelper;
import com.biocor.util.StringUtil;
import com.biocor.util.Tools;
/*
 * 总入口
 */
@Controller
public class LoginController extends BaseController {

	@Resource(name="userService")
	private UserService userService;
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="roleService")
	private RoleService roleService;
	
	/**
	 * 获取登录用户的IP
	 * @throws Exception 
	 */
	public void getRemortIP(String USERNAME) throws Exception {  
		PageData pd = new PageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		pd.put("USERNAME", USERNAME);
		pd.put("IP", ip);
		userService.saveIP(pd);
	}  
	
	
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 请求登录，验证用户
	 */
	@RequestMapping(value="/login_login")
	@ResponseBody
	public Object login()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").split(",biocor,");
		
		if(null != KEYDATA && KEYDATA.length == 3){
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			String sessionCode = (String)session.getAttribute(Const.SESSION_SECURITY_CODE);		//获取session中的验证码
			
			String code = KEYDATA[2];
			if(null == code || "".equals(code)){
				errInfo = "nullcode"; //验证码为空
			}else{
				String USERNAME = KEYDATA[0];
				String PASSWORD  = KEYDATA[1];
				pd.put("USERNAME", USERNAME);
				if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)){
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	//密码加密
					pd.put("PASSWORD", passwd);
					pd = userService.getUserByNameAndPwd(pd);
					if(pd != null){
						pd.put("LAST_LOGIN",DateUtil.getTime().toString());
						userService.updateLastLogin(pd);
						User user = new User();
						user.setUSER_ID(pd.getString("USER_ID"));
						user.setUSERNAME(pd.getString("USERNAME"));
						user.setPASSWORD(pd.getString("PASSWORD"));
						user.setNAME(pd.getString("NAME"));
						user.setRIGHTS(pd.getString("RIGHTS"));
						user.setROLE_ID(pd.getString("ROLE_ID"));
						user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
						user.setIP(pd.getString("IP"));
						user.setSTATUS(pd.getString("STATUS"));
						user.setShopkeeper_id(pd.getString("shopkeeper_id"));
						session.setAttribute(Const.SESSION_USER, user);
						session.removeAttribute(Const.SESSION_SECURITY_CODE);
						
						//shiro加入身份验证
						Subject subject = SecurityUtils.getSubject(); 
					    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
					    try { 
					        subject.login(token); 
					    } catch (AuthenticationException e) { 
					    	e.printStackTrace();
					    	errInfo = "身份验证失败！";
					    }
					    
					}else{
						errInfo = "usererror"; 				//用户名或密码有误
					}
				}else{
					errInfo = "codeerror";				 	//验证码输入有误
				}
				if(Tools.isEmpty(errInfo)){
					errInfo = "success";					//验证成功
				}
			}
		}else{
			errInfo = "error";	//缺少参数
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 访问系统首页
	 */
	@RequestMapping(value="/main/{changeMenu}")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
	    JSONArray jsnoA = new JSONArray(); 
		try{
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			
			User user = (User)session.getAttribute(Const.SESSION_USER);
			if (user != null) {
				
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUSER_ID());
					session.setAttribute(Const.SESSION_USERROL, user);
				}else{
					user = userr;
				}
				Role role = user.getRole();
				String roleRights = role!=null ? role.getRIGHTS() : "";
				//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
				session.setAttribute(Const.SESSION_ROLE_RIGHTS, roleRights); 		//将角色权限存入session
				session.setAttribute(Const.SESSION_USERNAME, user.getUSERNAME());	//放入用户名
				
				List<Menu> allmenuList = new ArrayList<Menu>();
				
				if(null == session.getAttribute(Const.SESSION_allmenuList)){
					allmenuList = menuService.listAllMenu();
					if(Tools.notEmpty(roleRights)){
						for(Menu menu : allmenuList){
							menu.setHasMenu(RightsHelper.testRights(roleRights, menu.getMENU_ID()));
							if(menu.isHasMenu()){
								List<Menu> subMenuList = menu.getSubMenu();
								for(Menu sub : subMenuList){
									sub.setHasMenu(RightsHelper.testRights(roleRights, sub.getMENU_ID()));
								}
							}
						}
					}
					session.setAttribute(Const.SESSION_allmenuList, allmenuList);			//菜单权限放入session中
				}else{
					allmenuList = (List<Menu>)session.getAttribute(Const.SESSION_allmenuList);
				}
				
				//切换菜单=====
				List<Menu> menuList = new ArrayList<Menu>();
				//if(null == session.getAttribute(Const.SESSION_menuList) || ("yes".equals(pd.getString("changeMenu")))){
				if(null == session.getAttribute(Const.SESSION_allmenuList) || ("yes".equals(changeMenu))){
					List<Menu> menuList1 = new ArrayList<Menu>();
					List<Menu> menuList2 = new ArrayList<Menu>();
					
					//拆分菜单
					for(int i=0;i<allmenuList.size();i++){
						Menu menu = allmenuList.get(i);
						if("1".equals(menu.getMENU_TYPE())){
							menuList1.add(menu);
						}else{
							menuList2.add(menu);
						}
					}
					
					session.removeAttribute(Const.SESSION_allmenuList);
					if("2".equals(session.getAttribute("changeMenu"))){
						session.setAttribute(Const.SESSION_allmenuList, menuList1);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "1");
						menuList = menuList1;
					}else{
						session.setAttribute(Const.SESSION_allmenuList, menuList2);
						session.removeAttribute("changeMenu");
						session.setAttribute("changeMenu", "2");
						menuList = menuList2;
					}
				}else{
					menuList = (List<Menu>)session.getAttribute(Const.SESSION_allmenuList);
				}
				if(null == session.getAttribute(Const.SESSION_QX)){
					session.setAttribute(Const.SESSION_QX, this.getUQX(session));	//按钮权限放到session中
				}
				mv.setViewName("/system/admin/index");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				mv.setViewName("redirect:/login_toLogin");//session失效后跳转登录页面
			}
			
			
		} catch(Exception e){
			mv.setViewName("redirect:/login_toLogin");
			logger.error(e.getMessage(), e);
		}
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public ModelAndView tab(HttpServletRequest request){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/main");
		return mv;
	}
	
	/**
	 * 左边菜单
	 * @return
	 */
	@RequestMapping(value="/tree")
	public String tree(){
		return "system/admin/tree";
	}
	 
	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="/login_default")
	public String defaultPage(){
		return "system/admin/default";
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		
		session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(Const.SESSION_ROLE_RIGHTS);
		session.removeAttribute(Const.SESSION_allmenuList);
		session.removeAttribute(Const.SESSION_menuList);
		session.removeAttribute(Const.SESSION_QX);
		session.removeAttribute(Const.SESSION_userpds);
		session.removeAttribute(Const.SESSION_USERNAME);
		session.removeAttribute(Const.SESSION_USERROL);
		session.removeAttribute("changeMenu");
		
		//shiro销毁登录
		Subject subject = SecurityUtils.getSubject(); 
		subject.logout();
		
		pd = this.getPageData();
		String  msg = pd.getString("msg");
		pd.put("msg", msg);
		
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 获取用户权限
	 */
	public Map<String, String> getUQX(Session session){
		PageData pd = new PageData();
		Map<String, String> map = new HashMap<String, String>();
		try {
			String USERNAME = session.getAttribute(Const.SESSION_USERNAME).toString();
			pd.put(Const.SESSION_USERNAME, USERNAME);
			String ROLE_ID = userService.findByUId(pd).get("ROLE_ID").toString();
			
			pd.put("ROLE_ID", ROLE_ID);
			
			PageData pd2 = new PageData();
			pd2.put(Const.SESSION_USERNAME, USERNAME);
			pd2.put("ROLE_ID", ROLE_ID);
			
			pd = roleService.findObjectById(pd);																
				
			pd2 = roleService.findGLbyrid(pd2);
			if(null != pd2){
				map.put("FX_QX", pd2.get("FX_QX").toString());
				map.put("FW_QX", pd2.get("FW_QX").toString());
				map.put("QX1", pd2.get("QX1").toString());
				map.put("QX2", pd2.get("QX2").toString());
				map.put("QX3", pd2.get("QX3").toString());
				map.put("QX4", pd2.get("QX4").toString());
			
				pd2.put("ROLE_ID", ROLE_ID);
				pd2 = roleService.findYHbyrid(pd2);
				map.put("C1", pd2.get("C1").toString());
				map.put("C2", pd2.get("C2").toString());
				map.put("C3", pd2.get("C3").toString());
				map.put("C4", pd2.get("C4").toString());
				map.put("Q1", pd2.get("Q1").toString());
				map.put("Q2", pd2.get("Q2").toString());
				map.put("Q3", pd2.get("Q3").toString());
				map.put("Q4", pd2.get("Q4").toString());
			}
			
			map.put("adds", pd.getString("ADD_QX"));
			map.put("dels", pd.getString("DEL_QX"));
			map.put("edits", pd.getString("EDIT_QX"));
			map.put("chas", pd.getString("CHA_QX"));
			
			//System.out.println(map);
			
			this.getRemortIP(USERNAME);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}	
		return map;
	}
	/**
	 * 进入出错页面
	 * @return
	 */
	@RequestMapping(value="/error")
	public String errorPage(){
		return "error";
	}
}
