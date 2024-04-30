package com.origin.controller;

import com.alibaba.fastjson2.JSON;
import com.origin.pojo.Find;
import com.origin.pojo.Mboard;
import com.origin.pojo.User;
import com.origin.service.FbService;
import com.origin.service.impl.FbServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller

public class FeedbackController {

    @Autowired
    private FbService fs = new FbServiceImpl();
    @GetMapping("/feedback")
    public ModelAndView ht()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/feedback");
        modelAndView.addObject("htlist",fs.fblist());
        System.out.println(fs.fblist());
        return modelAndView;
    }


    @GetMapping("/htmsg")
    public ModelAndView htmsg(int id){
        ModelAndView modelAndView= new ModelAndView();
        modelAndView.setViewName("reception/htmsg");
        modelAndView.addObject("htmsg",fs.fbmsg(id));
        return modelAndView;
    }
    @RequestMapping("/addfb")
    public ModelAndView addfb(Mboard mboard, @RequestParam(value = "file",required = true) CommonsMultipartFile file,
                        HttpServletRequest request) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String photo=new Date().getTime()+file.getOriginalFilename();
        mboard.setMpicture(photo);
        mboard.setUserid(user.getId());
        int i =fs.addfb(mboard);
        File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
        if (!file2.exists()) {
            file2.mkdirs();
        }
        // 获取输出流
        String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
        File newFile = new File(filepath);
        file.transferTo(newFile);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/feedback");
        modelAndView.addObject("htlist",fs.fblist());
        System.out.println(fs.fblist());
        return modelAndView;
    }
}
