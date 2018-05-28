package com.biocor.util.push;


import com.google.gson.JsonParseException;
import com.google.gson.JsonParser;
import com.biocor.util.push.common.ClientConfig;
import com.biocor.util.push.common.ServiceHelper;
import com.biocor.util.push.common.connection.HttpProxy;
import com.biocor.util.push.common.connection.NativeHttpClient;
import com.biocor.util.push.common.resp.APIConnectionException;
import com.biocor.util.push.common.resp.APIRequestException;
import com.biocor.util.push.common.resp.BaseResult;
import com.biocor.util.push.common.resp.ResponseWrapper;
import com.biocor.util.push.model.PushPayload;
import com.biocor.util.push.utils.Preconditions;
import com.biocor.util.push.utils.StringUtils;


/**
 * Entrance for sending Push.
 * 
 * For the following parameters, you can set them by instance creation. 
 * This action will override setting in PushPayload Optional.
 * * apnsProduction If not present, the default is true.
 * * timeToLive If not present, the default is 86400(s) (one day).
 * 
 * Can be used directly.
 */
public class PushClient {

    private final NativeHttpClient _httpClient;
    private String _baseUrl;
    private String _pushPath;
    private String _pushValidatePath;

    private JsonParser _jsonParser = new JsonParser();

    // If not present, true by default.
    private int _apnsProduction;
    
    // If not present, the default value is 86400(s) (one day)
    private long _timeToLive;

    /**
     * Create a Push Client.
     * 
     * @param masterSecret API access secret of the appKey.
     * @param appKey The KEY of one application on JPush.
     */
	public PushClient(String masterSecret, String appKey) {
	    this(masterSecret, appKey, null, ClientConfig.getInstance());
	}

    /**
     * This will be removed in the future. Please use ClientConfig{@link cn.jpush.api.common.ClientConfig} instead of this constructor.
     * @param masterSecret API access secret of the appKey.
     * @param appKey The KEY of one application on JPush.
     * @param maxRetryTimes The max retry times.
     */
    @Deprecated
	public PushClient(String masterSecret, String appKey, int maxRetryTimes) {
	    this(masterSecret, appKey, maxRetryTimes, null);
	}
	
	/**
	 * Create a Push Client with max retry times.
	 * This will be removed in the future. Please use ClientConfig{@link cn.jpush.api.common.ClientConfig} instead of this constructor.
     *
	 * @param masterSecret  API access secret of the appKey.
	 * @param appKey The KEY of one application on JPush.
	 * @param maxRetryTimes max retry times
     * @param proxy The max retry times.
	 */
    @Deprecated
	public PushClient(String masterSecret, String appKey, int maxRetryTimes, HttpProxy proxy) {
        ServiceHelper.checkBasic(appKey, masterSecret);

        ClientConfig conf = ClientConfig.getInstance();
        conf.setMaxRetryTimes(maxRetryTimes);

        this._baseUrl = (String) conf.get(ClientConfig.PUSH_HOST_NAME);
        this._pushPath = (String) conf.get(ClientConfig.PUSH_PATH);
        this._pushValidatePath = (String) conf.get(ClientConfig.PUSH_VALIDATE_PATH);

        this._apnsProduction = (Integer) conf.get(ClientConfig.APNS_PRODUCTION);
        this._timeToLive = (Long) conf.get(ClientConfig.TIME_TO_LIVE);

        String authCode = ServiceHelper.getBasicAuthorization(appKey, masterSecret);
        this._httpClient = new NativeHttpClient(authCode, proxy, conf);
	}

    public PushClient(String masterSecret, String appKey, HttpProxy proxy, ClientConfig conf) {
        ServiceHelper.checkBasic(appKey, masterSecret);

        this._baseUrl = (String) conf.get(ClientConfig.PUSH_HOST_NAME);
        this._pushPath = (String) conf.get(ClientConfig.PUSH_PATH);
        this._pushValidatePath = (String) conf.get(ClientConfig.PUSH_VALIDATE_PATH);

        this._apnsProduction = (Integer) conf.get(ClientConfig.APNS_PRODUCTION);
        this._timeToLive = (Long) conf.get(ClientConfig.TIME_TO_LIVE);

        String authCode = ServiceHelper.getBasicAuthorization(appKey, masterSecret);
        this._httpClient = new NativeHttpClient(authCode, proxy, conf);

    }

