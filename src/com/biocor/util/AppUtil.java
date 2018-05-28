package com.biocor.util;


import java.util.Map;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.util.JSONPObject;

public class AppUtil  {
	
	protected static Logger logger = Logger.getLogger(AppUtil.class);

	public static Object returnObject(PageData pd, Map map){
		if(pd.containsKey("callback")){
			String callback = pd.get("callback").toString();
			return new JSONPObject(callback, map);
		}else{
			return map;
		}
	}
}

