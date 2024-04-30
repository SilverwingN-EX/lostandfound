package com.origin.controller;

import com.alibaba.fastjson2.JSON;
import com.origin.pojo.*;
import com.origin.service.CrService;
import com.origin.service.FlService;
import com.origin.service.PcenterService;
import com.origin.service.impl.CrServiceImpl;
import com.origin.service.impl.FlServiceImpl;
import com.origin.service.impl.PcenterServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller

public class FlController {

    @Autowired
    private FlService fs = new FlServiceImpl();

    @Autowired
    private CrService cs = new CrServiceImpl();

    @Autowired
    private PcenterService ps = new PcenterServiceImpl();

    private int flag = 0;

    @RequestMapping("/fl")
    public ModelAndView tofl(int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/fl");
        flag = id;
        if (flag == 0) modelAndView.addObject("find", fs.find());
        else modelAndView.addObject("lost", fs.lost());
        return modelAndView;
    }

    @RequestMapping("/flmsg")
    @ResponseBody
    public String flmsg(int id) {
        flag = id;
        Map<String, Object> map = new HashMap<>();
        if (flag == 0) map.put("list", fs.find());
        else map.put("list", fs.lost());
        return JSON.toJSONString(map);
    }

    @RequestMapping("/detail")
    public ModelAndView detail(int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/detail");
        if (flag == 0) {
            modelAndView.addObject("msg", fs.findmsg(id));
            System.out.println(fs.findmsg(id));
            modelAndView.addObject("rew", cs.findComment(id));
        } else {
            modelAndView.addObject("msg", fs.lostmsg(id));
            modelAndView.addObject("rew", cs.lostComment(id));
        }
        modelAndView.addObject("reply", cs.reply());
        return modelAndView;
    }

    @RequestMapping("/addcom")
    @ResponseBody
    public String addComment(Comment comment) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        comment.setCommenttime(timestamp);
        int i = cs.addComment(comment);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp));
        map.put("id", cs.getNowid());
        if (i > 0)
            return JSON.toJSONString(map);
        else return "error";
    }

    @RequestMapping("/addrep")
    @ResponseBody
    public String addReplay(Reply reply) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        reply.setReplytime(timestamp);
        int i = cs.addReply(reply);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timestamp));
        map.put("nickname",reply.getNickname());
        if (i > 0)
            return JSON.toJSONString(map);
        else return "error";
    }

    @RequestMapping("/sfl")
    public String sendfl(int id, Model model) {
        model.addAttribute("id", id);
        return "reception/sendfl";
    }
    @RequestMapping("/map")
    public String map() {
        return "reception/map";
    }

    @RequestMapping("/fledit0")
    public ModelAndView fledit(Find f, @RequestParam(value = "file",required = true) CommonsMultipartFile file,
                         HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String photo=new Date().getTime()+file.getOriginalFilename();
        f.setPicture(photo);
        f.setUserid(user.getId());
        int i =fs.fledit1(f);
        File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
        if (!file2.exists()) {
            file2.mkdirs();
        }
        // 获取输出流
        String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
        File newFile = new File(filepath);
        file.transferTo(newFile);
        ModelAndView modelAndView= new ModelAndView("redirect:/fl");
        modelAndView.addObject("id",0);
        return modelAndView;
    }

    @RequestMapping("/fledit1")
    public ModelAndView fledit2(Lost l,@RequestParam(value = "file",required = true) CommonsMultipartFile file,
                          HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String photo=new Date().getTime()+file.getOriginalFilename();
        l.setPicture(photo);
        l.setUserid(user.getId());
        int i =fs.fledit2(l);
        File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
        if (!file2.exists()) {
            file2.mkdirs();
        }
        // 获取输出流
        String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
        File newFile = new File(filepath);
        file.transferTo(newFile);
        ModelAndView modelAndView= new ModelAndView("redirect:/fl");
        modelAndView.addObject("id",0);
        return modelAndView;
    }
}
