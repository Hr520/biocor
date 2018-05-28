package com.biocor.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class Constants {

    /* 融云Key */
    public static final String RongCloudAppKey = "25wehl3uwkxow";
    public static final String RongCloudSecret = "4jFQ0k3KNPvH";

    /* 资源服务器地址配置 */
    // public static final String ResourceServer = "http://121.42.10.232/ResourceServer";
    public static final String Server = "http://localhost:8080/Truck";

    // 友盟推送APP key
    public static final String UMAPPKEY_Android = "564af9f9e0f55aaa3b000df3";
    public static final String UMMASTERSECRET_Android = "6h5fsdvtnb5jhwlcnupvblj2qphww4mm";
    public static final String UMAPPKEY_IOS = "55f81820e0f55a69c9000f3e";
    public static final String UMMASTERSECRET_IOS = "ahlgf9pytg3tvnubuod4wk9fs82hmqjs";

    public static final String STATUS = "status";
    public static final String DATA = "data";

    public static Map<String, Object> getResultMap(int status, Object obj) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put(STATUS, status);
        resultMap.put(DATA, obj);
        return resultMap;
    }

    public static String getDateTime() {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmssSSSS", Locale.CHINA);
        return simpleDateFormat.format(date);
    }

    public static String getDate() {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd", Locale.CHINA);
        return simpleDateFormat.format(date);
    }

    public static final int SUCCESS = 0;
    public static final int FAILED = 1;
    public static final int ERROR = 2;
    public static final int EXCEPTION = 3;
    public static final int WRONG = 4;
    public static final int VERFITY = 5;
    public static final int LoginSuccess = 1;
    public static final int LoginFail = 0;

    public static final String DATE_PATTERN = "yyyy-MM-dd";
    public static final String DATETime_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public static final String RET_SUCCESS = "success";
    public static final String RET_FAIL = "fail";
    public static final String RET_EXCEPTION = "exception";

    public static final String ENCODING_UTF8 = "UTF-8";

    public static final String BAIDU_ID = "4401433";
    public static final String BAIDU_APP_KEY = "95NQY31aQLUFfELU73Ayj58x";
    public static final String BAIDU_APP_SECRET = "BjGaqk63r2eXaIX1kMIGeBkYoOEO68gC";

    public static final String HEADER_BCTUID = "UID";
    public static final String HEADER_BCTCLIENT = "CLIENT";
    public static final String HEADER_BCTTIMESTAMP = "TIMESTAMP";
    public static final String HEADER_BCTSIGNATURE = "SIGNATURE";

    /* 本地文件存放地址 */
    public static final String FilePath = System.getProperty("Truck.root");
    
    /* Ping++支付 apiKey */
    public static final String Ping_AppId = "app_a5WvHCPirDKC1azL";//app_L0W1i9C4Ki58L8u1
    public static final String Ping_AppKey = "sk_test_nfzfH80afjPCT0uHm9WzP8q9";


}
