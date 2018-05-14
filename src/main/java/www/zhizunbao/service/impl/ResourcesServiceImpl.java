package www.zhizunbao.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.manage.Resources;
import www.zhizunbao.mapper.manage.ResourcesMapper;
import www.zhizunbao.service.ResourcesService;

@Service
public class ResourcesServiceImpl implements ResourcesService {

	@Autowired
	private ResourcesMapper resourcesMapper;

	@Override
	public List<Resources> findResourcesList() {
		// TODO Auto-generated method stub
		return resourcesMapper.findResourcesList();
	}

	@Override
	public Resources findResourcesById(Integer res_id) {
		// TODO Auto-generated method stub
		return resourcesMapper.selectByPrimaryKey(res_id);
	}

	@Override
	public void updateResourcesById(Resources resources) {
		// TODO Auto-generated method stub
		resourcesMapper.updateByPrimaryKey(resources);
	}

	@Override
	public void deleteResourcesById(Integer res_id) {
		// TODO Auto-generated method stub
		resourcesMapper.deleteByPrimaryKey(res_id);
	}

	@Override
	public void insertResourcesById(Resources resources) {
		// TODO Auto-generated method stub
		resourcesMapper.insert(resources);
	}
	
	@Override
	public List<Resources> findResourcesListOne() {
		// TODO Auto-generated method stub
		return resourcesMapper.findResourcesListOne();
	}
	
	/**
	 * 
	 * Mr吴  2018年4月25日 下午5:52:39
	 * 功能 ： 根据manageId查询权限
	 * @param manageId
	 * @return
	 */
	@Override
	public List<Resources> findResourcesListByManageId(Integer manageId) {
		// TODO Auto-generated method stub
		return resourcesMapper.findResourcesListByManageId(manageId);
	}
	
	/**
	 * 
	 * Mr吴  2018年4月25日 下午5:59:40
	 * 功能 ：根据pid查询相应子权限
	 * @param pId
	 * @return
	 */
	@Override
	public List<Resources> findResourcesListByPid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return resourcesMapper.findResourcesListByPid(map);
	}
}
