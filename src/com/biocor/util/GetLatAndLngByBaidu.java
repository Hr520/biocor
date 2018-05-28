package com.biocor.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import com.biocor.controller.admin.shop.ShopController;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
 
/** 
* 经纬度和地址获取
* @author bianyang
* 
*  
*/ 
public class GetLatAndLngByBaidu { 
	private static Logger logger = Logger.getLogger(GetLatAndLngByBaidu.class);
	private static String KEY = "aa4a48297242d22d2b3fd6eddfe62217";  
    
    private static Pattern pattern = Pattern.compile("\"location\":\"(\\d+\\.\\d+),(\\d+\\.\\d+)\"");  
    /** 
    * @param addr 
    * 百度： 查询的地址 
    * @return 
    * @throws IOException 
    */ 
    public Object[] getCoordinate(String addr) throws IOException { 
        String lng = null;//经度
        String lat = null;//纬度
        String address = null; 
        try { 
            address = java.net.URLEncoder.encode(addr, "UTF-8"); 
        }catch (UnsupportedEncodingException e1) { 
            e1.printStackTrace(); 
        } 
        String key = "lhHVQVaMWd9ZQTMKUvVp0siBS3DuawNW"; 
        String url = String .format("http://api.map.baidu.com/geocoder?address=%s&output=json&key=%s", address, key); 
        URL myURL = null; 
        URLConnection httpsConn = null; 
        try { 
            myURL = new URL(url); 
        } catch (MalformedURLException e) { 
            e.printStackTrace(); 
        } 
        InputStreamReader insr = null;
        BufferedReader br = null;
        try { 
            httpsConn = (URLConnection) myURL.openConnection();// 不使用代理 
            if (httpsConn != null) { 
                insr = new InputStreamReader( httpsConn.getInputStream(), "UTF-8"); 
                br = new BufferedReader(insr); 
                String data = null; 
                int count = 1;
                while((data= br.readLine())!=null){ 
                    if(count==5){
                        lng = (String)data.subSequence(data.indexOf(':')+1, data.indexOf(','));//经度
                        count++;
                    }else if(count==6){
                        lat = data.substring(data.indexOf(':')+1);//纬度
                        count++;
                    }else{
                        count++;
                    }
                } 
            } 
        } catch (IOException e) { 
            e.printStackTrace(); 
        } finally {
            if(insr!=null){
                insr.close();
            }
            if(br!=null){
                br.close();
            }
        }
        return new Object[]{lng,lat}; 
    } 
   
    /***
     * 百度： 根据地质获取经度纬度
     * @param addr
     * @return
     */
    public static Map<String, BigDecimal> getLatAndLngByAddress(String addr){
        String address = "";
        String lat = "";
        String lng = "";
        try {  
            address = java.net.URLEncoder.encode(addr,"UTF-8");  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace();  
        } 
        String key="lhHVQVaMWd9ZQTMKUvVp0siBS3DuawNW";
        String url = String.format("http://api.map.baidu.com/geocoder/v2/?"
        +"ak=%s&output=json&address=%s",key,address);
        URL myURL = null;
        URLConnection httpsConn = null;  
        //进行转码
        try {
            myURL = new URL(url);
        } catch (MalformedURLException e) {

        }
        try {
            httpsConn = (URLConnection) myURL.openConnection();
            if (httpsConn != null) {
                InputStreamReader insr = new InputStreamReader(
                        httpsConn.getInputStream(), "UTF-8");
                BufferedReader br = new BufferedReader(insr);
                String data = null;
                if ((data = br.readLine()) != null) {
                    lat = data.substring(data.indexOf("\"lat\":") 
                    + ("\"lat\":").length(), data.indexOf("},\"precise\""));
                    lng = data.substring(data.indexOf("\"lng\":") 
                    + ("\"lng\":").length(), data.indexOf(",\"lat\""));
                }
                insr.close();
            }
        } catch (IOException e) {

        }
        Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
        map.put("lat", new BigDecimal(lat));
        map.put("lng", new BigDecimal(lng));
        return map;
     }
    
