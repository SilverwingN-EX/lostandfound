package com.origin.controller;

import com.alibaba.fastjson2.JSON;
import com.origin.service.CrService;
import com.origin.service.ForumService;
import com.origin.service.impl.CrServiceImpl;
import com.origin.service.impl.ForumServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller

public class ForumController {

    @Autowired
    private ForumService fs = new ForumServiceImpl();
    @Autowired
    private CrService cs = new CrServiceImpl();

    @GetMapping("/forum")
    public ModelAndView ht() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/forum");
        modelAndView.addObject("tzlist", fs.postlist());
        return modelAndView;
    }

    @GetMapping("/tzmsg")
    public ModelAndView tz(int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/tzmsg");
        modelAndView.addObject("tzmsg",fs.tzmsg(id));
        modelAndView.addObject("rew", cs.tzComment(id));
        System.out.println(cs.tzComment(id));
        modelAndView.addObject("reply", cs.reply());
        return modelAndView;
    }
    @GetMapping("/tz")
    public String tz() {
        return "reception/tz";
    }}


