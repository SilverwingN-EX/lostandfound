package com.origin.service.impl;

import com.origin.mapper.PostMapper;
import com.origin.pojo.Post;
import com.origin.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostMapper pm;
    @Override
    public int addpost(Post post) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        post.setPosttime(timestamp);
        return pm.addpost(post);
    }

    @Override
    public int DeletePost(int id) {
        return pm.DeletePost(id);
    }
}
