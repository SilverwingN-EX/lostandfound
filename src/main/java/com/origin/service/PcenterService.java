package com.origin.service;

import com.origin.pojo.Comment;
import com.origin.pojo.Post;
import com.origin.pojo.User;

import java.util.List;

public interface PcenterService {
    User getinfo(int id);

    int updateUser(User user);
    List<Post> getpost(int id);

    List<Comment> getcom(int id);
}
