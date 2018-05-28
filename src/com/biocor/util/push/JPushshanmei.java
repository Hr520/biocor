package com.biocor.util.push;

import com.biocor.util.push.model.Message;
import com.biocor.util.push.model.Options;
import com.biocor.util.push.model.Platform;
import com.biocor.util.push.model.PushPayload;
import com.biocor.util.push.model.audience.Audience;
import com.biocor.util.push.model.audience.AudienceTarget;
import com.biocor.util.push.model.notification.AndroidNotification;
import com.biocor.util.push.model.notification.IosNotification;
import com.biocor.util.push.model.notification.Notification;

public class JPushshanmei {

	public static final String TITLE = "";
	public static final String ALERT = "";
	public static final String MSG_CONTENT = "";
	public static final String REGISTRATION_ID = "";
	public static final String TAG = "";

	private static String appKey = "3436e4a82ff503d671bb6ccf";
	private static String masterSecret = "f194c81f8af76f4c7189517a";

	public static void main(String[] args) {
		// sendByAlias("您好推送测试---------","64");
		 sendAll("测试所有人");
//		String tag1 = "1049taga";
//		String content = "哈哈";
//		sendByRegisterId(content, "191e35f7e04ac348898");
//		sendByAlias(content, tag1);

	}

	/**
	 * 分组推送
	 * 
	 * @param tag1
	 * @param tag2
	 * @param content
	 */
	public static void sendGroup(String tag1, String tag2, String content) {
		try {

			JPushClient jPushClient = new JPushClient(masterSecret, appKey);
			PushPayload payload = buildPushObject_ios_audienceMore_messageWithExtras(tag1, tag2, content);
			PushResult result = jPushClient.sendPush(payload);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 分组推送 目标 安卓苹果
	 * 
	 * @return
	 */
	public static PushPayload buildPushObject_ios_audienceMore_messageWithExtras(String tag1, String tag2,
			String content) {
		return PushPayload.newBuilder().setPlatform(Platform.android_ios())
				.setAudience(Audience.newBuilder().addAudienceTarget(AudienceTarget.tag(tag1, tag2))
						.addAudienceTarget(AudienceTarget.alias("alias1", "alias2")).build())
				.setMessage(Message.newBuilder().setMsgContent(content).addExtra("from", "JPush").build()).build();
	}

	/**
	 * 通过registerId 单条推送
	 * 
	 * @param content
	 * @param registrationId
	 */
	public static void sendByRegisterId(String content, String registrationId) {
		try {
			JPushClient jPushClient = new JPushClient(masterSecret, appKey);
			PushPayload payload = buildPushObject_register_alert(content, registrationId);
			PushResult result = jPushClient.sendPush(payload);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 推送所有人
	 * 
	 * @param content
	 */
	public static void sendAll(String content) {
		try {
			JPushClient jpClient = new JPushClient(masterSecret, appKey);
			PushPayload payload = buildPushObject_all_all_alert(content);
			PushResult result = jpClient.sendPush(payload);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 通过alias单条推送
	 * 
	 * @param content
	 * @param tag
	 */
	public static void sendByAlias(String content, String alias) {
		try {
			JPushClient jPushClient = new JPushClient(masterSecret, appKey);
			PushPayload payload = buildPushObject_alias_alert(content, alias);
			PushResult result = jPushClient.sendPush(payload);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/********************************************************************/
	// 通过registerId 推送单条
	public static PushPayload buildPushObject_register_alert(String content, String registrationId) {
		return PushPayload.newBuilder().setPlatform(Platform.all())// 设置接受的平台
				.setAudience(Audience.registrationId(registrationId))// Audience设置为all，说明采用广播方式推送，所有用户都可以接收到
				.setNotification(Notification.alert(content)).build();
	}

	// 推送所有的
	public static PushPayload buildPushObject_all_all_alert(String content) {
		return PushPayload.alertAll(content);
	}

	// 通过alias推送单条
	public static PushPayload buildPushObject_alias_alert(String content, String alias) {
		return PushPayload.newBuilder().setPlatform(Platform.all())// 设置接受的平台
				.setAudience(Audience.alias(alias)).setNotification(Notification.alert(content))
				.setOptions(Options.newBuilder().setApnsProduction(false)// 此字段的值是用来指定本推送要推送的apns环境，false表示开发，true表示生产；对android和自定义消息无意义
						.setSendno(1)// 此字段是给开发者自己给推送编号，方便推送者分辨推送记录
						.setTimeToLive(86400)// 此字段的值是用来指定本推送的离线保存时长，如果不传此字段则默认保存一天，最多指定保留十天；
						.build())
				.build();
	}

	/*********************************************************************/

	public static PushPayload buildPushObject_all_alias_alert() {
		return PushPayload.newBuilder().setPlatform(Platform.all())// 设置接受的平台
				.setAudience(Audience.all())// Audience设置为all，说明采用广播方式推送，所有用户都可以接收到
				.setNotification(Notification.alert(ALERT))
				.setOptions(Options.newBuilder().setApnsProduction(true)// 此字段的值是用来指定本推送要推送的apns环境，false表示开发，true表示生产；对android和自定义消息无意义
						.setSendno(1)// 此字段是给开发者自己给推送编号，方便推送者分辨推送记录
						.setTimeToLive(86400)// 此字段的值是用来指定本推送的离线保存时长，如果不传此字段则默认保存一天，最多指定保留十天；
						.build())
				.build();
	}

	public static PushPayload buildPushObject_android_tag_alertWithTitle() {
		return PushPayload.newBuilder().setPlatform(Platform.android()).setAudience(Audience.all())
				.setNotification(Notification.android(ALERT, TITLE, null)).build();
	}

	public static PushPayload buildPushObject_android_and_ios() {
		return PushPayload.newBuilder().setPlatform(Platform.android_ios()).setAudience(Audience.tag("tag1"))
				.setNotification(Notification.newBuilder().setAlert("alert content")
						.addPlatformNotification(AndroidNotification.newBuilder().setTitle("Android Title").build())
						.addPlatformNotification(
								IosNotification.newBuilder().incrBadge(1).addExtra("extra_key", "extra_value").build())
						.build())
				.build();
	}

	public static PushPayload buildPushObject_ios_tagAnd_alertWithExtrasAndMessage() {
		return PushPayload.newBuilder().setPlatform(Platform.ios()).setAudience(Audience.tag_and("tag1", "tag_all"))
				.setNotification(Notification.newBuilder()
						.addPlatformNotification(IosNotification.newBuilder().setAlert(ALERT).setBadge(5)
								.setSound("happy").addExtra("from", "JPush").build())
						.build())
				.setMessage(Message.content(MSG_CONTENT))
				.setOptions(Options.newBuilder().setApnsProduction(true).build()).build();
	}

}
