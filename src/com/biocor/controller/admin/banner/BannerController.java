package com.biocor.controller.admin.banner;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
import net.coobird.thumbnailator.Thumbnails;
import net.sf.json.JSONObject;
 
import oracle.net.aso.b;
 
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.biocor.controller.base.BaseController;
import com.biocor.entity.Page;
import com.biocor.entity.bannerM.BannerM;
import com.biocor.service.admin.banner.BannerService;
import com.biocor.service.admin.good.GoodService;
import com.biocor.service.admin.shop.ShopService;
import com.biocor.service.admin.shop.ShopTypeService;
import com.biocor.service.interfaces.index.IndexService;
import com.biocor.util.CompressPicDemo;
import com.biocor.util.DateUtil;
import com.biocor.util.ImageZipUtil;
import com.biocor.util.PageData;
import com.biocor.util.StringUtil;
import com.biocor.util.UuidUtil;

@Controller
@RequestMapping(value="/banner")
public class BannerController extends BaseController {

	Logger logger = Logger.getLogger(BannerController.class);
	
	@Resource(name = "bannerService")
	private BannerService bannerService;
	
	
	@Resource(name = "shopService")
	private ShopService shopService;
	
	
	@Resource(name = "shopTypeService")
	private ShopTypeService shopTypeService;
	
	
	@Resource(name="indexService")
	private IndexService indexService;
	
	
	@Resource(name = "goodService")
	private GoodService goodService;
	/**
	 * 轮播图列表
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/bannerList")
	public ModelAndView bannerList(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<PageData> list = new ArrayList<PageData>();

		String curpage = request.getParameter("currentPage");
		String showCount = request.getParameter("showCount");
		
		//当前页
		if( StringUtil.isNull(curpage) ){
			curpage = "1";
		}
		//每页条数
		if( StringUtil.isNull(showCount) ){
			showCount = "10";
		}
		
		PageData pd = new PageData();

		page.setCurrentPage(Integer.parseInt(curpage));
		page.setShowCount(Integer.parseInt(showCount));
		page.setPd(pd);
		list = bannerService.findBannerlistPage(page);
		
		//获取模板列表
		List<PageData> listmodel = bannerService.findAllModel(new PageData());
		
		mv.setViewName("banner/banner_list");
		mv.addObject("list", list);
		mv.addObject("listmodel", listmodel);
		return mv;
	}
	
	/**
	 * 新增前
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/befAdd")
	public ModelAndView befAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv = this.getModelAndView();
		//获取模板列表
		List<PageData> listmodel = bannerService.findAllModel(new PageData());
				
		mv.setViewName("banner/banner_add");
		mv.addObject("listmodel", listmodel);
		return mv;
	}
	
	/**
	 * 新增广告
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/bannerAdd")
	public ModelAndView bannerAdd(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String image = request.getParameter("image");

		String type = request.getParameter("type");
		String detail = request.getParameter("detail");
		String url = request.getParameter("url");
		String remark = request.getParameter("remark");
		String order = request.getParameter("order");
		String search = request.getParameter("search");
		String stype = request.getParameter("stype");
		String modelId = request.getParameter("model_id");
		
		String[] ban_urlsArr = request.getParameterValues("ban_urls");
		String ban_urls = "";
		if(ban_urlsArr!=null){
			for(int i=0;i<ban_urlsArr.length;i++){
				ban_urls += ban_urlsArr[i]+",";
			}
			ban_urls = ban_urls.substring(0, ban_urls.length()-1);
		}
		
	    PageData pd = new PageData();
	    pd.put("banner_image", image);
	    pd.put("banner_content_img", ban_urls);
	    pd.put("banner_type", type);
	    pd.put("banner_detail", detail);
	    pd.put("banner_url", url);
	    pd.put("banner_createdate", DateUtil.getTime());
	    pd.put("banner_remark", remark);
	    pd.put("banner_order", order);
	    pd.put("banner_search", search);
	    pd.put("search_type", stype);
	    pd.put("model_id", modelId);
	    
		bannerService.addBanner(pd);
		return bannerList(request,response,page);
	}
	
	
	/**
	 * 广告删除
	 * @param request
	 * @param response
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/bannerDel")
	public ModelAndView bannerDel(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		String baid = request.getParameter("baid");
	    PageData pd = new PageData();
	    pd.put("bannnerid", baid);
		bannerService.delBanner(pd);
		return bannerList(request,response,page);
	}
	
	/**
	 * 广告模板列表
	 */
	@RequestMapping(value="/bannerView")
	public ModelAndView bannerView(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		 ModelAndView mv= new ModelAndView("banner/banner_view");
		 List<BannerM> mlist =bannerService.findBannerm(null);
		 mv.addObject("mlist", mlist);
		 return mv;
	}
	/**
	 * 广告模板列表
	 */
	@RequestMapping(value="/banner_edit")
	public ModelAndView bannerEdit(HttpServletRequest request,HttpServletResponse response,Page page) 
			throws Exception{
		ModelAndView mv= new ModelAndView("banner/banner_edit");
		PageData pd = new PageData();
		pd=this.getPageData();
		List<BannerM> mlist =bannerService.findBannerm(pd);
		BannerM bm=mlist.get(0);
		 mv.addObject("pd", bm);
		return mv;
		
	}
	
