package com.origin.controller;

import com.origin.pojo.User;
import com.origin.service.CrService;
import com.origin.service.PcenterService;
import com.origin.service.PostService;
import com.origin.service.impl.CrServiceImpl;
import com.origin.service.impl.PcenterServiceImpl;
import com.origin.service.impl.PostServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class PcenterController {
    @Autowired
    private PcenterService us = new PcenterServiceImpl();

    @Autowired
    private PostService ps =new PostServiceImpl();
    @Autowired
    private CrService cs =new CrServiceImpl();
    @RequestMapping("/pcenter")
    public String topcenter() {
        return "reception/pcenter";
    }

    @RequestMapping("/loginoutuser")
    public String loginout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/userupload")
    public String fileupload(User user, @RequestParam(value = "file", required = true) CommonsMultipartFile file,
                             HttpServletRequest request) throws IOException {
        String photo = new Date().getTime() + file.getOriginalFilename();
        user.setPhoto("/upload" + photo);
        int flag = us.updateUser(user);
        File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
        if (!file2.exists()) {
            file2.mkdirs();
        }
        // 获取输出流
        String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
        File newFile = new File(filepath);
        file.transferTo(newFile);
        if (flag > 0) {
            return "reception/info";
        }
        return "error";
    }

    @RequestMapping("/info")
    public ModelAndView toinfo(int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/info");
        modelAndView.addObject("info" , us.getinfo(id));
        return modelAndView;
    }

    @RequestMapping("/info1")
    public ModelAndView toinfo1(int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/info1");
        modelAndView.addObject("infolist" , us.getpost(id));
        System.out.println(us.getpost(id));
        return modelAndView;
    }

    @RequestMapping("/info2")
    public ModelAndView toinfo2(int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/info2");
        modelAndView.addObject("info2" , us.getcom(id));
        System.out.println(us.getcom(id));
        return modelAndView;
    }

    @RequestMapping("/updateuser")
    public String toinfo1(User user) {
        int i = us.updateUser(user);
        if (i > 0)
            return "success";
        return "Error";
    }
    @RequestMapping("/dp")
    @ResponseBody
    public String deletePost(int id){
        int i = ps.DeletePost(id);
        if (id>0)return "success";
        return "error";
    }
    @RequestMapping("/dc")
    @ResponseBody
    public String deleteCom(int id){
        int i = cs.DeleteCom(id);
        if (id>0)return "success";
        return "error";
    }
}
