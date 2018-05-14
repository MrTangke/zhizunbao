package www.zhizunbao.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import www.zhizunbao.dto.manage.CarouselImg;
import www.zhizunbao.dto.manage.FrontImg;
import www.zhizunbao.dto.manage.ImgType;

public interface CarouselImgService {

	List<CarouselImg> findCarouseImgList();

	CarouselImg findCarouseImgById(Integer id);

	void updateImgOrder(HttpServletRequest request,CarouselImg carouselImg);

	void setImgTocarouselImg(Integer img_id);

	List<FrontImg> findFroetImg();

	int getCount();

	int deleteByPrimaryKey(HttpServletRequest request,Integer imgId);

	FrontImg selectByPrimaryKey(Integer imgId);

	int updateByPrimaryKeySelective(FrontImg frontImg);

	List<ImgType> findImgType();

	int insertSelective(FrontImg frontImg);

	
}
