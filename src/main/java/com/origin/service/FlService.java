package com.origin.service;

import com.origin.pojo.Comment;
import com.origin.pojo.Find;
import com.origin.pojo.Lost;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FlService {
    List<Find> find();
    List<Lost> lost();
    Find findmsg(int id);
    Lost lostmsg(int id);
    public int fledit1(Find find);
    public int fledit2(Lost lost);
}
