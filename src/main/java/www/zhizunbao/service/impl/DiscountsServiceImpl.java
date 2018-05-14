package www.zhizunbao.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.activity.Discounts;
import www.zhizunbao.dto.manage.Manage;
import www.zhizunbao.mapper.activity.DiscountsMapper;
import www.zhizunbao.service.DiscountsService;
import www.zhizunbao.utils.LogUtil;
@Service
public class DiscountsServiceImpl implements DiscountsService{

	@Autowired
	DiscountsMapper discountsMapper;

	@Override
	public List<Discounts> findDiscountsList() {
		// TODO Auto-generated method stub
		return discountsMapper.findDiscountsList();
	}

	@Override
	public int addDiscounts(HttpServletRequest request,Discounts discounts) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(DiscountsServiceImpl.class);
		try {
			logger.info("添加折扣成功");
			return discountsMapper.insertSelective(discounts);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("添加折扣失败");
			return 0;
		}
		
	}

	@Override
	public Integer deleteByPrimaryKey(HttpServletRequest request,Integer disId) {
		// TODO Auto-generated method stub
		Manage man = (Manage) request.getSession().getAttribute("man");
		LogUtil.mdc(man.getRealName()); 
		Logger logger = LogUtil.getLogger(DiscountsServiceImpl.class);
		try {
			logger.info("删除成功");
			return discountsMapper.deleteByPrimaryKey(disId);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("删除失败");
			return 0;
		}
		
	}

	@Override
	public Discounts findDiscountsOne(Integer disId) {
		// TODO Auto-generated method stub
		return discountsMapper.selectByPrimaryKey(disId);
	}

	@Override
	public int updDiscounts(Discounts discounts) {
		// TODO Auto-generated method stub
		return discountsMapper.updateByPrimaryKeySelective(discounts);
	}
}
