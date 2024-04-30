package com.origin.pojo;

import lombok.Data;

import java.sql.Timestamp;
//评论
@Data
public class Comment extends User{
    private int id;
    private int userid;
    private int refid;//哪篇的id
    private String content;//评论内容
    private int type;
    private Timestamp commenttime;
}
