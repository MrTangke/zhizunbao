package www.zhizunbao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import www.zhizunbao.mapper.insure.TypeMapper;
import www.zhizunbao.service.TestService;
@Service
public class TestServiceImpl implements TestService{

	@Autowired
	private TypeMapper testMapper;
	@Autowired
	private RedisTemplate<String, Object> template;
	@Override
	public void getTestList() {
		System.out.println(testMapper);
		/*RedisSerializer<String> stringSerializer = new StringRedisSerializer();
		template.setKeySerializer(stringSerializer);
		template.setValueSerializer(stringSerializer);
        template.setHashKeySerializer(stringSerializer);
        template.setHashValueSerializer(stringSerializer);*/
        System.out.println(template.opsForValue().get("name"));
	}
	
	
}
