package com.biocor.util;
import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;
 
public class ThumbImagesUitl {
	
	public void testHandlePicture() throws IOException{  
        
        //创建图片文件(此处为1024×768px的图片)和处理后的图片文件  
        File fromPic=new File("e:/1.png");  
        File toPic=new File("e:/1.png");  
        //按指定大小把图片进行缩和放（会遵循原图高宽比例）   
        //此处把图片压成400×500的缩略图  
        Thumbnails.of(fromPic).size(720,330).toFile(toPic);//变为400*300,遵循原图比例缩或放到400*某个高度  
 
	}
	
	public static void main(String[] args) {
		ThumbImagesUitl m =new ThumbImagesUitl();
		try {
			m.testHandlePicture();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
