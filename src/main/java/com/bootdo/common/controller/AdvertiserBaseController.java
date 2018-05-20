package com.bootdo.common.controller;

import org.springframework.stereotype.Controller;

import com.bootdo.advertiser.domain.Advertiser;
import com.bootdo.common.utils.AdvertiserShiroUtils;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.system.domain.UserDO;

@Controller
public class AdvertiserBaseController {
	public Advertiser getUser() {
		return AdvertiserShiroUtils.getUser();
	}

	public Long getUserId() {
		return getUser().getUserId();
	}

	public String getUsername() {
		return getUser().getUsername();
	}
}