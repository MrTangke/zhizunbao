package www.zhizunbao.utils;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
/**
 * 
 * @项目名称：maven_travel  log4j工具类  参数：类对象 ， 个人名称 ， 消息信息
 *
 * @author ： YXM
 *
 * @date : 2018年4月20日 下午3:20:41
 */
public class LogUtil {
	
	/**
	 * 
	 * @param <T>
	 * @方法作者 ：YXM log4j工具类
	 * @修改人：
	 * @修改时间：
	 * @业务内容 ： 对串进来的参数进行log4j数据库持久化 ，业务功能需要调取打印每次操作信息保存
	 * @parameter：传入参数：Test.class(类对象) , 个人名称(作者) ，消息信息 
	 * @return：void
	 * @date : 2018年4月20日 下午3:11:45
	 */
	public static void mdc( String name){
		MDC.put("name", name);
	}
	
	public static Logger getLogger(Object obj){
		return Logger.getLogger(obj.getClass());
	}

}