	/***
	 * 上传图片
	 * @param request
	 * @param response
	 */
	@RequestMapping("/uploadImageHandler")
	@ResponseBody
	public Map<String, Object> uploadImg(HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		String image = "";
		String img_name = "";
		int heigth,width=0;
		try {
			String img_u = request.getParameter("img_u");
			img_name = request.getParameter("img_name");
			heigth =Integer.parseInt(request.getParameter("heigth"));
			width = Integer.parseInt(request.getParameter("width"));
	        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			// 获取文件
			CommonsMultipartFile imageFile = (CommonsMultipartFile) multipartHttpServletRequest.getFile(img_name);
			String imgname = UuidUtil.get32UUID();
			String fileName = imageFile.getOriginalFilename();
			String prefix=fileName.substring(fileName.lastIndexOf("."));
			fileName = imgname + prefix;
			
			String str = request.getSession().getServletContext().getRealPath("/");
			String url = str + "upload/img/"+ img_u +"/";
			
			File targetFile = new File(url, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
		 
			imageFile.transferTo(targetFile);
			/*CompressPicDemo mypic = new CompressPicDemo();
			mypic.compressPic(url, urlzip, fileName, fileName, 720, 330, true);*/
			//压缩图片
			Thumbnails.of(targetFile).size(width,heigth).toFile(targetFile);//变为400*300,遵循原图比例缩或放到400*某个高度  
			
			
			
			image = "upload/img/" + img_u + "/" + fileName;
			map.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		map.put(img_name, image);
		return map;
	}
	
 
	/***
	 * 查询商铺列表数据
	 * @param page
	 *  
	 */
	@RequestMapping("/findShopInfo")
	@ResponseBody
	public JSONObject findShopInfo(Page page){
		JSONObject jsonObj=new JSONObject();
		try {
			PageData pd =new PageData();
			pd=this.getPageData();
			pd.put("type", "1");
			if(pd.get("sm_name")==null || "".equals(pd.get("sm_name")))
				pd.put("shopName", "");
			else
				pd.put("shopName", pd.get("sm_name"));
			if(pd.get("sm_stype")==null ||  "".equals(pd.get("sm_stype")))
				pd.put("stype", "");
			else
				pd.put("stype", pd.get("sm_stype"));
			page.setPd(pd);
			List<PageData> listshopInfo=shopService.findShoplistPage(page);
			jsonObj.put("listshopInfo", listshopInfo);
			jsonObj.put("page", page);
			jsonObj.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObj.put("msg", "error");
		}
		 
		return jsonObj;
	}
	
	
	/***
	 * 查询商品列表数据
	 * @param page
	 *  
	 */
	@RequestMapping("/findGoodsInfo")
	@ResponseBody
	public JSONObject findGoodsInfo(Page page){
		JSONObject jsonObj=new JSONObject();
		try {
			PageData pd =new PageData();
			pd=this.getPageData();
			pd.put("type", "1");
			if(pd.get("sm_name")==null || "".equals(pd.get("sm_name")))
				pd.put("shopName", "");
			else
				pd.put("shopName", pd.get("sm_name"));
			if(pd.get("sm_stype")==null ||  "".equals(pd.get("sm_stype")))
				pd.put("stype", "");
			else
				pd.put("stype", pd.get("sm_stype"));
			page.setPd(pd);
			List<PageData> listgoodsInfo=shopService.findGoodslistPage(page);
			jsonObj.put("listshopInfo", listgoodsInfo);
			jsonObj.put("page", page);
			jsonObj.put("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			jsonObj.put("msg", "error");
		}
		
		return jsonObj;
	}
	
	
	/***
	 *所有商铺类型 
	 * @param  
 	 */
	@RequestMapping("/shopTypeselect")
	@ResponseBody
	public JSONObject shopTypeList()  throws Exception{
		JSONObject jsonObj=new JSONObject();
		 List<PageData> listShoptype=indexService.findShoptypeList();
		jsonObj.put("msg", "success");
		jsonObj.put("list", listShoptype);
		return jsonObj;
	}
	
	
	/***
	 *商铺信息 
	 * @param  
	 */
	@RequestMapping("/Shopdetail")
	@ResponseBody
	public JSONObject Shopdetail()  throws Exception{
		PageData pd =new PageData();
		pd=this.getPageData();
		JSONObject jsonObj=new JSONObject();
		PageData shop=shopService.findShopBySid(pd);
		jsonObj.put("msg", "success");
		jsonObj.put("shop", shop);
		return jsonObj;
	}
	
	/***
	 *商品信息 
	 * @param  
	 */
	@RequestMapping("/goodsdetail")
	@ResponseBody
	public JSONObject goodsdetail()  throws Exception{
		PageData pd =new PageData();
		pd=this.getPageData();
		JSONObject jsonObj=new JSONObject();
		PageData goods=bannerService.findGoodBygid(pd);
		jsonObj.put("msg", "success");
		jsonObj.put("goods", goods);
		return jsonObj;
	}
	/**
	 * 保存模板
	 */
	@RequestMapping("/savem")
	public ModelAndView savem(HttpServletRequest request)  throws Exception{
		 ModelAndView mv= new ModelAndView("redirect:bannerView.do");
		 PageData pd= new PageData();
		 try {
			 pd=this.getPageData();
			 String [] str = null;
			 System.out.println(pd.get("shops_val").toString());
			 System.out.println( request.getParameter("shops_val"));
			 if(request.getParameter("shops_val").toString() !=null &&  !"".equals(request.getParameter("shops_val").toString()) && request.getParameter("shops_val").toString()!=""){
				  str=pd.get("shops_val").toString().split(",");
			 }
			
			 if(pd.get("mid")==null || "".equals(pd.get("mid")) ){
				 //保存主表信息
				 String m_No=StringUtil.getOrderNo();
				 pd.put("m_No",m_No);
				 pd.put("m_createDate",DateUtil.getTime());
				 bannerService.savem(pd); 
				 
				 if(str==null){
					 
				 }else{
					 //保存明细表
					 for (int i = 0; i < str.length; i++) {
					      pd.put("md_mNO", m_No);
					      pd.put("md_param", str[i]);
						  bannerService.savemd(pd); 
					 }
				 }
			 }else{
				 //修改数据主表信息
				 bannerService.updatem(pd); 
				 
				 //根据m_mNo删除模板明细
				 bannerService.delmd(pd);
				 
				 if(str==null){
					 
				 }else{
					 //保存明细表
					 for (int i = 0; i < str.length; i++) {
					      pd.put("md_mNO", pd.get("m_No"));
					      if(str[i].trim()=="" || str[i].trim()==null){
					    	  
					      }else{
					      	pd.put("md_param", str[i]);
						  }
						  bannerService.savemd(pd); 
					 }
				 }
			 }
			 
			
		} catch (Exception e) {  
			e.printStackTrace();
		}
		 
		 return mv;
	}
	
	
}
