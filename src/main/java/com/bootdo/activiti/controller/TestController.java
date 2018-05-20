package com.bootdo.activiti.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.config.annotation.Reference;

import cn.xuhao.dubbo.api.DemoService;

@RestController
@RequestMapping(value = "/test")
public class TestController {
	@Reference(check=false)//启动消费者不检查服务者是否存在
	private DemoService demoService;
	
	@RequestMapping("/sayhello")
	public String sayhello(HttpServletRequest request, HttpServletResponse response) {
		return demoService.sayHello("老婆，等我下班。。。");
	}
}
