package com.bootdo.advertiser.dao;

import com.bootdo.advertiser.domain.AdvertiserDept;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 部门管理
 */
@Mapper
public interface AdvertiserDeptDao {

	AdvertiserDept get(Long deptId);
	
	List<AdvertiserDept> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(AdvertiserDept dept);
	
	int update(AdvertiserDept dept);
	
	int remove(Long deptId);
	
	int batchRemove(Long[] deptIds);
	
	Long[] listParentDept();
	
	int getDeptUserNumber(Long deptId);
}
