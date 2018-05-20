package com.bootdo.advertiser.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bootdo.advertiser.domain.AdvertiserRole;

/**
 * 角色
 */
@Mapper
public interface AdvertiserRoleDao {

	AdvertiserRole get(Long roleId);
	
	List<AdvertiserRole> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(AdvertiserRole role);
	
	int update(AdvertiserRole role);
	
	int remove(Long roleId);
	
	int batchRemove(Long[] roleIds);
//检查这里，新增的方法
	List<Long> listRoleId(Long id);

	void removeByUserId(Long userId);

	void batchSave(List<AdvertiserRole> list);

	void batchRemoveByUserId(Long[] userIds);
}
