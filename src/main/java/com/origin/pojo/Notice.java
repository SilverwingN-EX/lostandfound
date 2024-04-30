package com.origin.pojo;

import lombok.Data;

import java.sql.Timestamp;
//公告
@Data
public class Notice extends User{
    private int id;
    private String title;
    private String picture;
    private String msg;
    private Timestamp releasetime;
}
