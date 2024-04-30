package com.origin.controller;

import com.origin.service.NoticeService;
import com.origin.service.impl.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class NoticeController {

    @Autowired
    private NoticeService ns = new NoticeServiceImpl();

    @GetMapping("/notice")
    public ModelAndView notice() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/notice");
        modelAndView.addObject("noclist", ns.noclist());
        return modelAndView;
    }

    @GetMapping("/nocmsg")
    public ModelAndView nocmsg(int id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/nocmsg");
        modelAndView.addObject("nocmsg", ns.nocmsg(id));
        return modelAndView;
    }
}
