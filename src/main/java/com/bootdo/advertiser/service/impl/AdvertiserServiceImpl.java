package com.bootdo.advertiser.service.impl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.*;

import com.bootdo.advertiser.dao.AdvertiserDao;
import com.bootdo.advertiser.dao.AdvertiserDeptDao;
import com.bootdo.advertiser.dao.AdvertiserRoleDao;
import com.bootdo.advertiser.domain.Advertiser;
import com.bootdo.advertiser.domain.AdvertiserDept;
import com.bootdo.advertiser.domain.AdvertiserRole;
import com.bootdo.advertiser.service.AdvertiserService;
import com.bootdo.advertiser.vo.AdvertiserVO;
import com.bootdo.common.config.BootdoConfig;
import com.bootdo.common.domain.FileDO;
import com.bootdo.common.service.FileService;
import com.bootdo.common.utils.*;
import org.apache.commons.lang.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bootdo.common.domain.Tree;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;

//@CacheConfig(cacheNames = "user")
@Transactional
@Service
public class AdvertiserServiceImpl implements AdvertiserService {
    @Autowired
    AdvertiserDao advertiserMapper;
    @Autowired
    AdvertiserRoleDao advertiserRoleMapper;
    @Autowired
    AdvertiserDeptDao advertiserdeptMapper;
    @Autowired
    private FileService advertiserFileService;
    @Autowired
    private BootdoConfig bootdoConfig;
    private static final Logger logger = LoggerFactory.getLogger(AdvertiserService.class);

    @Override
//    @Cacheable(key = "#id")
    public Advertiser get(Long id) {
        List<Long> roleIds = advertiserRoleMapper.listRoleId(id);
        Advertiser user = advertiserMapper.get(id);
        user.setDeptName(advertiserdeptMapper.get(user.getDeptId()).getName());
        user.setRoleIds(roleIds);
        return user;
    }

    @Override
    public List<Advertiser> list(Map<String, Object> map) {
        return advertiserMapper.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return advertiserMapper.count(map);
    }

    @Transactional
    @Override
    public int save(Advertiser user) {
        int count = advertiserMapper.save(user);
        Long userId = user.getUserId();
        List<Long> roles = user.getRoleIds();
        advertiserRoleMapper.removeByUserId(userId);
        List<AdvertiserRole> list = new ArrayList<>();
        for (Long roleId : roles) {
            AdvertiserRole ur = new AdvertiserRole();
            ur.setUserId(userId);
            ur.setRoleId(roleId);
            list.add(ur);
        }
        if (list.size() > 0) {
            advertiserRoleMapper.batchSave(list);
        }
        return count;
    }

    @Override
    public int update(Advertiser user) {
        int r = advertiserMapper.update(user);
        Long userId = user.getUserId();
        List<Long> roles = user.getRoleIds();
        advertiserRoleMapper.removeByUserId(userId);
        List<AdvertiserRole> list = new ArrayList<>();
        for (Long roleId : roles) {
            AdvertiserRole ur = new AdvertiserRole();
            ur.setUserId(userId);
            ur.setRoleId(roleId);
            list.add(ur);
        }
        if (list.size() > 0) {
            advertiserRoleMapper.batchSave(list);
        }
        return r;
    }

    @Override
    public int remove(Long userId) {
        advertiserRoleMapper.removeByUserId(userId);
        return advertiserMapper.remove(userId);
    }

    @Override
    public boolean exit(Map<String, Object> params) {
        boolean exit;
        exit = advertiserMapper.list(params).size() > 0;
        return exit;
    }

    @Override
    public Set<String> listRoles(Long userId) {
        return null;
    }

    @Override
    public int resetPwd(AdvertiserVO advertiserVO, Advertiser advertiser) throws Exception {
        if (Objects.equals(advertiserVO.getUserDO().getUserId(), advertiser.getUserId())) {
            if (Objects.equals(MD5Utils.encrypt(advertiser.getUsername(), advertiserVO.getPwdOld()), advertiser.getPassword())) {
                advertiser.setPassword(MD5Utils.encrypt(advertiser.getUsername(), advertiserVO.getPwdNew()));
                return advertiserMapper.update(advertiser);
            } else {
                throw new Exception("输入的旧密码有误！");
            }
        } else {
            throw new Exception("你修改的不是你登录的账号！");
        }
    }

