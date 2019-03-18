package com.controller.sys;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.service.user.UserServiceImpl;
import com.util.Tool;
import com.util.UploadUtil;
/*
 * 登陆
 * 
 */
@Controller
@RequestMapping("/upload")
public class UploadController {

	@Autowired
	UserServiceImpl userService;
	
	private static Logger log = Logger.getLogger(UploadController.class);
	
	@ResponseBody
	@RequestMapping(value="image", method = RequestMethod.POST)
	public Map<String, Object> image(MultipartFile file, HttpServletRequest request){
		
		Map<String, Object> map = new HashMap<String, Object>();
		try{
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
			System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			
			String path = request.getSession().getServletContext().getRealPath("\\upload\\image\\" );
			log.info("文件夹路径" + path);
			String image = UploadUtil.uploadFile(file, path);
			map.put("code", 0);
			map.put("image", image);
		}catch (Exception e){
			map.put("code", 1);
			e.printStackTrace();
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("uploadimg")
	public Map<String, Object> uploadimg(HttpServletRequest request) throws IOException {
		//0代表失败，1代表成功，2格式错误
		Map<String, Object> map=new HashMap<String, Object>();
        // 转型为MultipartHttpRequest  
        try {  
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
            List<MultipartFile> fileList = multipartRequest.getFiles("file");  
            for (MultipartFile mf : fileList) { 
                if(!mf.isEmpty()){
                	try {  
                        // 文件保存路径  
                		String dirname=Tool.getyyyyMMdd();
                		String Path = "/upload/image/"+dirname+"/";
                        String filePath = request.getSession().getServletContext().getRealPath("/upload/image/"+dirname+"/" );
                        File file = new File(filePath);
                		if (!file.exists()) {
                			file.mkdirs();
                		}
                        String filenamelast=getfilenamelast(mf.getOriginalFilename()).toUpperCase();
                        if(!filenamelast.equals(".JPG")&&!filenamelast.equals(".GIF")&&!filenamelast.equals(".JPEG")&&!filenamelast.equals(".PNG")&&!filenamelast.equals(".SWF")){
                        	 map.put("code", "2");
                        	 map.put("msg", "不是图片！");
                        }else{
                        	filenamelast=Tool.getyyyyMMddHHmmssSSS()+Tool.getRandom()+filenamelast;
                        	map.put("code", "1");
                        	map.put("msg", "上传成功！");
                        	// 转存文件  
                        	filePath = filePath + "/";
                        	Map<String, String> m = new HashMap<String, String>();
                        	m.put("src", Path+filenamelast);
                        	map.put("data", m);
                        	mf.transferTo(new File(filePath+filenamelast));  
                        }
					} catch (Exception e) {
						map.put("code", "0");
						map.put("msg", "上传失败！");
						e.printStackTrace();
					}
                }  
            }  
        } catch (Exception e) {
            e.printStackTrace();  
        } 
        //JSONObject json = new JSONObject(map);
        System.out.println(map);
        return map;
		//return map;
	}
	
    //获取文件名
    private String getfilenamelast(String filename){
    	int start=filename.lastIndexOf(".");
    	if(start!=-1){
    		filename=filename.substring(start, filename.length());
    	}
    	return filename;
    }
	
	
}