    /***
     * 百度：根据经纬度获取城市信息
     * @param latitude
     * @param longitude
     * @return
     */
    public static JSONObject GetAddr(String latitude, String longitude) {  
        String key = "lhHVQVaMWd9ZQTMKUvVp0siBS3DuawNW"; 
        String url = String.format("http://api.map.baidu.com/geocoder/v2/?ak=%s&callback=renderReverse&location=%s,%s&output=json&pois=1",  
        		key,latitude,longitude );  
        URL myURL = null; 
        URLConnection httpsConn = null; 
        JSONObject jsonObj2=null;
        try { 
            myURL = new URL(url); 
        } catch (MalformedURLException e) { 
            e.printStackTrace(); 
        } 
        InputStreamReader insr = null;
        BufferedReader br = null;
        try { 
            httpsConn = (URLConnection) myURL.openConnection();// 不使用代理 
            if (httpsConn != null) { 
                insr = new InputStreamReader( httpsConn.getInputStream(), "UTF-8"); 
                br = new BufferedReader(insr); 
                String data = null; 
                String count = null;
                while((data= br.readLine())!=null){ 
                	System.out.println(data);
                     System.out.println(data.split("renderReverse&&renderReverse[(]")[1].substring(0, data.split("renderReverse&&renderReverse[(]")[1].length()-1));
                     count=data.split("renderReverse&&renderReverse[(]")[1].substring(0, data.split("renderReverse&&renderReverse[(]")[1].length()-1);
                     JSONObject jsonObj=JSONObject.fromObject(count);
                     System.out.println(jsonObj.get("result"));
                     JSONObject jsonObj1=JSONObject.fromObject(jsonObj.get("result"));
                     System.out.println(jsonObj1.get("addressComponent"));
                     jsonObj2=JSONObject.fromObject(jsonObj1.get("addressComponent"));
                     System.out.println(jsonObj2.get("city"));
                } 
            } 
         
              
        } catch (Exception e) {  
            e.printStackTrace();  
           return null;  
        }  
           return jsonObj2;  
    }
    
    /***
     * 高德： 根据地质获取经度纬度
     * @param addr
     * @return
     */
    public static Map<String, BigDecimal> getLatAndLngByAddress2(String addr){
    	String address = "";
    	String lat = "";
    	String lng = "";
    	try {  
    		address = java.net.URLEncoder.encode(addr,"UTF-8");  
    	} catch (UnsupportedEncodingException e1) {  
    		e1.printStackTrace();  
    	} 
    	String key="c37861dbb870f5c0cb0ba41456929c20";
    	//http://restapi.amap.com/v3/geocode/geo?key
    	String url = String.format("http://restapi.amap.com/v3/geocode/geo?key"
    			+"=%s&output=json&address=%s",key,address);
    	URL myURL = null;
    	URLConnection httpsConn = null;  
    	//进行转码
    	try {
    		myURL = new URL(url);
    	} catch (MalformedURLException e) {
    		
    	}
    	try {
    		httpsConn = (URLConnection) myURL.openConnection();
    		if (httpsConn != null) {
    			InputStreamReader insr = new InputStreamReader(
    					httpsConn.getInputStream(), "UTF-8");
    			BufferedReader br = new BufferedReader(insr);
    			String data = null;
    			if ((data = br.readLine()) != null) {
    				System.out.println("data:"+data);
    				 JSONObject jsonObj=JSONObject.fromObject(data);
    				 String geocodes= jsonObj.get("geocodes").toString();
    				 System.out.println("geocodes:"+geocodes);
    				// JSONObject jsonObj1=JSONObject.fromObject(jsonObj.get("geocodes"));
    				JSONArray jsonarr=JSONArray.fromObject(geocodes);
    				 for (int i = 0; i < jsonarr.size(); i++) {
    					  JSONObject jsonObj22=(JSONObject) jsonarr.get(0);
    					  lng=jsonObj22.getString("location").split(",")[0];
    					  lat=jsonObj22.getString("location").split(",")[1];
    					 
					}
    				/*lat = data.substring(data.indexOf("\"lat\":") 
    						+ ("\"lat\":").length(), data.indexOf("},\"precise\""));
    				lng = data.substring(data.indexOf("\"lng\":") 
    						+ ("\"lng\":").length(), data.indexOf(",\"lat\""));*/
    			}
    			insr.close();
    		}
    	} catch (IOException e) {
    		
    	}
    	Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
    	map.put("lat", new BigDecimal(lat));
    	map.put("lng", new BigDecimal(lng));
    	return map;
    }
 
