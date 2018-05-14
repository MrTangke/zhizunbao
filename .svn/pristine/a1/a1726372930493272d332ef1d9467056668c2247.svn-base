package www.zhizunbao.utils;

import java.security.MessageDigest;

/**  
* @ClassName: MD5Util  
* @Description: 只能加密，不能解密 
* @author renhaoyu  
* @date 2017年9月11日 下午7:32:47  
*    
*/
public class MD5Util {

	public final static String MD5(String s) {
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
		try {
			byte[] strTemp = s.getBytes();
			// 使用MD5创建MessageDigest对象
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(strTemp);
			byte[] md = mdTemp.digest();
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte b = md[i];
				// 将没个数(int)b进行双字节加密
				str[k++] = hexDigits[b >> 4 & 0xf];
				str[k++] = hexDigits[b & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			return null;
		}
	}

	// MD5只能加密，不能解密，
	// 网上有很多在线加密解密MD5
	// 网上是有一个MD5加密以后的强大库
	public static void main(String[] args) {
		/*
		 * 97304531204ef7431330c20427d95481
		   670b14728ad9902aecba32e22fa4f6bd
		   e10adc3949ba59abbe56e057f20f883e
		 */
		System.err.println(MD5Util.MD5("xiaoming"));
		System.out.println(MD5Util.MD5("000000"));
		System.out.println(MD5Util.MD5("123456"));
	}
}
