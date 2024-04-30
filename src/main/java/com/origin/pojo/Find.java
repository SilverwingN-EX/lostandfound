package com.origin.pojo;

import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
public class Find extends User{
    private int id;
    private Integer userid;
    private String name;
    private String picture;
    private String detail;
    private int type;
    private String findplace;
    private Date findtime;
}
