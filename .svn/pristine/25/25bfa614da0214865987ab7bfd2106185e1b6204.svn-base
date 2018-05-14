package www.zhizunbao.utils;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.coyote.http11.filters.SavedRequestInputFilter;
import org.apache.log4j.Logger;

import freemarker.template.Configuration;
import freemarker.template.Template;
/**
* @Desc：word操作工具类
*
* */
public class WordUtil {
private static Logger log = Logger.getLogger(WordUtil.class);
/**
* @Desc：生成word文件
* @paramdataMap word中需要展示的动态数据，用map集合来保存
* @paramtemplateName word模板名称，例如：test.ftl
* @paramfilePath文件生成的目标路径，例如：D:/wordFile/
* @paramfileName生成的文件名称，例如：test.doc
* */
public static void createWord(Map<String, Object>dataMap,String templateName,String filePath,String fileName){
try {
//创建配置实例
Configuration configuration = new Configuration();
//设置编码
configuration.setDefaultEncoding("UTF-8");
//ftl模板文件
File file = new File(filePath);
configuration.setDirectoryForTemplateLoading(file);
//获取模板
Template template = configuration.getTemplate(templateName);
//输出文件
File outFile = new File(filePath + File.separator + fileName);
//如果输出目标文件夹不存在，则创建
if (!outFile.getParentFile().exists()){
outFile.getParentFile().mkdirs();
}
//将模板和数据模型合并生成文件
Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8"));
//生成文件
template.process(dataMap, out);
//关闭流
out.flush();
out.close();
} catch (Exception e) {
log.error("生成 word文档(WordUtil)出错：【msg："+e.getMessage()+"】 ,文件名：" + fileName);
e.printStackTrace();
}
}
/** 文件下载
* @param path 文件路径全路径，包含文件名
* @param response
* @return
* */
public static HttpServletResponse downFile(String path, HttpServletResponse response) {
try {
// path是指欲下载的文件的路径。
File file = new File(path);

// 取得文件名。
String filename = file.getName();
// 以流的形式下载文件。
InputStream fis = new BufferedInputStream(new FileInputStream(file));
byte[] buffer = new byte[fis.available()];
fis.read(buffer);
fis.close();
// 清空response
response.reset();
// 设置response的Header


response.setContentType("application/x-download");//下面三行是关键代码，处理乱码问题

response.setCharacterEncoding("utf-8"); 

//设置浏览器响应头对应的Content-disposition

response.setHeader("Content-disposition", "attachment;filename="+new String(filename.getBytes("GBK"), "iso8859-1"));
response.setHeader("Content-Length", "" + file.length());
OutputStream outs = new BufferedOutputStream(response.getOutputStream());
response.setContentType("application/octet-stream");
outs.write(buffer);
outs.flush();
outs.close();
file.delete();
}catch (IOException e) {
log.error("下载文档(WordUtil)出错：【msg："+e.getMessage()+"】 "); e.printStackTrace(); }
return response;
}
}