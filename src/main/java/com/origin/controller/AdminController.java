package com.origin.controller;

import com.alibaba.fastjson2.JSON;
import com.origin.pojo.Admin;
import com.origin.pojo.Mboard;
import com.origin.pojo.Notice;
import com.origin.pojo.User;
import com.origin.service.AdminService;
import com.origin.service.FbService;
import com.origin.service.NoticeService;
import com.origin.service.impl.AdminServiceImpl;
import com.origin.service.impl.FbServiceImpl;
import com.origin.service.impl.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService as = new AdminServiceImpl();
    @Autowired
    private FbService fs = new FbServiceImpl();

    @Autowired
    private NoticeService ns = new NoticeServiceImpl();

    @RequestMapping("/loginout")
    public String loginout(HttpSession session) {
        session.invalidate();
        return "/";
    }

    @RequestMapping("/adminp")
    public String console() {
        return "backstage/pcenter";
    }

    @RequestMapping("/userlist")
    public String userlist() {
        return "backstage/userlist";
    }

    @RequestMapping("/board")
    public String board() {
        return "backstage/mboard";
    }

    @RequestMapping("/edit")
    public String edit() {
        return "backstage/edit";
    }

    @RequestMapping("/remsg")
    public String remsg(Model model, int id) {
        model.addAttribute("id", id);
        return "backstage/remsg";
    }

    @RequestMapping("/pageuserlist")
    @ResponseBody
    public String pageUserList(int page, int limit) {
        List<User> users = as.pageUserList(page, limit);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "获取" + page + "数据");
        map.put("count", as.UserListCounts());
        map.put("data", users);
        return JSON.toJSONString(map);
    }

    @RequestMapping("/likeUserList")
    @ResponseBody
    public String likeUserList(int page, int limit, String anumber, String nickname) {
        List<User> users = as.likeUserList(page, limit, anumber, nickname);
        System.out.println(users);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "获取搜索数据");
        map.put("count", as.UserListCountslike(anumber, nickname));
        map.put("data", users);
        return JSON.toJSONString(map);
    }

    @RequestMapping("/fileupload")
    @ResponseBody
    public String fileupload(User user, @RequestParam(value = "file", required = true) CommonsMultipartFile file,
                             HttpServletRequest request) throws IOException {
        String photo = new Date().getTime() + file.getOriginalFilename();
        user.setPhoto("/upload" + photo);
        int flag = as.editUser(user);
        File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
        if (!file2.exists()) {
            file2.mkdirs();
        }
        // 获取输出流
        String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
        File newFile = new File(filepath);
        file.transferTo(newFile);
        if (flag > 0) {
            return "success";
        }
        return "error";
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(int id) {
        int i = as.deleteUser(id);
        if (i > 0) return "success";
        return "error";
    }

    @RequestMapping("/adminupload")
    @ResponseBody
    public String file(Admin admin, @RequestParam(value = "file", required = true) CommonsMultipartFile file,
                       HttpServletRequest request) throws IOException {
        String photo = new Date().getTime() + file.getOriginalFilename();
        admin.setPhoto("/upload" + photo);
        int flag = as.editAdmin(admin);
        File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
        if (!file2.exists()) {
            file2.mkdirs();
        }
        // 获取输出流
        String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
        File newFile = new File(filepath);
        file.transferTo(newFile);
        if (flag > 0) {
            return "success";
        }
        return "error";
    }


    @RequestMapping("/getboard")
    @ResponseBody
    public String getmboard() {
        List<Mboard> fblist = fs.fblist();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "获取搜索数据");
        map.put("count", fblist.size());
        map.put("data", fblist);
        return JSON.toJSONString(map);
    }

    @RequestMapping("/delboard")
    @ResponseBody
    public String delboard(int id) {
        int delboard = as.delboard(id);
        if (delboard > 0)
            return "success";
        return "error";
    }

    @RequestMapping("/repboard")
    public String repboard(Mboard mboard) {
        mboard.setType(1);
        Timestamp timestamp = new Timestamp(new Date().getTime());
        mboard.setReplytime(timestamp);
        int delboard = fs.editfb(mboard);
        if (delboard > 0)
            return "backstage/mboard";
        return "error";
    }

    @RequestMapping("/likeboard")
    @ResponseBody
    public String likeboard(String title) {
        List<Mboard> likeboard = as.likeboard(title);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "获取搜索数据");
        map.put("count", likeboard.size());
        map.put("data", likeboard);
        return JSON.toJSONString(map);
    }

    // @RequestMapping("/imgupload")
    // @ResponseBody
    // public String fileupload(String content,@RequestParam(value = "file", required = true) CommonsMultipartFile file,
    //                          HttpServletRequest request) throws IOException {
    //     String photo = new Date().getTime() + file.getOriginalFilename();
    //     File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
    //     if (!file2.exists()) {
    //         file2.mkdirs();
    //     }
    //     // 获取输出流
    //     String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
    //     File newFile = new File(filepath);
    //     file.transferTo(newFile);
    //         return "success";
    // }
    @RequestMapping("/noc")
    public String noc() {
        return "backstage/notice";
    }

    @RequestMapping("/noticemsg")
    public String noticemsg() {
        return "backstage/noticemsg";
    }

    @GetMapping("/noticelist")
    @ResponseBody
    public String notice() {
        List<Notice> notices = ns.noclist();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("count", notices.size());
        map.put("data", notices);
        return JSON.toJSONString(map);
    }

    @GetMapping("/delnotice")
    public String delnotice(int id) {
        int delnotice = ns.delnotice(id);
        return "backstage/notice";
    }

    @RequestMapping("/addnotice")
    public String delnotice(Notice notice, @RequestParam(value = "file", required = true) CommonsMultipartFile file,
                            HttpServletRequest request) throws IOException {
        String photo = new Date().getTime() + file.getOriginalFilename();
        notice.setPicture(photo);
            File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
            if (!file2.exists()) {
                file2.mkdirs();
            }
            // 获取输出流
            String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
            File newFile = new File(filepath);
            file.transferTo(newFile);
        Timestamp timestamp = new Timestamp(new Date().getTime());
        notice.setReleasetime(timestamp);
        int delnotice = ns.addnoc(notice);
        return "backstage/notice";
    }
    // @RequestMapping("/imgupload")
    // @ResponseBody
    // public String fileupload(String content,@RequestParam(value = "file", required = true) CommonsMultipartFile file,
    //                          HttpServletRequest request) throws IOException {
    //     String photo = new Date().getTime() + file.getOriginalFilename();
    //     File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
    //     if (!file2.exists()) {
    //         file2.mkdirs();
    //     }
    //     // 获取输出流
    //     String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
    //     File newFile = new File(filepath);
    //     file.transferTo(newFile);
    //         return "success";
    // }
}
