package com.biocor.util;


import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.UUID;

import javax.imageio.ImageIO;

import com.swetake.util.Qrcode;

public class QRCode {

	public void encoderQRCode(String content, String imgPath) {
		try {
			Qrcode qrcodeHandler = new Qrcode();
			// 设置二维码排错率，可选L(7%)、M(15%)、Q(25%)、H(30%)，排错率越高可存储的信息越少，但对二维码清晰度的要求越小
			qrcodeHandler.setQrcodeErrorCorrect('L');
			qrcodeHandler.setQrcodeEncodeMode('B');
			qrcodeHandler.setQrcodeVersion(5);
			System.out.println(content);
			// int imgSize = 67 + 12 * (size - 1);
			byte[] contentBytes = content.getBytes("gb2312");
			BufferedImage bufImg = new BufferedImage(115, 115,
					BufferedImage.TYPE_INT_RGB);
			Graphics2D gs = bufImg.createGraphics();
			gs.setBackground(Color.WHITE);
			gs.clearRect(0, 0, 115, 115);
			// 设定图像颜色> BLACK
			gs.setColor(Color.BLACK);
			// 设置偏移量 不设置可能导致解析出错
			int pixoff = 2;
			// 输出内容> 二维码
			if (contentBytes.length > 0 && contentBytes.length < 120) {
				boolean[][] codeOut = qrcodeHandler.calQrcode(contentBytes);
				for (int i = 0; i < codeOut.length; i++) {
					for (int j = 0; j < codeOut.length; j++) {
						if (codeOut[j][i]) {
							gs.fillRect(j * 3 + pixoff, i * 3 + pixoff, 3, 3);
						}
					}
				}
			} else {
				System.err.println("QRCode content bytes length = "
						+ contentBytes.length + " not in [ 0,120 ]. ");
			}
			
			/* 加 logo 图片
			if( !StringUtil.isNull(logo) ){
				Image img = ImageIO.read(new File(logo));//实例化一个Image对象。
		        gs.drawImage(img, 44, 55, 49, 30, null);
			}*/
			gs.dispose();
			bufImg.flush();
			File imgFile = new File(imgPath);
			if(!imgFile.exists()){  
				imgFile.mkdirs();  
             } 
			// 生成二维码QRCode图片
			ImageIO.write(bufImg, "png", imgFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {

		String str = UUID.randomUUID().toString();
		str = str.replaceAll("-", "");
		String imgPath = "E:/upload/" + str + ".png";
		String content = "http://115.28.4.16/xishuai/interface/scanCode?id=765e43f593404a52bb92430174de452f&type=1";
		QRCode handler = new QRCode();
		handler.encoderQRCode(content, imgPath);
		System.out.println("imgPath:" + imgPath);
		System.out.println("encoder QRcode success");
	}
}
