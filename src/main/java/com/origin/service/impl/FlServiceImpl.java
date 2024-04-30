package com.origin.service.impl;

import com.origin.mapper.CrMapper;
import com.origin.mapper.FlMapper;
import com.origin.pojo.Comment;
import com.origin.pojo.Find;
import com.origin.pojo.Lost;
import com.origin.service.FlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FlServiceImpl implements FlService {
    @Autowired
    private FlMapper fm;



    @Override
    public List<Find> find() {
        return fm.find();
    }

    @Override
    public List<Lost> lost() {
        return fm.lost();
    }

    @Override
    public Find findmsg(int id) {
        return fm.findmsg(id);
    }

    @Override
    public Lost lostmsg(int id) {
        return fm.lostmsg(id);
    }

    @Override
    public int fledit1(Find find) {
        return fm.fledit1(find);
    }

    @Override
    public int fledit2(Lost lost) {
        return fm.fledit2(lost);
    }


}