	/**
     * Create a Push Client with global settings.
     * 
     * If you want different settings from default globally, this constructor is what you needed.
     * This will be removed in the future. Please use ClientConfig{@link cn.jpush.api.common.ClientConfig} instead of this constructor.
     *
     * @param masterSecret API access secret of the appKey.
     * @param appKey The KEY of one application on JPush.
     * @param apnsProduction Global APNs environment setting. It will override PushPayload Options.
     * @param timeToLive Global time_to_live setting. It will override PushPayload Options.
     */
    @Deprecated
    public PushClient(String masterSecret, String appKey, boolean apnsProduction, long timeToLive) {
        this(masterSecret, appKey);
        if(apnsProduction) {
            _apnsProduction = 1;
        } else {
            _apnsProduction = 0;
        }
        this._timeToLive = timeToLive;
    }

    /**
     * This will be removed in the future. Please use ClientConfig{@link cn.jpush.api.common.ClientConfig#setGlobalPushSetting} instead of this method.
     *
     * @param apnsProduction Global APNs environment setting. It will override PushPayload Options.
     * @param timeToLive Global time_to_live setting. It will override PushPayload Options.
     */
    @Deprecated
    public void setDefaults(boolean apnsProduction, long timeToLive) {
        if(apnsProduction) {
            _apnsProduction = 1;
        } else {
            _apnsProduction = 0;
        }
        this._timeToLive = timeToLive;
    }
    
    public void setBaseUrl(String baseUrl) {
        this._baseUrl = baseUrl;
    }
    
    public PushResult sendPush(PushPayload pushPayload) throws APIConnectionException, APIRequestException {
        Preconditions.checkArgument(! (null == pushPayload), "pushPayload should not be null");
        
        if (_apnsProduction > 0) {
            pushPayload.resetOptionsApnsProduction(true);
        } else if(_apnsProduction == 0) {
            pushPayload.resetOptionsApnsProduction(false);
        }

        if (_timeToLive >= 0) {
            pushPayload.resetOptionsTimeToLive(_timeToLive);
        }

        ResponseWrapper response = _httpClient.sendPost(_baseUrl + _pushPath, pushPayload.toString());
        
        return BaseResult.fromResponse(response, PushResult.class);
    }
    
    public PushResult sendPushValidate(PushPayload pushPayload) throws APIConnectionException, APIRequestException {
        Preconditions.checkArgument(! (null == pushPayload), "pushPayload should not be null");
        
        if (_apnsProduction > 0) {
            pushPayload.resetOptionsApnsProduction(true);
        } else if(_apnsProduction == 0) {
            pushPayload.resetOptionsApnsProduction(false);
        }

        if (_timeToLive >= 0) {
            pushPayload.resetOptionsTimeToLive(_timeToLive);
        }
        
        ResponseWrapper response = _httpClient.sendPost(_baseUrl + _pushValidatePath, pushPayload.toString());
        
        return BaseResult.fromResponse(response, PushResult.class);
    }
    
    public PushResult sendPush(String payloadString) throws APIConnectionException, APIRequestException {
        Preconditions.checkArgument(StringUtils.isNotEmpty(payloadString), "pushPayload should not be empty");
        
        try {
            _jsonParser.parse(payloadString);
        } catch (JsonParseException e) {
            Preconditions.checkArgument(false, "payloadString should be a valid JSON string.");
        }
        
        ResponseWrapper response = _httpClient.sendPost(_baseUrl + _pushPath, payloadString);
        
        return BaseResult.fromResponse(response, PushResult.class);
    }
    
    public PushResult sendPushValidate(String payloadString) throws APIConnectionException, APIRequestException {
        Preconditions.checkArgument(StringUtils.isNotEmpty(payloadString), "pushPayload should not be empty");
        
        try {
            _jsonParser.parse(payloadString);
        } catch (JsonParseException e) {
            Preconditions.checkArgument(false, "payloadString should be a valid JSON string.");
        }
        
        ResponseWrapper response = _httpClient.sendPost(_baseUrl + _pushValidatePath, payloadString);
        
        return BaseResult.fromResponse(response, PushResult.class);
    }

}


