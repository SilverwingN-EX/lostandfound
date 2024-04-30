package com.origin.service;

import com.origin.pojo.Post;

import java.util.List;

public interface ForumService {
    List<Post> postlist();
    Post tzmsg(int id);
}
