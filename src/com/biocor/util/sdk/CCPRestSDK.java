/*
 *  Copyright (c) 2014 The CCP project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a Beijing Speedtong Information Technology Co.,Ltd license
 *  that can be found in the LICENSE file in the root of the web site.
 *
 *   http://www.yuntongxun.com
 *
 *  An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */
package com.biocor.util.sdk;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import ytx.org.apache.http.HttpEntity;
import ytx.org.apache.http.HttpResponse;
import ytx.org.apache.http.client.methods.HttpGet;
import ytx.org.apache.http.client.methods.HttpPost;
import ytx.org.apache.http.client.methods.HttpRequestBase;
import ytx.org.apache.http.entity.BasicHttpEntity;
import ytx.org.apache.http.impl.client.DefaultHttpClient;
import ytx.org.apache.http.message.AbstractHttpMessage;
import ytx.org.apache.http.util.EntityUtils;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.biocor.util.sdk.utils.CcopHttpClient;
import com.biocor.util.sdk.utils.DateUtil;
import com.biocor.util.sdk.utils.EncryptUtil;
import com.biocor.util.sdk.utils.LoggerUtil;

public class CCPRestSDK {
	private static final int Request_Get = 0;

	private static final int Request_Post = 1;
	private static final String Account_Info = "AccountInfo";
	private static final String Create_SubAccount = "SubAccounts";
	private static final String Get_SubAccounts = "GetSubAccounts";
	private static final String Query_SubAccountByName = "QuerySubAccountByName";

	private static final String SMSMessages = "SMS/Messages";
	private static final String TemplateSMS = "SMS/TemplateSMS";
	private static final String Query_SMSTemplate = "SMS/QuerySMSTemplate";
	private static final String Call_back = "Calls/Callback";
	private static final String LandingCalls = "Calls/LandingCalls";
	private static final String VoiceVerify = "Calls/VoiceVerify";
	private static final String IvrDial = "ivr/dial";
	private static final String BillRecords = "BillRecords";
	private static final String callCancel = "Calls/CallCancel";
	private static final String queryCallState = "ivr/call";
	private static final String callResult = "CallResult";
	private static final String mediaFileUpload = "Calls/MediaFileUpload";
	private String SERVER_IP;
	private String SERVER_PORT;
	private String ACCOUNT_SID;
	private String ACCOUNT_TOKEN;
	private String SUBACCOUNT_SID;
	private String SUBACCOUNT_Token;
	private String VOIP_ACCOUNT;
	private String VOIP_TOKEN;
	public String App_ID;
	private BodyType BODY_TYPE = BodyType.Type_XML;
	public String Callsid;

	public enum BodyType {
		Type_XML, Type_JSON;
	}

	public enum AccountType {
		Accounts, SubAccounts;
	}

	/**
	 * 初始化服务地址和端口
	 * 
	 * @param serverIP
	 *            必选参数 服务器地址
	 * @param serverPort
	 *            必选参数 服务器端口
	 */
	public void init(String serverIP, String serverPort) {
		if (isEmpty(serverIP) || isEmpty(serverPort)) {
			LoggerUtil.fatal("初始化异常:serverIP或serverPort为空");
			throw new IllegalArgumentException("必选参数:"
					+ (isEmpty(serverIP) ? " 服务器地址 " : "")
					+ (isEmpty(serverPort) ? " 服务器端口 " : "") + "为空");
		}
		SERVER_IP = serverIP;
		SERVER_PORT = serverPort;
	}

	/**
	 * 初始化主帐号信息
	 * 
	 * @param accountSid
	 *            必选参数 主帐号
	 * @param accountToken
	 *            必选参数 主帐号TOKEN
	 */
	public void setAccount(String accountSid, String accountToken) {
		if (isEmpty(accountSid) || isEmpty(accountToken)) {
			LoggerUtil.fatal("初始化异常:accountSid或accountToken为空");
			throw new IllegalArgumentException("必选参数:"
					+ (isEmpty(accountSid) ? " 主帐号" : "")
					+ (isEmpty(accountToken) ? " 主帐号TOKEN " : "") + "为空");
		}
		ACCOUNT_SID = accountSid;
		ACCOUNT_TOKEN = accountToken;
	}

	/**
	 * 初始化子帐号信息
	 * 
	 * @param subAccountSid
	 *            必选参数 子帐号
	 * @param subAccountToken
	 *            必选参数 子帐号TOKEN
	 */
	public void setSubAccount(String subAccountSid, String subAccountToken) {
		if (isEmpty(subAccountSid) || isEmpty(subAccountToken)) {
			LoggerUtil.fatal("初始化异常:subAccountSid或subAccountToken为空");
			throw new IllegalArgumentException("必选参数:"
					+ (isEmpty(subAccountSid) ? " 子帐号" : "")
					+ (isEmpty(subAccountToken) ? " 子帐号TOKEN " : "") + "为空");
		}
		SUBACCOUNT_SID = subAccountSid;
		SUBACCOUNT_Token = subAccountToken;
	}

	/**
	 * 初始化应用Id
	 * 
	 * @param appId
	 *            必选参数 应用Id
	 */
	public void setAppId(String appId) {
		if (isEmpty(appId)) {
			LoggerUtil.fatal("初始化异常:appId为空");
			throw new IllegalArgumentException("必选参数: 应用Id 为空");
		}
		App_ID = appId;
	}

	/**
	 * 初始化VoIP帐号信息
	 * 
	 * @param voIPAccount
	 *            必选参数 VoIP帐号
	 * @param voIPPassWord
	 *            必选参数 VoIP密码
	 */
	public void setVoIPAccount(String voIPAccount, String voIPPassWord) {
		if (isEmpty(voIPAccount) || isEmpty(voIPPassWord)) {
			LoggerUtil.fatal("初始化异常:voIPAccount或voIPPassWord为空");
			throw new IllegalArgumentException("必选参数:"
					+ (isEmpty(voIPAccount) ? " VoIP帐号" : "")
					+ (isEmpty(voIPPassWord) ? " VoIP密码 " : "") + "为空");
		}
		VOIP_ACCOUNT = voIPAccount;
		VOIP_TOKEN = voIPPassWord;
	}

