package www.zhizunbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.manage.Log;
import www.zhizunbao.mapper.manage.LogMapper;
import www.zhizunbao.service.LogManagementService;

@Service
public class LogManagementServiceImpl implements LogManagementService {

	@Autowired
	private LogMapper logMapper;

	@Override
	public List<Log> findLogAll() {
		// TODO Auto-generated method stub
		return logMapper.findLogAll();
	}
}