    /****
     * 高德地图：根据地质获取坐标
     * @param address
     * @return
     */
	public static JSONObject addressToGPS(String address,String shopName) {
		System.out.println("----------------------");
		System.out.println(address);
		System.out.println(shopName);
		logger.info("address:"+address);
		logger.info("shopName:"+shopName);
		String shop_address=address;
		try {
			address = java.net.URLEncoder.encode(address,"UTF-8");  
			String key="c37861dbb870f5c0cb0ba41456929c20";
	    	//http://restapi.amap.com/v3/geocode/geo?key
	    	String url = String.format("http://restapi.amap.com/v3/geocode/geo?key"
	    			+"=%s&output=json&address=%s",key,address);
			URL myURL = null;
			URLConnection httpsConn = null;
			try {
				myURL = new URL(url);
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
			InputStreamReader insr = null;
			BufferedReader br = null;
			httpsConn = (URLConnection) myURL.openConnection();// 不使用代理
			
			if (httpsConn != null) {
				insr = new InputStreamReader(httpsConn.getInputStream(),
						"UTF-8");
				br = new BufferedReader(insr);
				String data = "";
				String line = null;
				while ((line = br.readLine()) != null) {
					data += line;
				}
				System.out.println("data:"+data);
				Matcher matcher = pattern.matcher(data);
				if (matcher.find() && matcher.groupCount() == 2) {
					Double lat = Double.valueOf(matcher.group(1));
					Double lng = Double.valueOf(matcher.group(2));
				 
			        System.out.println("lat:"+lat);
			        System.out.println("lng:"+lng);
			        JSONObject jo= GetAddrToGPSStr2(lat+"",lng+"",shopName,address,shop_address);
					return jo;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
			return null;
		}
		return null;
	}
	 
	/***
	 * 高德：根据经纬度获取地址信息
	 * @param latitude
	 * @param longitude
	 * @return
	 */
	public static JSONObject GetAddrToGPSStr(String latitude, String longitude) {  
		//
        String url = String.format("http://restapi.amap.com/v3/geocode/regeo?output=json&location=%s,%s&key=%s&radius=1000&extensions=all",  
        		 latitude,longitude,"e128ac0e94a8a6b704736dc7145b6b5b");  
        URL myURL = null; 
        URLConnection httpsConn = null; 
        JSONObject jsonObj3=null;
              try { 
            myURL = new URL(url); 
        } catch (MalformedURLException e) { 
            e.printStackTrace(); 
        } 
        InputStreamReader insr = null;
        BufferedReader br = null;
        try { 
            httpsConn = (URLConnection) myURL.openConnection();// 不使用代理 
            if (httpsConn != null) { 
                insr = new InputStreamReader( httpsConn.getInputStream(), "UTF-8"); 
                br = new BufferedReader(insr); 
                String data = null; 
                while((data= br.readLine())!=null){ 
                	System.out.println("data:"+data);
                     JSONObject jsonObj=JSONObject.fromObject(data);
                     JSONObject jsonObj1=JSONObject.fromObject(jsonObj.get("regeocode"));
                     JSONObject jsonObj2=JSONObject.fromObject(jsonObj1.get("addressComponent"));
                     jsonObj3=new JSONObject();
                     jsonObj3.put("country",jsonObj2.get("country"));
                     jsonObj3.put("province", jsonObj2.get("province"));
                     jsonObj3.put("city", jsonObj2.get("city"));
                     jsonObj3.put("district",jsonObj2.get("district"));
                     jsonObj3.put("township",jsonObj2.get("township"));
                     jsonObj3.put("address",jsonObj1.get("formatted_address"));
                } 
            } 
         
              
        } catch (Exception e) {  
            e.printStackTrace();  
           return null;  
        }  
           return jsonObj3;  
    }
	/***
	 * 高德：根据经纬度获取地址信息
	 * @param latitude
	 * @param longitude
	 * @return
	 */
	public static JSONObject GetAddrToGPSStr2(String latitude, String longitude,String shopName,String shopadders,String shop_address) {  
		//
		String url = String.format("http://restapi.amap.com/v3/geocode/regeo?output=json&location=%s,%s&key=%s&radius=1000&extensions=all",  
				latitude,longitude,"e128ac0e94a8a6b704736dc7145b6b5b");  
		
		logger.info("-----定位：请求参数 ，shopName="+shopName+",shopadders="+shopadders);
		URL myURL = null; 
		URLConnection httpsConn = null; 
		JSONObject jsonO=new JSONObject(); 
		 String lat="";
	     String lng="";
		try { 
			myURL = new URL(url); 
		} catch (MalformedURLException e) { 
			e.printStackTrace(); 
		} 
		InputStreamReader insr = null;
		BufferedReader br = null;
		try { 
			
			httpsConn = (URLConnection) myURL.openConnection();// 不使用代理 
			if (httpsConn != null) { 
				insr = new InputStreamReader( httpsConn.getInputStream(), "UTF-8"); 
				br = new BufferedReader(insr); 
				String data = null; 
				while((data= br.readLine())!=null){ 
					logger.info("-----定位：返回data ="+ data);
					JSONObject jsonObj=JSONObject.fromObject(data);
					JSONObject jsonObj1=JSONObject.fromObject(jsonObj.get("regeocode"));
					JSONObject jsonObj2=JSONObject.fromObject(jsonObj1.get("addressComponent"));
					JSONArray js= new JSONArray().fromObject(jsonObj2.get("businessAreas"));
					JSONArray jsonObj4=new  JSONArray().fromObject(jsonObj1.get("pois").toString());
					boolean b =false;
					for (Object object : jsonObj4) {
						JSONObject obj=(JSONObject) object;
						logger.info("-----定位：返回data中  obj="+obj.toString());
						String sname= obj.get("name").toString();
						if(sname.indexOf(shopName)>-1){
						     lat=obj.getString("location").toString().split(",")[1];
						     lng=obj.getString("location").toString().split(",")[0];
							 b =true;
							 break;
						}else{
							
						}
						
					}
					if(!b){
						for (Object object : js) {
							JSONObject obj=(JSONObject) object;
							System.out.println(obj.toString());
							String address= java.net.URLDecoder.decode(shopadders);
							address = new String(address.getBytes("iso-8859-1"),"UTF-8");
							System.out.println(address.indexOf(obj.getString("name")));
							logger.info("-----定位：返回地址中  address="+address);
							logger.info("-----定位：返回地址中  address2="+shop_address);
							if(shop_address.indexOf(obj.getString("name"))>-1){
							     lat=obj.getString("location").toString().split(",")[1];
							     lng=obj.getString("location").toString().split(",")[0];
								
							}
						}
					}
					
				} 
			} 
			
			
		} catch (Exception e) {  
			e.printStackTrace();  
			return null;  
		}  
		jsonO.put("lat", lat);
		jsonO.put("lng", lng);
		return jsonO ;  
	}
	
    public static void main(String[] args) throws IOException {
        GetLatAndLngByBaidu getLatAndLngByBaidu = new GetLatAndLngByBaidu();
        Map<String, BigDecimal> map=getLatAndLngByBaidu.addressToGPS("湖北省武汉市洪山区南湖大道46号   ","测试4");
       // JSONObject job=getLatAndLngByBaidu.addressToGPS("湖北省武汉市关山大道保利时代","");
       System.out.println(map);
        
        String string="武商亚贸广场";
        String str="测试1亚贸店武商亚贸广场";
        System.out.println( str.indexOf(string));
        //System.out.println(job);
    }//114.410401,30.49096
    
}
