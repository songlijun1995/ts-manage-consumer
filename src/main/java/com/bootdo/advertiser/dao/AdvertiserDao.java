package com.bootdo.advertiser.dao;

import com.bootdo.advertiser.domain.Advertiser;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-10-03 09:45:11
 */
@Mapper
public interface AdvertiserDao {

	Advertiser get(Long userId);
	
	List<Advertiser> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(Advertiser user);
	
	int update(Advertiser user);
	
	int remove(Long userId);
	
	int batchRemove(Long[] userIds);
	
	Long[] listAllDept();

}
