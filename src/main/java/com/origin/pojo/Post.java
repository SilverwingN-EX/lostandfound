package com.origin.pojo;

import lombok.Data;

import java.sql.Timestamp;
//帖子
@Data
public class Post extends User{
    private int id;
    private int userid;
    private String title;
    private String content;
    private Timestamp posttime;
}
