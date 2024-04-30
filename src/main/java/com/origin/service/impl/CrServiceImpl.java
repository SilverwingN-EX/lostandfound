package com.origin.service.impl;

import com.origin.mapper.CrMapper;
import com.origin.pojo.Comment;
import com.origin.pojo.Reply;
import com.origin.service.CrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
@Service
public class CrServiceImpl implements CrService {
    @Autowired
    private CrMapper cm;
    @Override
    public List<Comment> findComment(int id) {
        return cm.findComment(id);
    }

    @Override
    public List<Comment> lostComment(int id) {
        return cm.lostComment(id);
    }

    @Override
    public List<Comment> tzComment(int id) {
        return cm.tzComment(id);
    }

    @Override
    public int addComment(Comment comment){
        Timestamp timestamp = new Timestamp(new Date().getTime());
        comment.setCommenttime(timestamp);
        return cm.addComment(comment);
    }
    @Override
    public int getNowid(){
        return cm.getNowid();
    }

    @Override
    public int addReply(Reply reply) {
        return cm.addReply(reply);
    }

    @Override
    public List<Reply> reply() {
        return cm.reply();
    }

    @Override
    public int DeleteCom(int id) {
        return cm.DeleteCom(id);
    }
}
