package com.bootdo.advertiser.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bootdo.advertiser.domain.AdvertiserRole;

@Service
public interface AdvertiserRoleService {

	AdvertiserRole get(Long id);

	List<AdvertiserRole> list();

	int save(AdvertiserRole role);

	int update(AdvertiserRole role);

	int remove(Long id);

	List<AdvertiserRole> list(Long userId);

	int batchremove(Long[] ids);
}
