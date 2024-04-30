package com.origin.controller;

import com.origin.pojo.Post;
import com.origin.pojo.User;
import com.origin.service.ForumService;
import com.origin.service.PostService;
import com.origin.service.impl.ForumServiceImpl;
import com.origin.service.impl.PostServiceImpl;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
public class PostController {
    @Autowired
    private ForumService fs = new ForumServiceImpl();
    @Autowired
    private PostService ps = new PostServiceImpl();
    @RequestMapping("/post")
    public String back(){
        return "reception/post";
    }

    @RequestMapping("/upload")
    @ResponseBody
    public String postupload(Post post,@RequestParam(value = "file",required = true) CommonsMultipartFile file,
                             HttpServletRequest request) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        post.setUserid(user.getId());
        int addpost = ps.addpost(post);
        String photo=file.getOriginalFilename();
        File file2 = new File(request.getSession().getServletContext().getRealPath("/upload"));
        if (!file2.exists()) {
            file2.mkdirs();
        }
        // 获取输出流
        String filepath = request.getSession().getServletContext().getRealPath("/upload") + "/" + photo;
        File newFile = new File(filepath);
        file.transferTo(newFile);
            return "success";
    }

    @RequestMapping("/addpost")
    public ModelAndView addpost(Post post){
        System.out.println(post);
        int addpost = ps.addpost(post);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("reception/forum");
        modelAndView.addObject("tzlist", fs.postlist());
        return modelAndView;
    }
}
