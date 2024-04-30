package com.origin.pojo;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Reply extends User{
    private int id;
    private int refid;
    private int userid;
    private String rep;
    private Timestamp replytime;
}
