package com.origin.controller;

import com.origin.service.FbService;
import com.origin.service.FlService;
import com.origin.service.ForumService;
import com.origin.service.NoticeService;
import com.origin.service.impl.FbServiceImpl;
import com.origin.service.impl.FlServiceImpl;
import com.origin.service.impl.ForumServiceImpl;
import com.origin.service.impl.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @Autowired
    private NoticeService ns = new NoticeServiceImpl();
    @Autowired
    private FlService fs = new FlServiceImpl();
    @Autowired
    private FbService fb =new FbServiceImpl();
    @Autowired
    private ForumService fos = new ForumServiceImpl();
    @GetMapping("/")
    public String ht()
    {
        return "reception/indexpro";
    }
    @GetMapping("/main")
    public ModelAndView tomian()
    {
        ModelAndView  mv = new ModelAndView();
        mv.setViewName("reception/main");
        mv.addObject("nc",ns.nocmsg(1));
        mv.addObject("fos",fos.postlist());
        mv.addObject("fs",fs.find());
        mv.addObject("fb",fb.fblist());
        return mv;
    }
    @GetMapping("/login")
    public String login(){
        return "loginadmin";
    }

    @GetMapping("/regadmin")
    public String regadmin(){
        return "registeradmin";
    }
    @RequestMapping("/admin")
    public String back(){
        return "backstage/admin";
    }

    @RequestMapping("/loginback")
    public String loginout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
