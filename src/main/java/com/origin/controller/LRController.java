package com.origin.controller;

import com.alibaba.fastjson2.JSON;
import com.origin.pojo.Admin;
import com.origin.pojo.User;
import com.origin.service.LRService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.mail.Session;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LRController {
    @Autowired
    private LRService lrs;

    @GetMapping("/lg")
    public String lg() {
        return "/login";
    }

    @GetMapping("/reg")
    public String reg() {
        return "/register";
    }

    @RequestMapping("/tologin")
    @ResponseBody
    public String login(User user, HttpSession session) {
        User user1 = lrs.loginPwd(user);
        if (user1!=null) {
            // session.invalidate();
            session.setAttribute("user", user1);
            Map<String, Object> map = new HashMap<>();
            map.put("code", 0);
            map.put("msg", "登录成功");
            map.put("data", "");
            return JSON.toJSONString(map);
        } else return "error";
    }

    // TODO 发送邮件
    @GetMapping("/sendemail")
    @ResponseBody
    public String sendemail(String email) {
        return lrs.sendCode(email) > 0 ? "success" : "error";
    }

    // TODO 邮箱登录
    @GetMapping("/lremail")
    @ResponseBody
    public String emaillogin(int code, HttpSession session) throws SQLException {
        User user = lrs.lrEmail(code);
        System.out.println(user);
        if (user != null) {
            session.setAttribute("user", user);
            return "success";
        } else return "error";
    }

    // TODO 管理员登录
    @RequestMapping("/toAdminLogin")
    @ResponseBody
    public String adminlogin(Admin admin, HttpSession session) {
        Admin a = null;
        a=lrs.adminlogin(admin);
        if (a!=null) {
            // session.invalidate();
            session.setAttribute("admin", a);
            return "success";
        } else return "error";
    }

    @RequestMapping("/register")
    @ResponseBody
    public String reg(Admin admin) throws SQLException {
        Map<String, Object> map = new HashMap<>();
        if (lrs.registerPwd(admin)) {
            map.put("code", 0);
            map.put("msg", "注册成功");
            return JSON.toJSONString(map);
        }
        return "error";
    }
}