	/**
	 * 话单下载
	 * 
	 * @param date
	 *            必选参数 day 代表前一天的数据（从00:00 – 23:59）
	 * @param keywords
	 *            可选参数 客户的查询条件，由客户自行定义并提供给云通讯平台。默认不填忽略此参数
	 * @return
	 */
	public HashMap<String, Object> billRecords(String date, String keywords) {

		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if ((isEmpty(date))) {
			LoggerUtil.fatal("必选参数: 日期  为空");
			throw new IllegalArgumentException("必选参数: 日期  为空");
		}
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			LoggerUtil.error(e1.getMessage());
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1, BillRecords);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				json.addProperty("date", date);
				if (!(isEmpty(keywords)))
					json.addProperty("keywords", keywords);

				requsetbody = json.toString();
			} else {
				StringBuilder sb = new StringBuilder(
						"<?xml version='1.0' encoding='utf-8'?><BillRecords>");
				sb.append("<appId>").append(App_ID).append("</appId>")
						.append("<date>").append(date).append("</date>");
				if (!(isEmpty(keywords)))
					sb.append("<keywords>").append(keywords)
							.append("</keywords>");

				sb.append("</BillRecords>").toString();
				requsetbody = sb.toString();
			}
			LoggerUtil.info("billRecords Request body = : " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("billRecords response body = " + result);
		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 发起IVR外呼请求
	 * 
	 * @param number
	 *            必选参数 待呼叫号码，为Dial节点的属性
	 * @param userdata
	 *            可选参数 用户数据，在<startservice>通知中返回，只允许填写数字字符，为Dial节点的属性
	 * @param record
	 *            可选参数 是否录音，可填项为true和false，默认值为false不录音，为Dial节点的属性
	 * @return
	 */
	public HashMap<String, Object> ivrDial(String number, String userdata,
			boolean record) {
		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if (isEmpty(number)) {
			LoggerUtil.fatal("必选参数: 待呼叫号码   为空");
			throw new IllegalArgumentException("必选参数: 待呼叫号码   为空");
		}
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1, IvrDial);
			String requsetbody = "";

			StringBuilder sb = new StringBuilder(
					"<?xml version='1.0' encoding='utf-8'?><Request>");
			sb.append("<Appid>").append(App_ID).append("</Appid>")
					.append("<Dial number=").append("\"").append(number)
					.append("\"");
			if (record) {
				sb.append(" record=").append("\"").append(record).append("\"");
			}
			if (userdata != null) {
				sb.append(" userdata=").append("\"").append(userdata)
						.append("\"");
			}
			sb.append("></Dial></Request>").toString();
			requsetbody = sb.toString();

			LoggerUtil.info("ivrDial Request body = : " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("ivrDial response body = " + result);
		try {
			return xmlToMap(result);
		} catch (Exception e) {
			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 发起语音验证码请求
	 * 
	 * @param verifyCode
	 *            必选参数 验证码内容，为数字和英文字母，不区分大小写，长度4-8位
	 * @param to
	 *            必选参数 接收号码
	 * @param displayNum
	 *            可选参数 显示主叫号码，显示权限由服务侧控制
	 * @param playTimes
	 *            可选参数 循环播放次数，1－3次，默认播放1次
	 * @param respUrl
	 *            可选参数 语音验证码状态通知回调地址，云通讯平台将向该Url地址发送呼叫结果通知
	 * @param lang
	 *            可选参数 语言类型
	 * @param userData
	 *            可选参数 第三方私有数据
	 * @return
	 */
	public HashMap<String, Object> voiceVerify(String verifyCode, String to,
			String displayNum, String playTimes, String respUrl, String lang,
			String userData) {
		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if ((isEmpty(verifyCode)) || (isEmpty(to)))
			throw new IllegalArgumentException("必选参数:"
					+ (isEmpty(verifyCode) ? " 验证码内容 " : "")
					+ (isEmpty(to) ? " 接收号码 " : "") + "为空");
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1, VoiceVerify);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				json.addProperty("verifyCode", verifyCode);
				json.addProperty("to", to);
				if (!(isEmpty(displayNum)))
					json.addProperty("displayNum", displayNum);

				if (!(isEmpty(playTimes)))
					json.addProperty("playTimes", playTimes);

				if (!(isEmpty(respUrl)))
					json.addProperty("respUrl", respUrl);
				if (!(isEmpty(lang)))
					json.addProperty("lang", lang);
				if (!(isEmpty(userData)))
					json.addProperty("userData", userData);

				requsetbody = json.toString();
			} else {
				StringBuilder sb = new StringBuilder(
						"<?xml version='1.0' encoding='utf-8'?><VoiceVerify>");
				sb.append("<appId>").append(App_ID).append("</appId>")
						.append("<verifyCode>").append(verifyCode)
						.append("</verifyCode>").append("<to>").append(to)
						.append("</to>");
				if (!(isEmpty(displayNum)))
					sb.append("<displayNum>").append(displayNum)
							.append("</displayNum>");

				if (!(isEmpty(playTimes)))
					sb.append("<playTimes>").append(playTimes)
							.append("</playTimes>");

				if (!(isEmpty(respUrl)))
					sb.append("<respUrl>").append(respUrl).append("</respUrl>");
				if (!(isEmpty(lang)))
					sb.append("<lang>").append(lang).append("</lang>");
				if (!(isEmpty(userData)))
					sb.append("<userData>").append(userData)
							.append("</userData>");

				sb.append("</VoiceVerify>").toString();
				requsetbody = sb.toString();
			}

			LoggerUtil.info("voiceVerify Request body = : " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}

		LoggerUtil.info("voiceVerify response body = " + result);

		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 发送外呼通知请求
	 * 
	 * @param to
	 *            必选参数 被叫号码
	 * @param mediaName
	 *            可选参数 语音文件名称，格式 wav。与mediaTxt不能同时为空，不为空时mediaTxt属性失效
	 * @param mediaTxt
	 *            可选参数 文本内容，默认值为空
	 * @param displayNum
	 *            可选参数 显示的主叫号码，显示权限由服务侧控制
	 * @param playTimes
	 *            可选参数 循环播放次数，1－3次，默认播放1次
	 * @param type
	 *            可选参数 : 如果传入type=1，则播放默认语音文件
	 * @param respUrl
	 *            可选参数 外呼通知状态通知回调地址，云通讯平台将向该Url地址发送呼叫结果通知
	 * @param userData
	 *            可选参数 用户私有数据
	 * @param maxCallTime
	 *            可选参数 最大通话时长
	 * @param speed
	 *            可选参数 发音速度
	 * @param volume
	 *            可选参数 音量
	 * @param pitch
	 *            可选参数 音调
	 * @param bgsound
	 *            可选参数 背景音编号
	 * @return
	 */
	public HashMap<String, Object> landingCall(String to, String mediaName,
			String mediaTxt, String displayNum, String playTimes, int type,
			String respUrl,String userData, String maxCallTime, String speed,
			String volume, String pitch, String bgsound) {
		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if (isEmpty(to))
			throw new IllegalArgumentException("必选参数:"
					+ (isEmpty(to) ? " 被叫号码 " : "") + "为空");
		if ((isEmpty(mediaName)) && (isEmpty(mediaTxt)))
			throw new IllegalArgumentException("参数语音文件名称和参数语音文本内容不能同时为空");
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1, LandingCalls);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				json.addProperty("to", to);

				if (!(isEmpty(mediaName)))
					json.addProperty("mediaName", mediaName);
				if (type == 1) {
					json.addProperty("mediaNameType", "1");
				}

				if (!(isEmpty(mediaTxt)))
					json.addProperty("mediaTxt", mediaTxt);

				if (!(isEmpty(displayNum)))
					json.addProperty("displayNum", displayNum);
				if (!(isEmpty(playTimes)))
					json.addProperty("playTimes", playTimes);

				if (!(isEmpty(respUrl)))
					json.addProperty("respUrl", respUrl);
				if (!(isEmpty(userData)))
					json.addProperty("userData", userData);
				if (!(isEmpty(maxCallTime)))
					json.addProperty("maxCallTime", maxCallTime);
				if (!(isEmpty(speed)))
					json.addProperty("speed", speed);
				if (!(isEmpty(volume)))
					json.addProperty("volume", volume);
				if (!(isEmpty(pitch)))
					json.addProperty("pitch", pitch);
				if (!(isEmpty(bgsound)))
					json.addProperty("bgsound", bgsound);

				requsetbody = json.toString();
			} else {
				StringBuilder sb = new StringBuilder(
						"<?xml version='1.0' encoding='utf-8'?><LandingCall>");
				sb.append("<appId>").append(App_ID).append("</appId>")
						.append("<to>").append(to).append("</to>");
				if (!(isEmpty(mediaName)) && type == 1)
					sb.append("<mediaName type=\"1\">").append(mediaName)
							.append("</mediaName>");
				else if (!(isEmpty(mediaName)))
					sb.append("<mediaName>").append(mediaName)
							.append("</mediaName>");

				if (!(isEmpty(mediaTxt)))
					sb.append("<mediaTxt>").append(mediaTxt)
							.append("</mediaTxt>");

				if (!(isEmpty(displayNum)))
					sb.append("<displayNum>").append(displayNum)
							.append("</displayNum>");
				if (!(isEmpty(playTimes)))
					sb.append("<playTimes>").append(playTimes)
							.append("</playTimes>");

				if (!(isEmpty(respUrl)))
					sb.append("<respUrl>").append(respUrl).append("</respUrl>");
				if (!(isEmpty(userData)))
					sb.append("<userData>").append(userData).append("</userData>");
				if (!(isEmpty(maxCallTime)))
					sb.append("<maxCallTime>").append(maxCallTime).append("</maxCallTime>");
				if (!(isEmpty(speed)))
					sb.append("<speed>").append(speed).append("</speed>");
				if (!(isEmpty(volume)))
					sb.append("<volume>").append(volume).append("</volume>");
				if (!(isEmpty(pitch)))
					sb.append("<pitch>").append(pitch).append("</pitch>");
				if (!(isEmpty(bgsound)))
					sb.append("<bgsound>").append(bgsound).append("</bgsound>");

				sb.append("</LandingCall>").toString();
				requsetbody = sb.toString();
			}
			LoggerUtil.info("landingCalls Request body = : " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}

		LoggerUtil.info("landingCall response body = " + result);

		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 发送双向回拨请求
	 * 
	 * @param from
	 *            必选参数 主叫电话号码
	 * @param to
	 *            必选参数 被叫电话号码
	 * @param customerSerNum
	 *            可选参数 被叫侧显示的客服号码，根据平台侧显号规则控制
	 * @param fromSerNum
	 *            可选参数 主叫侧显示的号码，根据平台侧显号规则控制
	 * @param promptTone
	 *            可选参数 第三方自定义回拨提示音
	 * @param userData
	 *            可选参数 第三方私有数据
	 * @param maxCallTime
	 *            可选参数 最大通话时长
	 * @param hangupCdrUrl
	 *            可选参数 实时话单通知地址
	 * @param alwaysPlay
	 *            可选参数 是否一直播放提示音
	 * @param terminalDtmf
	 *            可选参数 用于终止播放提示音的按键
	 * @param needBothCdr
	 *            可选参数 是否给主被叫发送话单
	 * @param needRecord
	 *            可选参数 是否录音
	 * @param countDownTime
	 *            可选参数 设置倒计时时间
	 * @param countDownPrompt
	 *            可选参数 到达倒计时时间播放的提示音
	 * @return
	 */
	public HashMap<String, Object> callback(String from, String to,
			String customerSerNum, String fromSerNum, String promptTone,
			String alwaysPlay, String terminalDtmf, String userData,
			String maxCallTime, String hangupCdrUrl, String needBothCdr,
			String needRecord, String countDownTime, String countDownPrompt) {
		HashMap<String, Object> subAccountValidate = subAccountValidate();
		if (subAccountValidate != null)
			return subAccountValidate;

		if ((isEmpty(from)) || (isEmpty(to))) {
			LoggerUtil.fatal("必选参数:" + (isEmpty(from) ? " 主叫号码 " : "")
					+ (isEmpty(to) ? " 被叫号码 " : "") + "为空");
			throw new IllegalArgumentException("必选参数:"
					+ (isEmpty(from) ? " 主叫号码 " : "")
					+ (isEmpty(to) ? " 被叫号码 " : "") + "为空");
		}
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1, Call_back,
					AccountType.SubAccounts);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("from", from);
				json.addProperty("to", to);
				if (!(isEmpty(customerSerNum)))
					json.addProperty("customerSerNum", customerSerNum);

				if (!(isEmpty(fromSerNum)))
					json.addProperty("fromSerNum", fromSerNum);

				if (!(isEmpty(promptTone)))
					json.addProperty("promptTone", promptTone);

				if (!(isEmpty(userData)))
					json.addProperty("userData", userData);

				if (!(isEmpty(maxCallTime)))
					json.addProperty("maxCallTime", maxCallTime);

				if (!(isEmpty(hangupCdrUrl)))
					json.addProperty("hangupCdrUrl", hangupCdrUrl);
				if (!(isEmpty(terminalDtmf)))
					json.addProperty("terminalDtmf", terminalDtmf);
				if (!(isEmpty(alwaysPlay)))
					json.addProperty("alwaysPlay", alwaysPlay);
				if (!(isEmpty(needBothCdr)))
					json.addProperty("needBothCdr", needBothCdr);
				if (!(isEmpty(needRecord)))
					json.addProperty("needRecord", needRecord);
				if (!(isEmpty(countDownTime)))
					json.addProperty("countDownTime", countDownTime);
				if (!(isEmpty(countDownPrompt)))
					json.addProperty("countDownPrompt", countDownPrompt);

				requsetbody = json.toString();
			} else {
				StringBuilder sb = new StringBuilder(
						"<?xml version='1.0' encoding='utf-8'?><CallBack>");
				sb.append("<from>").append(from).append("</from>")
						.append("<to>").append(to).append("</to>");
				if (!(isEmpty(customerSerNum)))
					sb.append("<customerSerNum>").append(customerSerNum)
							.append("</customerSerNum>");

				if (!(isEmpty(fromSerNum)))
					sb.append("<fromSerNum>").append(fromSerNum)
							.append("</fromSerNum>");

				if (!(isEmpty(promptTone)))
					sb.append("<promptTone>").append(promptTone)
							.append("</promptTone>");

				if (!(isEmpty(userData)))
					sb.append("<userData>").append(userData)
							.append("</userData>");

				if (!(isEmpty(maxCallTime)))
					sb.append("<maxCallTime>").append(maxCallTime)
							.append("</maxCallTime>");

				if (!(isEmpty(hangupCdrUrl)))
					sb.append("<hangupCdrUrl>").append(hangupCdrUrl)
							.append("</hangupCdrUrl>");
				if (!(isEmpty(alwaysPlay)))
					sb.append("<alwaysPlay>").append(alwaysPlay)
							.append("</alwaysPlay>");
				if (!(isEmpty(terminalDtmf)))
					sb.append("<terminalDtmf>").append(terminalDtmf)
							.append("</terminalDtmf>");
				if (!(isEmpty(needBothCdr)))
					sb.append("<needBothCdr>").append(needBothCdr)
							.append("</needBothCdr>");
				if (!(isEmpty(needRecord)))
					sb.append("<needRecord>").append(needRecord)
							.append("</needRecord>");
				if (!(isEmpty(countDownTime)))
					sb.append("<countDownTime>").append(countDownTime)
							.append("</countDownTime>");
				if (!(isEmpty(countDownPrompt)))
					sb.append("<countDownPrompt>").append(countDownPrompt)
							.append("</countDownPrompt>");

				sb.append("</CallBack>").toString();

				requsetbody = sb.toString();

			}
			//System.out.println(requsetbody);
			LoggerUtil.info("Callback Request body =  " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}

		LoggerUtil.info("callback response body = " + result);

		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 发送短信模板请求
	 * 
	 * @param to
	 *            必选参数 短信接收端手机号码集合，用英文逗号分开，每批发送的手机号数量不得超过100个
	 * @param templateId
	 *            必选参数 模板Id
	 * @param datas
	 *            可选参数 内容数据，用于替换模板中{序号}
	 * @return
	 */
	public HashMap<String, Object> sendTemplateSMS(String to,
			String templateId, String[] datas) {
		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if ((isEmpty(to)) || (isEmpty(App_ID)) || (isEmpty(templateId)))
			throw new IllegalArgumentException("必选参数:"
					+ (isEmpty(to) ? " 手机号码 " : "")
					+ (isEmpty(templateId) ? " 模板Id " : "") + "为空");
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1, TemplateSMS);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				json.addProperty("to", to);
				json.addProperty("templateId", templateId);
				if (datas != null) {
					StringBuilder sb = new StringBuilder("[");
					for (String s : datas) {
						sb.append("\"" + s + "\"" + ",");
					}
					sb.replace(sb.length() - 1, sb.length(), "]");
					JsonParser parser = new JsonParser();
					JsonArray Jarray = parser.parse(sb.toString())
							.getAsJsonArray();
					json.add("datas", Jarray);
				}
				requsetbody = json.toString();
			} else {
				StringBuilder sb = new StringBuilder(
						"<?xml version='1.0' encoding='utf-8'?><TemplateSMS>");
				sb.append("<appId>").append(App_ID).append("</appId>")
						.append("<to>").append(to).append("</to>")
						.append("<templateId>").append(templateId)
						.append("</templateId>");
				if (datas != null) {
					sb.append("<datas>");
					for (String s : datas) {
						sb.append("<data>").append(s).append("</data>");
					}
					sb.append("</datas>");
				}
				sb.append("</TemplateSMS>").toString();
				requsetbody = sb.toString();
			}

			LoggerUtil.info("sendTemplateSMS Request body =  " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}

		LoggerUtil.info("sendTemplateSMS response body = " + result);

		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}
    
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		HashMap<String, Object> result = null;

		CCPRestSDK restAPI = new CCPRestSDK();
		restAPI.init("sandboxapp.cloopen.com", "8883");// 初始化服务器地址和端口，格式如下，服务器地址不需要写https://
		restAPI.setAccount("8a48b551505b4af001505f7e69d80af9", "e30f99bc89e8456495cca819f891702b");// 初始化主帐号和主帐号TOKEN
		restAPI.setAppId("8a48b5515427d27601542c4edd40058f");// 初始化应用ID
		result = restAPI.sendTemplateSMS("13437110175","80846" ,new String[]{"589125"});

		System.out.println("SDKTestSendTemplateSMS result=" + result);
		if("000000".equals(result.get("statusCode"))){
			//正常返回输出data包体信息（map）
			HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
			Set<String> keySet = data.keySet();
			for(String key:keySet){
				Object object = data.get(key);
				System.out.println(key +" = "+object);
			}
		}else{
			//异常返回输出错误码和错误信息
			System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
		}
	}
	
	
	
	/**
	 * 获取子帐号信息
	 * 
	 * @param appId
	 *            必选参数 应用Id
	 * @param friendlyName
	 *            必选参数 子帐号名称
	 * @return
	 */
	public HashMap<String, Object> querySubAccount(String friendlyName) {
		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if ((isEmpty(friendlyName))) {
			LoggerUtil.fatal("必选参数: 子帐号名称 为空");
			throw new IllegalArgumentException("必选参数: 子帐号名称 为空");
		}
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1,
					Query_SubAccountByName);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				json.addProperty("friendlyName", friendlyName);
				requsetbody = json.toString();
			} else {
				requsetbody = "<?xml version='1.0' encoding='utf-8'?><SubAccount>"
						+ "<appId>"
						+ App_ID
						+ "</appId>"
						+ "<friendlyName>"
						+ friendlyName + "</friendlyName>" + "</SubAccount>";
			}
			LoggerUtil.info("querySubAccountByName Request body =  "
					+ requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}

		LoggerUtil.info("querySubAccount result " + result);

		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}

	}

	/**
	 * 获取子帐号
	 * 
	 * @param startNo
	 *            可选参数 开始的序号，默认从0开始
	 * @param offset
	 *            可选参数 一次查询的最大条数，最小是1条，最大是100条
	 * @return
	 */
	public HashMap<String, Object> getSubAccounts(String startNo, String offset) {
		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1,
					Get_SubAccounts);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				if (!(isEmpty(startNo)))
					json.addProperty("startNo", startNo);
				if (!(isEmpty(offset)))
					json.addProperty("offset", offset);
				requsetbody = json.toString();
			} else {
				StringBuilder sb = new StringBuilder(
						"<?xml version='1.0' encoding='utf-8'?><SubAccount>");
				sb.append("<appId>").append(App_ID).append("</appId>");
				if (!(isEmpty(startNo)))
					sb.append("<startNo>").append(startNo).append("</startNo>");
				if (!(isEmpty(offset)))
					sb.append("<offset>").append(offset).append("</offset>");
				sb.append("</SubAccount>").toString();
				requsetbody = sb.toString();
			}
			LoggerUtil.info("GetSubAccounts Request body =  " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("getSubAccounts result " + result);

		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 获取主帐号信息查询
	 * 
	 * @return
	 */
	public HashMap<String, Object> queryAccountInfo() {
		if ((isEmpty(SERVER_IP))) {
			return getMyError("172004", "IP为空");
		}
		if ((isEmpty(SERVER_PORT))) {
			return getMyError("172005", "端口错误");
		}
		if ((isEmpty(ACCOUNT_SID))) {
			return getMyError("172006", "主帐号为空");
		}
		if ((isEmpty(ACCOUNT_TOKEN))) {
			return getMyError("172007", "主帐号TOKEN为空");
		}

		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			LoggerUtil.fatal(e1.getMessage());
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpGet httpGet = (HttpGet) getHttpRequestBase(0, Account_Info);
			HttpResponse response = httpclient.execute(httpGet);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("queryAccountInfo response body = " + result);
		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 创建子帐号
	 * 
	 * @param friendlyName
	 *            必选参数 子帐号名称。可由英文字母和阿拉伯数字组成子帐号唯一名称，推荐使用电子邮箱地址
	 * @return
	 */
	public HashMap<String, Object> createSubAccount(String friendlyName) {
		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if (isEmpty(friendlyName)) {
			LoggerUtil.fatal("必选参数: 子帐号名称 为空");
			throw new IllegalArgumentException("必选参数: 子帐号名称 为空");
		}

		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			LoggerUtil.error(e1.getMessage());
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1,
					Create_SubAccount);
			String requsetbody = "";

			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				json.addProperty("friendlyName", friendlyName);
				requsetbody = json.toString();
			} else {
				requsetbody = "<?xml version='1.0' encoding='utf-8'?><SubAccount>"
						+ "<appId>"
						+ App_ID
						+ "</appId>"
						+ "<friendlyName>"
						+ friendlyName + "</friendlyName>" + "</SubAccount>";
			}
			LoggerUtil.info("CreateSubAccount Request body =  " + requsetbody);

			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);

			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();

			if (entity != null) {
				result = EntityUtils.toString(entity, "UTF-8");
			}

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("createSubAccount response body = " + result);
		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 短信模板查询
	 * 
	 * @param templateId
	 *            可选参数 模板Id，不带此参数查询全部可用模板
	 * @return
	 */
	public HashMap<String, Object> QuerySMSTemplate(String templateId) {
		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;

		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			LoggerUtil.error(e1.getMessage());
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1,
					Query_SMSTemplate);
			String requsetbody = "";

			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				json.addProperty("templateId", templateId);
				requsetbody = json.toString();
			} else {
				requsetbody = "<?xml version='1.0' encoding='utf-8'?><Request>"
						+ "<appId>" + App_ID + "</appId>" + "<templateId>"
						+ templateId + "</templateId>" + "</Request>";
			}
			LoggerUtil.info("QuerySMSTemplate Request body =  " + requsetbody);

			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);

			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();

			if (entity != null) {
				result = EntityUtils.toString(entity, "UTF-8");
			}

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("QuerySMSTemplate response body = " + result);
		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 取消回拨
	 * 
	 * @param callSid
	 *            必选参数 一个由32个字符组成的电话唯一标识符
	 * @param type
	 *            可选参数 0： 任意时间都可以挂断电话；1 ：被叫应答前可以挂断电话，其他时段返回错误代码；2： 主叫应答前可以挂断电话，其他时段返回错误代码；默认值为0。
	 * @return
	 */
	public HashMap<String, Object> CallCancel(String callSid, String type) {

		HashMap<String, Object> subAccountValidate = subAccountValidate();
		if (subAccountValidate != null)
			return subAccountValidate;
		if ((isEmpty(callSid))) {
			LoggerUtil.fatal("必选参数: callSid  为空");
			throw new IllegalArgumentException("必选参数: callSid  为空");
		}
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			LoggerUtil.error(e1.getMessage());
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1, callCancel,
					AccountType.SubAccounts);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				json.addProperty("appId", App_ID);
				json.addProperty("callSid", callSid);
				if (!(isEmpty(type)))
					json.addProperty("type", type);

				requsetbody = json.toString();
			} else {
				StringBuilder sb = new StringBuilder(
						"<?xml version='1.0' encoding='utf-8'?><CallCancel>");
				sb.append("<appId>").append(App_ID).append("</appId>")
						.append("<callSid>").append(callSid)
						.append("</callSid>");
				if (!(isEmpty(type)))
					sb.append("<type>").append(type).append("</type>");

				sb.append("</CallCancel>").toString();
				requsetbody = sb.toString();
			}
			LoggerUtil.info("CallCancel Request body = : " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("billRecords response body = " + result);
		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 呼叫状态查询
	 * 
	 * @param callid
	 *            必选参数 呼叫Id
	 * @param action
	 *            可选参数 查询结果通知的回调url地址
	 * @return
	 */
	public HashMap<String, Object> QueryCallState(String callid, String action) {

		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if ((isEmpty(callid))) {
			LoggerUtil.fatal("必选参数: callid  为空");
			throw new IllegalArgumentException("必选参数: callid 为空");
		}
		Callsid = callid;
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			LoggerUtil.error(e1.getMessage());
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1, queryCallState);
			String requsetbody = "";
			if (BODY_TYPE == BodyType.Type_JSON) {
				JsonObject json = new JsonObject();
				JsonObject json2 = new JsonObject();
				json.addProperty("Appid", App_ID);
				json2.addProperty("callid", callid);
				if (!(isEmpty(action)))
					json2.addProperty("action", action);
				json.addProperty("QueryCallState", json2.toString());
				requsetbody = json.toString();
			} else {
				StringBuilder sb = new StringBuilder(
						"<?xml version='1.0' encoding='utf-8'?><Request>");
				sb.append("<Appid>").append(App_ID).append("</Appid>")
				.append("<QueryCallState callid=").append("\"").append(callid)
				.append("\"");
				if (action != null) {
					sb.append(" action=").append("\"").append(action)
							.append("\"").append("/");
				}

				sb.append("></Request>").toString();
				requsetbody = sb.toString();
			}
			LoggerUtil.info("queryCallState Request body = : " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("billRecords response body = " + result);
		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 呼叫结果查询
	 * 
	 * @param callSid
	 *            必选参数 呼叫Id
	 * @return
	 */
	public HashMap<String, Object> CallResult(String callSid) {
		if ((isEmpty(SERVER_IP))) {
			return getMyError("172004", "IP为空");
		}
		if ((isEmpty(SERVER_PORT))) {
			return getMyError("172005", "端口错误");
		}
		if ((isEmpty(ACCOUNT_SID))) {
			return getMyError("172006", "主帐号为空");
		}
		if ((isEmpty(ACCOUNT_TOKEN))) {
			return getMyError("172007", "主帐号TOKEN为空");
		}
		Callsid = callSid;
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			LoggerUtil.fatal(e1.getMessage());
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpGet httpGet = (HttpGet) getHttpRequestBase(0, callResult);
			HttpResponse response = httpclient.execute(httpGet);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("queryAccountInfo response body = " + result);
		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	/**
	 * 语音文件上传
	 * 
	 * @param filename
	 *            必选参数 文件名
	 * @param requsetbody
	 *            必选参数 二进制数据
	 * @return
	 */
	public String Filename;
	public HashMap<String, Object> MediaFileUpload(String filename, String requsetbody) {

		HashMap<String, Object> validate = accountValidate();
		if (validate != null)
			return validate;
		if ((isEmpty(filename))) {
			LoggerUtil.fatal("必选参数: filename  为空");
			throw new IllegalArgumentException("必选参数: filename 为空");
		}

		Filename=filename;
		CcopHttpClient chc = new CcopHttpClient();
		DefaultHttpClient httpclient = null;
		try {
			httpclient = chc.registerSSL(SERVER_IP, "TLS",
					Integer.parseInt(SERVER_PORT), "https");
		} catch (Exception e1) {
			e1.printStackTrace();
			LoggerUtil.error(e1.getMessage());
			throw new RuntimeException("初始化httpclient异常" + e1.getMessage());
		}
		String result = "";
		try {
			HttpPost httppost = (HttpPost) getHttpRequestBase(1,mediaFileUpload);

			LoggerUtil.info("MediaFileUpload Request body = : " + requsetbody);
			BasicHttpEntity requestBody = new BasicHttpEntity();
			requestBody.setContent(new ByteArrayInputStream(requsetbody
					.getBytes("UTF-8")));
			requestBody.setContentLength(requsetbody.getBytes("UTF-8").length);
			httppost.setEntity(requestBody);
			HttpResponse response = httpclient.execute(httppost);

			HttpEntity entity = response.getEntity();
			if (entity != null)
				result = EntityUtils.toString(entity, "UTF-8");

			EntityUtils.consume(entity);
		} catch (IOException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172001", "网络错误");
		} catch (Exception e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
			return getMyError("172002", "无返回");
		} finally {
			if (httpclient != null)
				httpclient.getConnectionManager().shutdown();
		}
		LoggerUtil.info("billRecords response body = " + result);
		try {
			if (BODY_TYPE == BodyType.Type_JSON) {
				return jsonToMap(result);
			} else {
				return xmlToMap(result);
			}
		} catch (Exception e) {

			return getMyError("172003", "返回包体错误");
		}
	}

	private HashMap<String, Object> jsonToMap(String result) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		JsonParser parser = new JsonParser();
		JsonObject asJsonObject = parser.parse(result).getAsJsonObject();
		Set<Entry<String, JsonElement>> entrySet = asJsonObject.entrySet();
		HashMap<String, Object> hashMap2 = new HashMap<String, Object>();

		for (Map.Entry<String, JsonElement> m : entrySet) {
			if ("statusCode".equals(m.getKey())
					|| "statusMsg".equals(m.getKey()))
				hashMap.put(m.getKey(), m.getValue().getAsString());
			else {
				if ("SubAccount".equals(m.getKey())
						|| "totalCount".equals(m.getKey())
						|| "smsTemplateList".equals(m.getKey())
						|| "token".equals(m.getKey())
						|| "callSid".equals(m.getKey())
						|| "state".equals(m.getKey())
						|| "downUrl".equals(m.getKey())) {
					if (!"SubAccount".equals(m.getKey())
							&& !"smsTemplateList".equals(m.getKey()))
						hashMap2.put(m.getKey(), m.getValue().getAsString());
					else {
						try {
							if ((m.getValue().toString().trim().length() <= 2)
									&& !m.getValue().toString().contains("[")) {
								hashMap2.put(m.getKey(), m.getValue()
										.getAsString());
								hashMap.put("data", hashMap2);
								break;
							}
							if (m.getValue().toString().contains("[]")) {
								hashMap2.put(m.getKey(), new JsonArray());
								hashMap.put("data", hashMap2);
								continue;
							}
							JsonArray asJsonArray = parser.parse(
									m.getValue().toString()).getAsJsonArray();
							ArrayList<HashMap<String, Object>> arrayList = new ArrayList<HashMap<String, Object>>();
							for (JsonElement j : asJsonArray) {
								Set<Entry<String, JsonElement>> entrySet2 = j
										.getAsJsonObject().entrySet();
								HashMap<String, Object> hashMap3 = new HashMap<String, Object>();
								for (Map.Entry<String, JsonElement> m2 : entrySet2) {
									hashMap3.put(m2.getKey(), m2.getValue()
											.getAsString());
								}
								arrayList.add(hashMap3);
							}
							hashMap2.put(m.getKey(), arrayList);
						} catch (Exception e) {
							JsonObject asJsonObject2 = parser.parse(
									m.getValue().toString()).getAsJsonObject();
							Set<Entry<String, JsonElement>> entrySet2 = asJsonObject2
									.entrySet();
							HashMap<String, Object> hashMap3 = new HashMap<String, Object>();
							for (Map.Entry<String, JsonElement> m2 : entrySet2) {
								hashMap3.put(m2.getKey(), m2.getValue()
										.getAsString());
							}
							hashMap2.put(m.getKey(), hashMap3);
							hashMap.put("data", hashMap2);
						}

					}
					hashMap.put("data", hashMap2);
				} else {

					JsonObject asJsonObject2 = parser.parse(
							m.getValue().toString()).getAsJsonObject();
					Set<Entry<String, JsonElement>> entrySet2 = asJsonObject2
							.entrySet();
					HashMap<String, Object> hashMap3 = new HashMap<String, Object>();
					for (Map.Entry<String, JsonElement> m2 : entrySet2) {
						hashMap3.put(m2.getKey(), m2.getValue().getAsString());
					}
					if (hashMap3.size() != 0) {
						hashMap2.put(m.getKey(), hashMap3);
					} else {
						hashMap2.put(m.getKey(), m.getValue().getAsString());
					}
					hashMap.put("data", hashMap2);
				}
			}
		}
		return hashMap;
	}

	/**
	 * @description 将xml字符串转换成map
	 * @param xml
	 * @return Map
	 */
	private HashMap<String, Object> xmlToMap(String xml) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Document doc = null;
		try {
			doc = DocumentHelper.parseText(xml); // 将字符串转为XML
			Element rootElt = doc.getRootElement(); // 获取根节点
			HashMap<String, Object> hashMap2 = new HashMap<String, Object>();
			ArrayList<HashMap<String, Object>> arrayList = new ArrayList<HashMap<String, Object>>();
			for (Iterator i = rootElt.elementIterator(); i.hasNext();) {
				Element e = (Element) i.next();
				if ("statusCode".equals(e.getName())
						|| "statusMsg".equals(e.getName()))
					map.put(e.getName(), e.getText());
				else {
					if ("SubAccount".equals(e.getName())
							|| "TemplateSMS".equals(e.getName())
							|| "totalCount".equals(e.getName())
							|| "token".equals(e.getName())
							|| "callSid".equals(e.getName())
							|| "state".equals(e.getName())
							|| "downUrl".equals(e.getName())) {
						if (!"SubAccount".equals(e.getName())&&!"TemplateSMS".equals(e.getName())) {
							hashMap2.put(e.getName(), e.getText());
						} else if ("SubAccount".equals(e.getName())){

							HashMap<String, Object> hashMap3 = new HashMap<String, Object>();
							for (Iterator i2 = e.elementIterator(); i2
									.hasNext();) {
								Element e2 = (Element) i2.next();
								hashMap3.put(e2.getName(), e2.getText());
							}
							arrayList.add(hashMap3);
							hashMap2.put("SubAccount", arrayList);
						}else if ("TemplateSMS".equals(e.getName())){

							HashMap<String, Object> hashMap3 = new HashMap<String, Object>();
							for (Iterator i2 = e.elementIterator(); i2
									.hasNext();) {
								Element e2 = (Element) i2.next();
								hashMap3.put(e2.getName(), e2.getText());
							}
							arrayList.add(hashMap3);
							hashMap2.put("TemplateSMS", arrayList);
						}
						map.put("data", hashMap2);
					} else {

						HashMap<String, Object> hashMap3 = new HashMap<String, Object>();
						for (Iterator i2 = e.elementIterator(); i2.hasNext();) {
							Element e2 = (Element) i2.next();
							// hashMap2.put(e2.getName(),e2.getText());
							hashMap3.put(e2.getName(), e2.getText());
						}
						if (hashMap3.size() != 0) {
							hashMap2.put(e.getName(), hashMap3);
						} else {
							hashMap2.put(e.getName(), e.getText());
						}
						map.put("data", hashMap2);
					}
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();
			LoggerUtil.error(e.getMessage());
		} catch (Exception e) {
			LoggerUtil.error(e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	private HttpRequestBase getHttpRequestBase(int get, String action)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		return getHttpRequestBase(get, action, AccountType.Accounts);
	}

	private HttpRequestBase getHttpRequestBase(int get, String action,
			AccountType mAccountType) throws NoSuchAlgorithmException,
			UnsupportedEncodingException {
		String timestamp = DateUtil.dateToStr(new Date(),
				DateUtil.DATE_TIME_NO_SLASH);
		EncryptUtil eu = new EncryptUtil();
		String sig = "";
		String acountName = "";
		String acountType = "";
		if (mAccountType == AccountType.Accounts) {
			acountName = ACCOUNT_SID;
			sig = ACCOUNT_SID + ACCOUNT_TOKEN + timestamp;
			acountType = "Accounts";
		} else {
			acountName = SUBACCOUNT_SID;
			sig = SUBACCOUNT_SID + SUBACCOUNT_Token + timestamp;
			acountType = "SubAccounts";
		}
		String signature = eu.md5Digest(sig);

		String url = getBaseUrl().append("/" + acountType + "/")
				.append(acountName).append("/" + action + "?sig=")
				.append(signature).toString();
		if (callResult.equals(action)) {
			url = url + "&callsid=" + Callsid;
		}
		if (queryCallState.equals(action)) {
			url = url + "&callid=" + Callsid;
		}
		if (mediaFileUpload.equals(action)) {
			url = url + "&appid=" + App_ID + "&filename=" + Filename;
		}
		LoggerUtil.info(getmethodName(action) + " url = " + url);
		HttpRequestBase mHttpRequestBase = null;
		if (get == Request_Get)
			mHttpRequestBase = new HttpGet(url);
		else if (get == Request_Post)
			mHttpRequestBase = new HttpPost(url);
		if (IvrDial.equals(action)) {
			setHttpHeaderXML(mHttpRequestBase);
		} else if (mediaFileUpload.equals(action)) {
			setHttpHeaderMedia(mHttpRequestBase);
		} else {
			setHttpHeader(mHttpRequestBase);
		}

		String src = acountName + ":" + timestamp;

		String auth = eu.base64Encoder(src);
		mHttpRequestBase.setHeader("Authorization", auth);
		return mHttpRequestBase;
	}

	private String getmethodName(String action) {
		if (action.equals(Account_Info)) {
			return "queryAccountInfo";
		} else if (action.equals(Create_SubAccount)) {
			return "createSubAccount";
		} else if (action.equals(Get_SubAccounts)) {
			return "getSubAccounts";
		} else if (action.equals(Query_SubAccountByName)) {
			return "querySubAccount";
		} else if (action.equals(SMSMessages)) {
			return "sendSMS";
		} else if (action.equals(TemplateSMS)) {
			return "sendTemplateSMS";
		} else if (action.equals(Call_back)) {
			return "callback";
		} else if (action.equals(LandingCalls)) {
			return "landingCalls";
		} else if (action.equals(VoiceVerify)) {
			return "voiceVerify";
		} else if (action.equals(IvrDial)) {
			return "ivrDial";
		} else if (action.equals(BillRecords)) {
			return "billRecords";
		} else {
			return "";
		}
	}

	private void setHttpHeaderXML(AbstractHttpMessage httpMessage) {
		httpMessage.setHeader("Accept", "application/xml");
		httpMessage.setHeader("Content-Type", "application/xml;charset=utf-8");
	}
	
	private void setHttpHeaderMedia(AbstractHttpMessage httpMessage) {
		if (BODY_TYPE == BodyType.Type_JSON) {
			httpMessage.setHeader("Accept", "application/json");
			httpMessage.setHeader("Content-Type", "application/octet-stream;charset=utf-8;");
		} else {
			httpMessage.setHeader("Accept", "application/xml");
			httpMessage.setHeader("Content-Type", "application/octet-stream;charset=utf-8;");
		}
	}

	private void setHttpHeader(AbstractHttpMessage httpMessage) {
		if (BODY_TYPE == BodyType.Type_JSON) {
			httpMessage.setHeader("Accept", "application/json");
			httpMessage.setHeader("Content-Type",
					"application/json;charset=utf-8");
		} else {
			httpMessage.setHeader("Accept", "application/xml");
			httpMessage.setHeader("Content-Type",
					"application/xml;charset=utf-8");
		}
	}

	private StringBuffer getBaseUrl() {
		StringBuffer sb = new StringBuffer("https://");
		sb.append(SERVER_IP).append(":").append(SERVER_PORT);
		sb.append("/2013-12-26");
		return sb;
	}

	private boolean isEmpty(String str) {
		return (("".equals(str)) || (str == null));
	}

	private HashMap<String, Object> getMyError(String code, String msg) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("statusCode", code);
		hashMap.put("statusMsg", msg);
		return hashMap;
	}

	private HashMap<String, Object> subAccountValidate() {
		if ((isEmpty(SERVER_IP))) {
			return getMyError("172004", "IP为空");
		}
		if ((isEmpty(SERVER_PORT))) {
			return getMyError("172005", "端口错误");
		}
		if (isEmpty(SUBACCOUNT_SID))
			return getMyError("172008", "子帐号空");
		if (isEmpty(SUBACCOUNT_Token))
			return getMyError("172009", "子帐号TOKEN空");
		return null;
	}

	private HashMap<String, Object> accountValidate() {
		if ((isEmpty(SERVER_IP))) {
			return getMyError("172004", "IP为空");
		}
		if ((isEmpty(SERVER_PORT))) {
			return getMyError("172005", "端口错误");
		}
		if ((isEmpty(ACCOUNT_SID))) {
			return getMyError("172006", "主帐号为空");
		}
		if ((isEmpty(ACCOUNT_TOKEN))) {
			return getMyError("172007", "主帐号TOKEN为空");
		}
		if ((isEmpty(App_ID))) {
			return getMyError("172012", "应用ID为空");
		}
		return null;
	}

	private void setBodyType(BodyType bodyType) {
		BODY_TYPE = bodyType;
	}
}