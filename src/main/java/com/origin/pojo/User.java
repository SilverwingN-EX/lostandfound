package com.origin.pojo;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

@Data
public class User {
    private int id;
    private String anumber;
    private String pwd;
    private String photo;
    private String nickname;
    private int sex;
    private String phone;
    private String province;
    private String email;
    private Timestamp createtime;
}
