package com.origin.service;

import com.origin.pojo.Comment;
import com.origin.pojo.Reply;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CrService {
    List<Comment> findComment(int id);
    List<Comment> lostComment(int id);
    List<Comment> tzComment(int id);
    int  addComment(Comment comment);
    int getNowid();
    int  addReply(Reply reply);
    List<Reply> reply();

    int DeleteCom(int id);
}
