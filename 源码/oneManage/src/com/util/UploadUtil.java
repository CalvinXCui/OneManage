package com.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;



import org.springframework.web.multipart.MultipartFile;

import Decoder.BASE64Encoder;

import com.google.gson.Gson;

public class UploadUtil {

	private static Logger log = Logger.getLogger(UploadUtil.class);
	
	public static String uploadFile(MultipartFile file, String path) throws IOException{
		String name = file.getOriginalFilename();//上传文件的真实名称
		String suffixName = name.substring(name.lastIndexOf("."));//获取后缀名
		String hash = Integer.toHexString(new Random().nextInt());
		String fileName = hash + suffixName;
		File tempFile = new File(path, fileName);
		if(!tempFile.getParentFile().exists()){
			tempFile.getParentFile().mkdir();
		}
		if(tempFile.exists()){
			tempFile.delete();
		}
		tempFile.createNewFile();
		file.transferTo(tempFile);
		
		return tempFile.getName();
		
	}
}
