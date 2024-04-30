package com.origin.service.impl;

import com.origin.mapper.ForumMapper;
import com.origin.pojo.Post;
import com.origin.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ForumServiceImpl implements ForumService {
    @Autowired
    private ForumMapper fm;
    @Override
    public List<Post> postlist() {
        return fm.postlist();
    }

    @Override
    public Post tzmsg(int id){
        return fm.tzmsg(id);
    }
}
