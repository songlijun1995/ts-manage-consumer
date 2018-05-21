package com.bootdo.advertiser.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.bootdo.advertiser.domain.Advertiser;
import com.bootdo.advertiser.domain.AdvertiserDept;
import com.bootdo.advertiser.vo.AdvertiserVO;
import com.bootdo.common.domain.Tree;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface AdvertiserService {
	Advertiser get(Long id);

	List<Advertiser> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(Advertiser user);

	int update(Advertiser user);

	int remove(Long userId);

	int batchremove(Long[] userIds);

	boolean exit(Map<String, Object> params);

	Set<String> listRoles(Long userId);

	int resetPwd(AdvertiserVO advertiserVO,Advertiser advertiser) throws Exception;
	int adminResetPwd(AdvertiserVO advertiserVO) throws Exception;
	Tree<AdvertiserDept> getTree();

	/**
	 * 更新个人信息
	 * @param advertiser
	 * @return
	 */
	int updatePersonal(Advertiser advertiser);

	/** 
	 * 更新个人图片
	 * @param file 图片
	 * @param avatar_data 裁剪信息
	 * @param userId 用户ID
	 * @throws Exception
	 */
    Map<String, Object> updatePersonalImg(MultipartFile file, String avatar_data, Long userId) throws Exception;
}
