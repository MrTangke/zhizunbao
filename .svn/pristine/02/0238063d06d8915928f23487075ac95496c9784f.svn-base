package www.zhizunbao.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hpsf.SummaryInformation;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFComment;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import www.zhizunbao.dto.insure.SafeGuard;

public class ExcelUtil{
	
    public static String NO_DEFINE = "no_define";//未定义的字段
    public static String DEFAULT_DATE_PATTERN="yyyy年MM月dd日";//默认日期格式
    public static int DEFAULT_COLOUMN_WIDTH = 17;
    
    /**
     * 导出Excel 97(.xls)格式 ，少量数据
     * @param title 标题行 
     * @param headMap 属性-列名
     * @param jsonArray 数据集
     * @param datePattern 日期格式，null则用默认日期格式
     * @param colWidth 列宽 默认 至少17个字节
     * @param out 输出流
     */
    public static void exportExcel(String title,Map<String, String> headMap,JSONArray jsonArray,String datePattern,int colWidth, OutputStream out) {
        if(datePattern==null) {
        	datePattern = DEFAULT_DATE_PATTERN;
        };
        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        workbook.createInformationProperties();
        workbook.getDocumentSummaryInformation().setCompany("*****公司");
        SummaryInformation si = workbook.getSummaryInformation();
        si.setAuthor("JACK");  //填加xls文件作者信息
        si.setApplicationName("导出程序"); //填加xls文件创建程序信息
        si.setLastAuthor("最后保存者信息"); //填加xls文件最后保存者信息
        si.setComments("JACK is a programmer!"); //填加xls文件作者信息
        si.setTitle("POI导出Excel"); //填加xls文件标题信息
        si.setSubject("POI导出Excel");//填加文件主题信息
        si.setCreateDateTime(new Date());
         //表头样式
        HSSFCellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont titleFont = workbook.createFont();
        titleFont.setFontHeightInPoints((short) 20);
        titleFont.setBoldweight((short) 700);
        titleStyle.setFont(titleFont);
        // 列头样式
        HSSFCellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont headerFont = workbook.createFont();
        headerFont.setFontHeightInPoints((short) 12);
        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerStyle.setFont(headerFont);
        // 单元格样式
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        HSSFFont cellFont = workbook.createFont();
        cellFont.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        cellStyle.setFont(cellFont);
        // 生成一个(带标题)表格
        HSSFSheet sheet = workbook.createSheet();
        // 声明一个画图的顶级管理器
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置,详见文档
        HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0,
                0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释内容
        comment.setString(new HSSFRichTextString("可以在POI中添加注释！"));
        // 设置注释作者，当鼠标移动到单元格上是可以在状态栏中看到该内容.
        comment.setAuthor("JACK");
        //设置列宽
        int minBytes = colWidth<DEFAULT_COLOUMN_WIDTH?DEFAULT_COLOUMN_WIDTH:colWidth;//至少字节数
        int[] arrColWidth = new int[headMap.size()];
        // 产生表格标题行,以及设置列宽
        String[] properties = new String[headMap.size()];
        String[] headers = new String[headMap.size()];
        int ii = 0;
        for (Iterator<String> iter = headMap.keySet().iterator(); iter.hasNext();) {
            String fieldName = iter.next();

            properties[ii] = fieldName;
            headers[ii] = fieldName;

            int bytes = fieldName.getBytes().length;
            arrColWidth[ii] =  bytes < minBytes ? minBytes : bytes;
            sheet.setColumnWidth(ii,arrColWidth[ii]*256);
            ii++;
        }
        // 遍历集合数据，产生数据行
        int rowIndex = 0;
        for (Object obj : jsonArray) {
            if(rowIndex == 65535 || rowIndex == 0){
                if ( rowIndex != 0 ) sheet = workbook.createSheet();//如果数据超过了，则在第二页显示

                HSSFRow titleRow = sheet.createRow(0);//表头 rowIndex=0
                titleRow.createCell(0).setCellValue(title);
                titleRow.getCell(0).setCellStyle(titleStyle);
                sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, headMap.size() - 1));

                HSSFRow headerRow = sheet.createRow(1); //列头 rowIndex =1
                for(int i=0;i<headers.length;i++)
                {
                    headerRow.createCell(i).setCellValue(headers[i]);
                    headerRow.getCell(i).setCellStyle(headerStyle);

                }
                rowIndex = 2;//数据内容从 rowIndex=2开始
            }
            JSONObject jo = (JSONObject) JSONObject.toJSON(obj);
            HSSFRow dataRow = sheet.createRow(rowIndex);
            for (int i = 0; i < properties.length; i++)
            {
                HSSFCell newCell = dataRow.createCell(i);

                Object o =  jo.get(properties[i]);
                String cellValue = ""; 
                if(o==null) cellValue = "";
                else if(o instanceof Date) cellValue = new SimpleDateFormat(datePattern).format(o);
                else cellValue = o.toString();

                newCell.setCellValue(cellValue);
                newCell.setCellStyle(cellStyle);
            }
            rowIndex++;
        }
        // 自动调整宽度
        for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i);
        }
        try {
            workbook.write(out);
            //workbook.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 导出Excel 2007 OOXML (.xlsx)格式
     * @param title 标题行
     * @param headMap 属性-列头
     * @param jsonArray 数据集
     * @param datePattern 日期格式，传null值则默认 年月日
     * @param colWidth 列宽 默认 至少17个字节
     * @param out 输出流
     */
    public static void exportExcelX(String title,Map<String, String> headMap,JSONArray jsonArray,String datePattern,int colWidth, OutputStream out) {
        if(datePattern==null) datePattern = DEFAULT_DATE_PATTERN;
        // 声明一个工作薄
        SXSSFWorkbook workbook = new SXSSFWorkbook(1000);//缓存
        workbook.setCompressTempFiles(true);
         //表头样式
        CellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        Font titleFont = workbook.createFont();
        titleFont.setFontHeightInPoints((short) 20);
        titleFont.setBoldweight((short) 700);
        titleStyle.setFont(titleFont);
        // 列头样式
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        headerStyle.setFillForegroundColor(HSSFColor.WHITE.index);     //背景色
        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        Font headerFont = workbook.createFont();
        headerFont.setFontHeightInPoints((short) 12);
        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerStyle.setFont(headerFont);
        // 单元格样式
        CellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setFillForegroundColor(HSSFColor.WHITE.index);     //背景色
        cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        Font cellFont = workbook.createFont();
        cellFont.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        cellStyle.setFont(cellFont);
        // 生成一个(带标题)表格
        SXSSFSheet sheet = (SXSSFSheet) workbook.createSheet();
        //设置列宽
        int minBytes = colWidth<DEFAULT_COLOUMN_WIDTH?DEFAULT_COLOUMN_WIDTH:colWidth;//至少字节数
        int[] arrColWidth = new int[headMap.size()];
        // 产生表格标题行,以及设置列宽
        String[] properties = new String[headMap.size()];
        String[] headers = new String[headMap.size()];
        int ii = 0;
        for (Iterator<String> iter = headMap.keySet().iterator(); iter.hasNext();) {
            String fieldName = iter.next();

            properties[ii] = fieldName;
            headers[ii] = headMap.get(fieldName);

            int bytes = fieldName.getBytes().length;
            arrColWidth[ii] =  bytes < minBytes ? minBytes : bytes;
            sheet.setColumnWidth(ii,arrColWidth[ii]*256);
            ii++;
        }
        // 遍历集合数据，产生数据行
        int rowIndex = 0;
        for (Object obj : jsonArray) {
            //if(rowIndex == 65535 || rowIndex == 0){
            if(rowIndex == 0){
                if ( rowIndex != 0 ) sheet = (SXSSFSheet) workbook.createSheet();//如果数据超过了，则在第二页显示

                //第一行合并后设置标题功能
               /* SXSSFRow titleRow = (SXSSFRow) sheet.createRow(0);//表头 rowIndex=0
                titleRow.createCell(0).setCellValue(title);
                titleRow.getCell(0).setCellStyle(titleStyle);
                sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, headMap.size() - 1));*/

                SXSSFRow headerRow = (SXSSFRow) sheet.createRow(0); //列头 rowIndex =0
                for(int i=0;i<headers.length;i++){
                    headerRow.createCell(i).setCellValue(headers[i]);
                    headerRow.getCell(i).setCellStyle(headerStyle);
                }
                rowIndex = 1;  //数据内容从 rowIndex=1开始
            }
            JSONObject jo = (JSONObject) JSONObject.toJSON(obj);
            SXSSFRow dataRow = (SXSSFRow) sheet.createRow(rowIndex);
            for (int i = 0; i < properties.length; i++){
                SXSSFCell newCell = (SXSSFCell) dataRow.createCell(i);

                Object o =  jo.get(properties[i]);
                String cellValue = ""; 
                if(o==null) cellValue = "";
                else if(o instanceof Date) cellValue = new SimpleDateFormat(datePattern).format(o);
                else cellValue = o.toString();

                newCell.setCellValue(cellValue);
                newCell.setCellStyle(cellStyle);
            }
            rowIndex++;
        }
        // 自动调整宽度
       /* for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i);
        }*/
        try {
            workbook.write(out);
            
            /*workbook.close();
            workbook.dispose();*/
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 
    * @Title: ExcelUtil.java 
    * @Package com.yf.utils 
    * @Description: web导出excel导出入口
    * @author wgl   
    * @date 2017年7月27日 下午1:34:14
     */
    public static void downloadExcelFile(String title,Map<String,String> headMap,JSONArray ja,HttpServletResponse response){
        try {
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            ExcelUtil.exportExcelX(title,headMap,ja,null,0,os);
            byte[] content = os.toByteArray();
            InputStream is = new ByteArrayInputStream(content);
            // 设置response参数，可以打开下载页面
            response.reset();
            response.setContentLength(content.length);
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"); 
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((title + ".xlsx").getBytes(), "iso-8859-1"));
            ServletOutputStream outputStream = response.getOutputStream();
            BufferedInputStream bis = new BufferedInputStream(is);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);

            }
            bis.close();
            bos.close();
            outputStream.flush();
            outputStream.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    
//    public static void main(String[] args) throws IOException {
//        int count = 100000;
//        JSONArray ja = new JSONArray();
//        for(int i=0;i<100000;i++){
//        	/*TaskData td = new TaskData();
//        	td.setTaskId("R20161208"+i);
//        	td.setBankChargeNum("bankChargeNum"+i);
//        	td.setCity("city"+i);
//        	td.setCertificateAddress("add"+i);
//        	td.setArea("area"+i);
//        	td.setUnitPrice("unitPrice"+i);
//        	td.setTotalPrice("totalPrice"+i);*/
//        	
//            Student s = new Student();
//            s.setName("POI"+i);
//            s.setAge(i);
//            s.setBirthday(new Date());
//            s.setHeight(i);
//            s.setWeight(i);
//            s.setSex(i/2==0?false:true);
//        	
//            //ja.add(td);
//        }
//        Map<String,String> headMap = new LinkedHashMap<String,String>();
//        /*headMap.put("bankChargeNum","银行押品编号");
//        headMap.put("city","城市");
//        headMap.put("certificateAddress","房产证地址");
//        headMap.put("area","面积");
//        headMap.put("unitPrice","单价");
//        headMap.put("totalPrice","总价");*/
//        
///*        headMap.put("taskId", "任务编号");
//        headMap.put("bankChargeNum", "银行押品编号");
//        headMap.put("province", "省（必填）");
//        headMap.put("city", "城市（必填）");
//        headMap.put("region", "行政区");
//        headMap.put("certificateAddress", "证载地址/房屋坐落（必填）");
//        headMap.put("standardAddress", "标准地址");
//        headMap.put("area", "建筑面积（必填）");
//        headMap.put("unitPrice", "本次评估单价");
//        headMap.put("totalPrice", "本次评估总价");
//        headMap.put("evaluationRemarks", "评估备注说明");
//        headMap.put("floor", "当前层");
//        headMap.put("totalFloor", "总楼层");
//        headMap.put("buildingType", "楼栋类型");
//        headMap.put("toward", "朝向");
//        headMap.put("buildingStructure", "建筑结构");
//        headMap.put("buildTime", "建成年份");
//        headMap.put("housePropertyCardNum", "房产证号");
//        headMap.put("contractNum", "合同号");
//        headMap.put("propertyType", "物业类型");
//        headMap.put("propertyOwner", "产权人");
//        headMap.put("housingRemarks", "房屋备注说明");
//        headMap.put("appraisalPrice", "押入时评估价");
//        headMap.put("lendingTime", "放贷时间");
//        headMap.put("expirationTime", "到期时间");
//        headMap.put("loanBalance", "贷款余额");
//        headMap.put("loanAmount", "贷款金额");
//        headMap.put("loanPurpose", "贷款用途");
//        headMap.put("loanTerm", "贷款期限");
//        headMap.put("loanRate", "贷款利率");
//        headMap.put("lenderName", "贷款人姓名");
//        headMap.put("lenderID", "贷款人身份证号");
//        headMap.put("lenderTel", "贷款人电话");
//        headMap.put("lenderAddress", "贷款人地址");
//        headMap.put("communityRating", "小区评级");
//        headMap.put("accuracyRate", "准确率");*/
//
//        String title = "测试";
//        /*
//        OutputStream outXls = new FileOutputStream("E://a.xls");
//        System.out.println("正在导出xls....");
//        Date d = new Date();
//        ExcelUtil.exportExcel(title,headMap,ja,null,outXls);
//        System.out.println("共"+count+"条数据,执行"+(new Date().getTime()-d.getTime())+"ms");
//        outXls.close();*/
//        //
//        OutputStream outXlsx = new FileOutputStream("E://b.xlsx");
//        System.out.println("正在导出xlsx....");
//        Date d2 = new Date();
//        ExcelUtil.exportExcelX(title,headMap,ja,null,0,outXlsx);
//        System.out.println("共"+count+"条数据,执行"+(new Date().getTime()-d2.getTime())/1000+"s");
//        outXlsx.close();
//    }

    
		    //解决excel类型问题，获得数值  
		    public static String getValue(Cell cell) {  
			        String value = "";  
			        if(null==cell){  
			            	return value;  
			        }  
				    switch (cell.getCellType()) {  
					        //数值型  
					        case Cell.CELL_TYPE_NUMERIC:  
					            if (HSSFDateUtil.isCellDateFormatted(cell)) {  
					                //如果是date类型则 ，获取该cell的date值  
					                Date date = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());  
					                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
					                value = format.format(date);;  
					            }else {// 纯数字  
					                BigDecimal big=new BigDecimal(cell.getNumericCellValue());  
					                DecimalFormat df = new DecimalFormat("#0.00");
					                if(big!=null){
					                	value = df.format(big);
					                }
					                //解决1234.0  去掉后面的.0  
					                if(null!=value&&!"".equals(value.trim())){  
					                     String[] item = value.split("[.]");  
					                     if(1<item.length&&("0".equals(item[1]) || "00".equals(item[1]))){  
					                         value=item[0];  
					                     }
					                }  
					            }  
					            break;  
					            //字符串类型   
					        case Cell.CELL_TYPE_STRING:  
					            value = cell.getStringCellValue().toString();  
					            break;  
					        // 公式类型  
					        case Cell.CELL_TYPE_FORMULA:  
					            //读公式计算值  
					            value = String.valueOf(cell.getNumericCellValue());  
					            if (value.equals("NaN")) {// 如果获取的数据值为非法值,则转换为获取字符串  
					                value = cell.getStringCellValue().toString();  
					            }  
					            break;  
					        // 布尔类型  
					        case Cell.CELL_TYPE_BOOLEAN:  
					            value = ""+ cell.getBooleanCellValue();  
					            break;  
					        // 空值  
					        case Cell.CELL_TYPE_BLANK:   
					            value = "";  
					            //LogUtil.getLogger().error("excel出现空值");  
					            break;  
					        // 故障  
					        case Cell.CELL_TYPE_ERROR:   
					            value = "";  
					            //LogUtil.getLogger().error("excel出现故障");  
					            break;  
					        default:  
					            value = cell.getStringCellValue().toString();  
				    }  
				    if("null".endsWith(value.trim())){  
				        value="";  
				    }  
				  return value;  
		    }  
		    
		    
		    
/*		    
		    
		    
		    
		    
		    
		    
		    
		    
		    
		   
		    
	*//**
	 * 	导出Excel文件
	 *//*
    public static String exportExcel_f(HttpServletRequest request,  HttpServletResponse response, List<Scene> list){
    	
    	String str = "0";
    	try {
    		//  这是上下文的绝对路径
    		 E:\AAA学习资料\A12_实训二\02_自己练习\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\maven_travel\ upload\excel
    		@SuppressWarnings("deprecation")
			String basePath=request.getRealPath("/upload/excel");

    		SimpleDateFormat dateStr=new SimpleDateFormat("_yyyy_MM_dd");
    	    SimpleDateFormat sdf=new SimpleDateFormat("\\yyyy\\");
    	    
    		Date date=new Date();
    		String subPath=sdf.format(date);
    		String dateStrPath=dateStr.format(date);
    	
    		File dir=new File(basePath+subPath);
    			if(!dir.exists()){
    			dir.mkdirs();
    		}
    			
    		String filePath = basePath + subPath ;
    		
    		
    		Workbook wb = new XSSFWorkbook();
    		//为空的工作簿创建工作表
    		Sheet sheet = wb.createSheet("景点信息表");
    		//创建合并单元格对象 ，将这个对象覆给工作表
    		CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 8);
    		sheet.addMergedRegion(cellRangeAddress);
    		
    		//获取第一行
    		Row row1 = sheet.createRow(0);
    		Cell cell_1 = row1.createCell(0);
    		cell_1.setCellValue("景点信息");
    		
    		//创建一个样式     头 给标题设置样式
    		CellStyle styleHead = wb.createCellStyle();
			styleHead.setAlignment(XSSFCellStyle.ALIGN_CENTER);
			styleHead.setVerticalAlignment(XSSFCellStyle.ALIGN_CENTER);
			Font fontHead = wb.createFont();
			fontHead.setBoldweight(Font.BOLDWEIGHT_BOLD);
			fontHead.setFontHeightInPoints((short)20);
			styleHead.setFont(fontHead);
			
			//将样式赋予单元格
			cell_1.setCellStyle(styleHead);
    		
			//创建一个样式对象  列头
			CellStyle style = wb.createCellStyle();
			style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
			style.setVerticalAlignment(XSSFCellStyle.ALIGN_CENTER);
			Font font = wb.createFont();
			font.setBoldweight(Font.BOLDWEIGHT_BOLD);
			style.setFont(font);
			
			//每一列头的名称
			String[] titles = {"景点编号","景点名称","景点地址","景点简介","景点等级","门票价格","景点联系方式","景点路线" } ;
			Row row2 = sheet.createRow(1);
			for (int i = 0; i < titles.length; i++) {
				Cell cell = row2.createCell(i);
				cell.setCellValue(titles[i]);
				cell.setCellStyle(style);
			}
			
			//循环导出用户列表数据
			for (int i = 0; i < list.size(); i++) {
				Scene scene = list.get(i);
				//从第三行开始 获得第三行
				Row row = sheet.createRow(i+2);
				row.createCell(0).setCellValue(scene.getSceneId());
				row.createCell(1).setCellValue(scene.getSceneName());
				row.createCell(2).setCellValue(scene.getSceneAddress());
				row.createCell(3).setCellValue(scene.getSceneContent());
				row.createCell(4).setCellValue(scene.getSceneLevel());
				row.createCell(5).setCellValue(scene.getScenePrice());
				row.createCell(6).setCellValue(scene.getScenePhone());
				row.createCell(7).setCellValue(scene.getSceneLine());

				str = "1";
			}
			
			// 保存Excel文件
			String uid = UUID.randomUUID().toString().substring(0, 3);
	        OutputStream outputStream = new FileOutputStream(filePath + "景点信息表_" +dateStrPath+uid+".xls");
	        wb.write(outputStream);
	        outputStream.close();

    	} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return str ;
    }	  */  

    /**
	 * 	导入Excel文件
	 */
    @SuppressWarnings("rawtypes")
	public static List importExcel(HttpServletRequest request, MultipartFile file){
    	//String str = FilesUtils.FilesUpload_xm(request, file, "/upload");
    	String str = file.getOriginalFilename();
    	
    	String fname = str.substring(str.lastIndexOf("."));
    	Workbook wb = null ;
    	
		try {
			//判断文件的格式 版本
			if (fname.equals(".xls")) {
				wb = new HSSFWorkbook(file.getInputStream());
			}else if(fname.equals(".xlsx")){
				wb = new XSSFWorkbook(file.getInputStream());
			}else {
				return null;
			}	
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Sheet sheet = wb.getSheetAt(0);
		
		List<SafeGuard> list = new ArrayList<>();
		int lastRowNum = sheet.getLastRowNum();
		for (int i=sheet.getFirstRowNum()+2; i<sheet.getLastRowNum()+1; i++) {
			Row row = sheet.getRow(i);
			boolean b = ExcelUtil.isRowEmpty(row);
			if(b){
				continue;
			}
			int rowNum = row.getRowNum();
			if (rowNum > 0) {
				// String sceneId = row.getCell(0).getStringCellValue();
				
				short lastCellNum = row.getLastCellNum();
				for(int n=0; n<row.getLastCellNum(); n++){
					row.getCell(n).setCellType(Cell.CELL_TYPE_STRING);
				}
				
				String safeguardProject = row.getCell(0).getStringCellValue();
				String safeguardMoney = row.getCell(1).getStringCellValue();
				String safeguardScope = row.getCell(2).getStringCellValue();
				SafeGuard safeGuard = new SafeGuard();
				safeGuard.setSafeguardProject(safeguardProject);
				safeGuard.setSafeguardMoney(safeguardMoney);
				safeGuard.setSafeguardScope(safeguardScope);
				list.add(safeGuard);
			}
		}
    	
    	return list;
    }
		    
	/*
	 * 判断cells是否为空	    
	 */
    public static boolean isRowEmpty(Row row) {


    	   for (int c = row.getFirstCellNum(); c < row.getLastCellNum(); c++) {


    	       Cell cell = row.getCell(c);


    	       if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK)


    	           return false;


    	   }


    	   return true;


    	}   
		    
		    
		    
		    
		    
		    
		    

}