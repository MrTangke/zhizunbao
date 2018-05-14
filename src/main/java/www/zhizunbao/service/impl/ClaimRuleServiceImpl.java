package www.zhizunbao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.zhizunbao.dto.claim.ClaimRule;
import www.zhizunbao.mapper.claim.ClaimRuleMapper;
import www.zhizunbao.service.ClaimRuleService;
@Service
public class ClaimRuleServiceImpl implements ClaimRuleService{
    @Autowired
    ClaimRuleMapper claimRuleMapper;
	@Override
	public List<ClaimRule> findRulesOfClaim() {
		// TODO Auto-generated method stub
		return claimRuleMapper.selectByPrimaryKey();
	}

}
