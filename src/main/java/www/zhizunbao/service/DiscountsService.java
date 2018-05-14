package www.zhizunbao.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import www.zhizunbao.dto.activity.Discounts;

public interface DiscountsService {

	List<Discounts> findDiscountsList();

	int addDiscounts(HttpServletRequest request,Discounts discounts);

	Integer deleteByPrimaryKey(HttpServletRequest request,Integer disId);

	Discounts findDiscountsOne(Integer disId);

	int updDiscounts(Discounts discounts);

}