    @Override
    public int adminResetPwd(AdvertiserVO advertiserVO) throws Exception {
        Advertiser advertiser = get(advertiserVO.getUserDO().getUserId());
        if ("admin".equals(advertiser.getUsername())) {
            throw new Exception("超级管理员的账号不允许直接重置！");
        }
        advertiser.setPassword(MD5Utils.encrypt(advertiser.getUsername(), advertiserVO.getPwdNew()));
        return advertiserMapper.update(advertiser);


    }

    @Transactional
    @Override
    public int batchremove(Long[] userIds) {
        int count = advertiserMapper.batchRemove(userIds);
        advertiserRoleMapper.batchRemoveByUserId(userIds);
        return count;
    }

    @Override
    public Tree<AdvertiserDept> getTree() {
        List<Tree<AdvertiserDept>> trees = new ArrayList<Tree<AdvertiserDept>>();
        List<AdvertiserDept> depts = advertiserdeptMapper.list(new HashMap<String, Object>(16));
        Long[] pDepts = advertiserdeptMapper.listParentDept();
        Long[] uDepts = advertiserMapper.listAllDept();
        Long[] allDepts = (Long[]) ArrayUtils.addAll(pDepts, uDepts);
        for (AdvertiserDept dept : depts) {
            if (!ArrayUtils.contains(allDepts, dept.getDeptId())) {
                continue;
            }
            Tree<AdvertiserDept> tree = new Tree<AdvertiserDept>();
            tree.setId(dept.getDeptId().toString());
            tree.setParentId(dept.getParentId().toString());
            tree.setText(dept.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "dept");
            tree.setState(state);
            trees.add(tree);
        }
        List<Advertiser> users = advertiserMapper.list(new HashMap<String, Object>(16));
        for (Advertiser user : users) {
            Tree<AdvertiserDept> tree = new Tree<AdvertiserDept>();
            tree.setId(user.getUserId().toString());
            tree.setParentId(user.getDeptId().toString());
            tree.setText(user.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            state.put("mType", "user");
            tree.setState(state);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<AdvertiserDept> t = BuildTree.build(trees);
        return t;
    }

    @Override
    public int updatePersonal(Advertiser advertiser) {
        return advertiserMapper.update(advertiser);
    }

    @Override
    public Map<String, Object> updatePersonalImg(MultipartFile file, String avatar_data, Long userId) throws Exception {
        String fileName = file.getOriginalFilename();
        fileName = FileUtil.renameToUUID(fileName);
        FileDO sysFile = new FileDO(FileType.fileType(fileName), "/files/" + fileName, new Date());
        //获取图片后缀
        String prefix = fileName.substring((fileName.lastIndexOf(".") + 1));
        String[] str = avatar_data.split(",");
        //获取截取的x坐标
        int x = (int) Math.floor(Double.parseDouble(str[0].split(":")[1]));
        //获取截取的y坐标
        int y = (int) Math.floor(Double.parseDouble(str[1].split(":")[1]));
        //获取截取的高度
        int h = (int) Math.floor(Double.parseDouble(str[2].split(":")[1]));
        //获取截取的宽度
        int w = (int) Math.floor(Double.parseDouble(str[3].split(":")[1]));
        //获取旋转的角度
        int r = Integer.parseInt(str[4].split(":")[1].replaceAll("}", ""));
        try {
            BufferedImage cutImage = ImageUtils.cutImage(file, x, y, w, h, prefix);
            BufferedImage rotateImage = ImageUtils.rotateImage(cutImage, r);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            boolean flag = ImageIO.write(rotateImage, prefix, out);
            //转换后存入数据库
            byte[] b = out.toByteArray();
            FileUtil.uploadFile(b, bootdoConfig.getUploadPath(), fileName);
        } catch (Exception e) {
            throw new Exception("图片裁剪错误！！");
        }
        Map<String, Object> result = new HashMap<>();
        if (advertiserFileService.save(sysFile) > 0) {
            Advertiser advertiser = new Advertiser();
            advertiser.setUserId(userId);
            advertiser.setPicId(sysFile.getId());
            if (advertiserMapper.update(advertiser) > 0) {
                result.put("url", sysFile.getUrl());
            }
        }
        return result;
    }

}
