package com.origin.pojo;

import lombok.Data;
import org.apache.ibatis.annotations.Insert;

import java.sql.Timestamp;
import java.util.Date;

@Data
public class Lost extends User{
    private int id;
    private Integer userid;
    private String lostname;
    private String picture;
    private int type;
    private String lostplace;
    private String detail;
    private Date losttime;
}
