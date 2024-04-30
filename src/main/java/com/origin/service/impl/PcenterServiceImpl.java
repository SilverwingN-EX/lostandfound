package com.origin.service.impl;

import com.origin.mapper.PcenterMapper;
import com.origin.pojo.Comment;
import com.origin.pojo.Post;
import com.origin.pojo.User;
import com.origin.service.PcenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PcenterServiceImpl implements PcenterService {
    @Autowired
    private PcenterMapper um;
    @Override
    public User getinfo(int id) {
        return um.getinfo(id);
    }

    @Override
    public int updateUser(User user) {
        return um.updateUser(user);
    }

    @Override
    public List<Post> getpost(int id) {
        return um.getpost(id);
    }

    @Override
    public List<Comment> getcom(int id) {
        return um.getcom(id);
    }
}
