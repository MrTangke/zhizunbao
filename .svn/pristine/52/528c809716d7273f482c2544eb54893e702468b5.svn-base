package www.zhizunbao.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;


/**
 * 
* @ClassName: FilesUtils  
* @Description: 上传文件工具类
* @date 2017年5月10日 上午9:06:09  
*
 */
public class FilesUtils {
	
    private FilesUtils() {
        throw new Error("The class Cannot be instance !");
    }

    /**
     * 
    * @Title: FilesUpload_Spring  
    * @Description: SpringMVC上传文件
    * @param @param request
    * @param @param multipartFile
    * @param @param filePath
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws
     */
    public static String FilesUpload_Spring(HttpServletRequest request, MultipartFile multipartFile, String filePath) {
        if (multipartFile != null) {
            String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
            String UUIDName = getUUIDName(suffix);
            String path = getPath_xm(request, filePath, UUIDName);
            try {
                multipartFile.transferTo(new File(path));
                return path;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        } else
            return null;
    }
    
    /**
     * 
    * @Title: FilesUpload_zd  
    * @Description: 文件上传--指定文件夹
    * @param @param request
    * @param @param multipartFile
    * @param @param filePath
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws
     */       // filePath   d://upload
    public static String FilesUpload_zd(HttpServletRequest request,MultipartFile multipartFile,String filePath) {
        if (multipartFile != null) {
        	 String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
             String UUIDName = getUUIDName(suffix);
             String path = getPath_zd(request, filePath, UUIDName);
            try{
                InputStream inputStream = multipartFile.getInputStream();
                FileOutputStream fileOutputStream = new FileOutputStream(path);
                byte buffer[] = new byte[4096];
                long fileSize = multipartFile.getSize();
                if(fileSize<=buffer.length){
                    buffer = new byte[(int)fileSize];
                }
                int line =0;
                while((line = inputStream.read(buffer)) >0 )
                {
                    fileOutputStream.write(buffer,0,line);
                }
                fileOutputStream.close();
                inputStream.close();
                return path;
            }catch (Exception e){
                e.printStackTrace();
            }
        } else
            return null;
        return null;
    }
    
    
    /**  
    * @Title: FilesUpload_xm  
    * @Description: 文件上传--项目文件夹
    * @param @param request
    * @param @param multipartFile
    * @param @param filePath
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws  
    */
    public static String FilesUpload_xm(HttpServletRequest request,MultipartFile multipartFile,String filePath) {
        if (multipartFile != null) {
        	 // 文件后缀  .png
        	 String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
        	 // uuid+文件后缀   c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg
             String UUIDName = getUUIDName(suffix);
             // 存入磁盘的路径
             String path = getPath_xm(request, filePath, UUIDName);
             
             // 数据库存储路径
             String dbUrl = getPath_db(request, filePath, UUIDName);
            try{
                InputStream inputStream = multipartFile.getInputStream();
                // 写入本地磁盘
                FileOutputStream fileOutputStream = new FileOutputStream(path);
                byte buffer[] = new byte[4096];
                long fileSize = multipartFile.getSize();
                if(fileSize<=buffer.length){
                    buffer = new byte[(int)fileSize];
                }
                int line =0;
                while((line = inputStream.read(buffer)) >0 )
                {
                    fileOutputStream.write(buffer,0,line);
                }
                fileOutputStream.close();
                inputStream.close();
                return dbUrl;
            }catch (Exception e){
            	
                e.printStackTrace();
            }
        } else
            return null;
        return null;
    }

    /**
     * 
    * @Title: FilesDownload_zd  
    * @Description: 文件下载
    * @param @param request
    * @param @param response
    * @param @param filePath    设定文件  
    * @return void    返回类型  
    * @throws
     */
    public static void FilesDownload(HttpServletRequest request, HttpServletResponse response, String filePath) {
    	// getServerPath(request, "")     D:\\work\\workspace\\ssm_Final\\WebContent
    	// File.separator \\
    	// filePath  upload\20170510\3c9573c9-2c2a-4c7b-8dcc-615b3a938791.jpg
    	// 获取本地磁盘路径
    	filePath = getServerPath(request, "") + File.separator + filePath;
        File file = new File(filePath);
        String filenames = file.getName();
        InputStream inputStream;
        try {
            inputStream = new BufferedInputStream(new FileInputStream(file));
            byte[] buffer = new byte[inputStream.available()];
            inputStream.read(buffer);
            inputStream.close();
            response.reset();
            // 先去掉文件名称中的空格,然后转换编码格式为utf-8,保证不出现乱码,这个文件名称用于浏览器的下载框中自动显示的文件名
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filenames.replaceAll(" ", "").getBytes("utf-8"), "iso8859-1"));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream os = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            os.write(buffer);// 输出文件
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 
    * @Title: getServerPath  
    * @Description: 获取项目路径
    * @param @param request
    * @param @param filePath
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws
     */
    public static String getServerPath(HttpServletRequest request, String filePath) {
    	return request.getSession().getServletContext().getRealPath(filePath);
    }

    /**
     * 
    * @Title: getDataPath  
    * @Description: 获取当前日期
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws
     */
    public static String getDataPath() {
        return new SimpleDateFormat("yyyyMMdd").format(new Date());
    }

    /**
     * 
    * @Title: checkDir  
    * @Description: 检查文件是否存在
    * @param @param savePath    设定文件  
    * @return void    返回类型  
    * @throws
     */
    public static void checkDir(String savePath) {
        File dir = new File(savePath);
        if (!dir.exists() || !dir.isDirectory()) {
            dir.mkdir();
        }
    }

    /**
     * 
    * @Title: getUUIDName  
    * @Description: 随机生成UUID名称
    * @param @param suffix
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws
     */
    public static String getUUIDName(String suffix) {
        return UUID.randomUUID().toString() + suffix;
    }

    /**
     * 
    * @Title: getPath_zd  
    * @Description: 获取存储路径--指定路径
    * @param @param request
    * @param @param filePath
    * @param @param UUIDName
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws
     */
    public static String getPath_zd(HttpServletRequest request, String filePath, String UUIDName) {
    	String savePath = filePath + File.separator + getDataPath() + File.separator;
        checkDir(savePath);//检查文件是否存在
        return savePath + UUIDName;
    }
    
    /**
     * 
    * @Title: getPath_xm  
    * @Description: 获取存储路径--项目路径
    * @param @param request
    * @param @param filePath
    * @param @param UUIDName
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws
     */
    public static String getPath_xm(HttpServletRequest request, String filePath, String UUIDName) {
    	//D:\\work\\workspace\\ssm_Final\\WebContent\\upload\\20170510\\c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg
    	
    	// getServerPath(request, filePath)         D:\\work\\workspace\\ssm_Final\\WebContent\\upload
    	// File.separator   \\
    	// getDataPath()    20170510
    	// File.separator   \\
    	// UUIDName         c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg
    	String savePath = getServerPath(request, filePath) + File.separator + getDataPath() + File.separator;
        checkDir(savePath);//检查文件夹是否存在
        return savePath + UUIDName;
    }
    
    /**
     * 
    * @Title: getPath_db  
    * @Description: 数据库存储路径
    * @param @param request
    * @param @param filePath
    * @param @param UUIDName
    * @param @return    设定文件  
    * @return String    返回类型  
    * @throws
     */
    public static String getPath_db(HttpServletRequest request, String filePath, String UUIDName) {
    	//\\upload\\20170510\\c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg

    	// File.separator   \\
    	// getDataPath()    20170510
    	// File.separator   \\
    	// UUIDName         c22adcd5-841e-4129-9dae-ce164ab41d7d.jpg
    	
    	String savePath = filePath.substring(1) + File.separator + getDataPath() + File.separator;
        checkDir(savePath);//检查文件夹是否存在
        return savePath + UUIDName;
    }
    
    /**
     * 
    * @Title: FileDelete  
    * @Description: 文件删除
    * @param @param request
    * @param @param filePath
    * @param @return    设定文件  
    * @return boolean    返回类型  
    * @throws
     */
    public static boolean FileDelete(HttpServletRequest request,String filePath) {
    	// D:\\work\\workspace\\ssm_Final\\WebContent\\upload\\20170515\\97c1042c-3e08-4643-a731-1282f069a3e4.png
    	String fileRealPath = getServerPath(request, "") + File.separator + filePath;
    	File file = new File(fileRealPath);
    	return file.delete();
    }

}
