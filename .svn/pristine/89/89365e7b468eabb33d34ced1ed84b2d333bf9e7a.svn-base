package www.zhizunbao.utils;

public class PaymentUtil {
	 /** 
     * 对支付请求的数据，加密生成md5-hmac 
     * @see 以下参数都是易宝支付规范要求发送的，并且它们的顺序是固定的 
     * @see 并且以下所有参数的值，都不能为null，只能为空字符串，即"" 
     * @param p0_Cmd          业务类型 
     * @param p1_MerId        商户编号 
     * @param p2_Order        商户订单号 
     * @param p3_Amt          支付金额 
     * @param p4_Cur          交易币种 
     * @param p5_Pid          商品ID 
     * @param p6_Pcat         商品种类 
     * @param p7_Pdesc        商品描述 
     * @param p8_Url          商户接收支付成功数据的地址 
     * @param p9_SAF          送货地址 
     * @param pa_MP           商户扩展信息 
     * @param pd_FrpId        银行编码 
     * @param pr_NeedResponse 应答机制 
     * @param keyValue        商户密钥 
     */  
    public static String buildHmac(String p0_Cmd, String p1_MerId,  
            String p2_Order, String p3_Amt, String p4_Cur, String p5_Pid,  
            String p6_Pcat, String p7_Pdesc, String p8_Url, String p9_SAF,  
            String pa_MP, String pd_FrpId, String pr_NeedResponse,  
            String keyValue) {  
        StringBuffer sb = new StringBuffer();  
        sb.append(p0_Cmd);          //业务类型。目前我们使用的是在线支付的业务类型，它的命令是Buy  
        sb.append(p1_MerId);        //商户编号。使用易宝支付前，须成为其用户，然后会分配商户编号和密钥给我们  
        sb.append(p2_Order);        //商户订单号。在我们的系统中，用于跟踪订单的号码  
        sb.append(p3_Amt);          //支付金额  
        sb.append(p4_Cur);          //交易币种  
        sb.append(p5_Pid);          //商品ID。可选，该信息可以不提供给易宝  
        sb.append(p6_Pcat);         //商品种类。可选，该信息可以不提供给易宝  
        sb.append(p7_Pdesc);        //商品描述。可选，该信息可以不提供给易宝  
        sb.append(p8_Url);          //商户接收支付成功数据的地址。也就是交易结果通知地址  
        sb.append(p9_SAF);          //送货地址。可以不提供给易宝，但要设其值为空字符串。注意不是null  
        sb.append(pa_MP);           //商户扩展信息。它会发送给支付网关，在支付处理完成后，它会原样返回。可不提供给易宝，但要设其为空字符串  
        sb.append(pd_FrpId);        //银行编码。这是易宝自己制定的，例如工商银行的编码为ICBC-NET  
        sb.append(pr_NeedResponse); //应答机制。默认为0和1两种  
        //0代表易宝请求p8_Url时得到的页面状态是200，就表示该页面已成功接收到数据  
        //假设接收程序出现了例外，并捕获了例外，那么此时的请求仍是成功的，但实际上程序并没有接受到数据，这种情况下可以使用1应答  
        //1代表易宝请求p8_Url时，页面返回的代码中，没有html代码，而只有一个success，则表示该页面已成功接收到数据  
        return DigestUtil.hmacSign(sb.toString(), keyValue);  
    }  
      
      
    /** 
     * 返回校验hmac方法 
     * @see 以下参数的顺序，都是易宝支付规范规定的 
     * @param hmac 支付网关发来的加密验证码 
     * @param p1_MerId  商户编号 
     * @param r0_Cmd    业务类型 
     * @param r1_Code   支付结果 
     * @param r2_TrxId  易宝支付交易流水号 
     * @param r3_Amt    支付金额 
     * @param r4_Cur    交易币种 
     * @param r5_Pid    商品名称 
     * @param r6_Order  商户订单号 
     * @param r7_Uid    易宝支付会员ID 
     * @param r8_MP     商户扩展信息 
     * @param r9_BType  交易结果返回类型 
     * @param keyValue  密钥 
     * @return 
     */  
    public static boolean verifyCallback(String hmac, String p1_MerId,  
            String r0_Cmd, String r1_Code, String r2_TrxId, String r3_Amt,  
            String r4_Cur, String r5_Pid, String r6_Order, String r7_Uid,  
            String r8_MP, String r9_BType, String keyValue) {  
        StringBuffer sb = new StringBuffer();  
        sb.append(p1_MerId); //商户编号。可以为""，但不能为null  
        sb.append(r0_Cmd);   //业务类型  
        sb.append(r1_Code);  //支付结果  
        sb.append(r2_TrxId); //易宝支付交易流水号。其属于易宝支付的订单系统  
        sb.append(r3_Amt);   //支付金额  
        sb.append(r4_Cur);   //交易币种  
        sb.append(r5_Pid);   //商品名称  
        sb.append(r6_Order); //商户订单号  
        sb.append(r7_Uid);   //易宝支付会员ID  
        sb.append(r8_MP);    //商户扩展信息  
        sb.append(r9_BType); //交易结果返回类型  
        return hmac.equals(DigestUtil.hmacSign(sb.toString(), keyValue));  
    }  
}
