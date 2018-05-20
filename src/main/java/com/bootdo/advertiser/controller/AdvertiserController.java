package com.bootdo.advertiser.controller;

import com.bootdo.advertiser.domain.Advertiser;
import com.bootdo.advertiser.domain.AdvertiserDept;
import com.bootdo.advertiser.domain.AdvertiserRole;
import com.bootdo.advertiser.service.AdvertiserDictService;
import com.bootdo.advertiser.service.AdvertiserRoleService;
import com.bootdo.advertiser.service.AdvertiserService;
import com.bootdo.advertiser.vo.AdvertiserVO;
import com.bootdo.common.annotation.Log;
import com.bootdo.common.config.Constant;
import com.bootdo.common.controller.AdvertiserBaseController;
import com.bootdo.common.controller.BaseController;
import com.bootdo.common.domain.FileDO;
import com.bootdo.common.domain.Tree;
import com.bootdo.common.service.DictService;
import com.bootdo.common.utils.*;
import com.bootdo.system.service.RoleService;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/adver/user")
@Controller
public class AdvertiserController extends AdvertiserBaseController {
	private String prefix="advertiser/user"  ;
	@Autowired
	AdvertiserService advertiserService;
	@Autowired
	AdvertiserRoleService advertiserRoleService;
	@Autowired
	AdvertiserDictService advertiserDictService;
	@RequiresPermissions("adver:user:user")
	@GetMapping("")
	String user(Model model) {
		return prefix + "/user";
	}

	@GetMapping("/list")
	@ResponseBody
	PageUtils list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);
		List<Advertiser> sysUserList = advertiserService.list(query);
		int total = advertiserService.count(query);
		PageUtils pageUtil = new PageUtils(sysUserList, total);
		return pageUtil;
	}

	@RequiresPermissions("sys:user:add")
	@Log("添加用户")
	@GetMapping("/add")
	String add(Model model) {
		List<AdvertiserRole> roles = advertiserRoleService.list();
		model.addAttribute("roles", roles);
		return prefix + "/add";
	}

	@RequiresPermissions("adver:user:edit")
	@Log("编辑用户")
	@GetMapping("/edit/{id}")
	String edit(Model model, @PathVariable("id") Long id) {
		Advertiser advertiser = advertiserService.get(id);
		model.addAttribute("user", advertiser);
		List<AdvertiserRole> roles = advertiserRoleService.list(id);
		model.addAttribute("roles", roles);
		return prefix+"/edit";
	}

	@RequiresPermissions("adver:user:add")
	@Log("保存用户")
	@PostMapping("/save")
	@ResponseBody
	R save(Advertiser user) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		user.setPassword(MD5Utils.encrypt(user.getUsername(), user.getPassword()));
		if (advertiserService.save(user) > 0) {
			return R.ok();
		}
		return R.error();
	}

	@RequiresPermissions("adver:user:edit")
	@Log("更新用户")
	@PostMapping("/update")
	@ResponseBody
	R update(Advertiser user) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (advertiserService.update(user) > 0) {
			return R.ok();
		}
		return R.error();
	}


	@RequiresPermissions("adver:user:edit")
	@Log("更新用户")
	@PostMapping("/updatePeronal")
	@ResponseBody
	R updatePeronal(Advertiser user) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (advertiserService.updatePersonal(user) > 0) {
			return R.ok();
		}
		return R.error();
	}


	@RequiresPermissions("adver:user:remove")
	@Log("删除用户")
	@PostMapping("/remove")
	@ResponseBody
	R remove(Long id) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		if (advertiserService.remove(id) > 0) {
			return R.ok();
		}
		return R.error();
	}

	@RequiresPermissions("adver:user:batchRemove")
	@Log("批量删除用户")
	@PostMapping("/batchRemove")
	@ResponseBody
	R batchRemove(@RequestParam("ids[]") Long[] userIds) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		int r = advertiserService.batchremove(userIds);
		if (r > 0) {
			return R.ok();
		}
		return R.error();
	}

	@PostMapping("/exit")
	@ResponseBody
	boolean exit(@RequestParam Map<String, Object> params) {
		// 存在，不通过，false
		return !advertiserService.exit(params);
	}

	@RequiresPermissions("adver:user:resetPwd")
	@Log("请求更改用户密码")
	@GetMapping("/resetPwd/{id}")
	String resetPwd(@PathVariable("id") Long userId, Model model) {

		Advertiser advertiser = new Advertiser();
		advertiser.setUserId(userId);
		model.addAttribute("user", advertiser);
		return prefix + "/reset_pwd";
	}

	@Log("提交更改用户密码")
	@PostMapping("/resetPwd")
	@ResponseBody
	R resetPwd(AdvertiserVO advertiserVO) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		try{
			advertiserService.resetPwd(advertiserVO,getUser());
			return R.ok();
		}catch (Exception e){
			return R.error(1,e.getMessage());
		}

	}
	@RequiresPermissions("adver:user:resetPwd")
	@Log("admin提交更改用户密码")
	@PostMapping("/adminResetPwd")
	@ResponseBody
	R adminResetPwd(AdvertiserVO advertiserVO) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		try{
			advertiserService.adminResetPwd(advertiserVO);
			return R.ok();
		}catch (Exception e){
			return R.error(1,e.getMessage());
		}

	}
	@GetMapping("/tree")
	@ResponseBody
	public Tree<AdvertiserDept> tree() {
		Tree<AdvertiserDept> tree = new Tree<AdvertiserDept>();
		tree = advertiserService.getTree();
		return tree;
	}

	@GetMapping("/treeView")
	String treeView() {
		return  prefix + "/userTree";
	}
	
	@ResponseBody
	@PostMapping("/uploadImg")
	R uploadImg(@RequestParam("avatar_file") MultipartFile file, String avatar_data, HttpServletRequest request) {
		if ("test".equals(getUsername())) {
			return R.error(1, "演示系统不允许修改,完整体验请部署程序");
		}
		Map<String, Object> result = new HashMap<>();
		try {
			result = advertiserService.updatePersonalImg(file, avatar_data, getUserId());
		} catch (Exception e) {
			return R.error("更新图像失败！");
		}
		if(result!=null && result.size()>0){
			return R.ok(result);
		}else {
			return R.error("更新图像失败！");
		}
	}
}
