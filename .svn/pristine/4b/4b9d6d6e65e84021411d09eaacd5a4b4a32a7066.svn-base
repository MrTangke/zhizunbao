package www.zhizunbao.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {

	/**
	 * 计算时间与现在是否超过规定分钟
	 * @param datetime
	 * @return
	 */
	public static boolean compareDateTime(String datetimeBefore, int interval){
		
		boolean b = false;
		
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//如2016-08-10 20:40  
		
		try {
			//计算时间差
			long timeBefore = simpleFormat.parse(datetimeBefore).getTime();
			
			long timeNow = new Date().getTime();
			
			//    这是间隔时间 毫秒数  		 这是30分钟毫秒数
			b = (long)(timeNow-timeBefore) > (long)(interval*60*1000);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
}
