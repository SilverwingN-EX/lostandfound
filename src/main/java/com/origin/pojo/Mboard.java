package com.origin.pojo;

import lombok.Data;

import java.sql.Timestamp;

//反馈中心
@Data
public class Mboard extends User{
    private int id;
    private int userid;
    private String title;
    private String msg;
    private String mpicture;
    private String reply;
    private String rpicture;
    private int type;
    private Timestamp boardtime;
    private Timestamp replytime;
}
