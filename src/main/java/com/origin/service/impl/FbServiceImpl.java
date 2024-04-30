package com.origin.service.impl;

import com.origin.mapper.FbMapper;
import com.origin.pojo.Mboard;
import com.origin.service.FbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
@Service
public class FbServiceImpl implements FbService {

    @Autowired
    private FbMapper fm;
    @Override
    public List<Mboard> fblist() {
        return fm.fblist();
    }

    @Override
    public Mboard fbmsg(int id) {
        return fm.fbmsg(id);
    }

    @Override
    public int addfb(Mboard mboard) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        mboard.setBoardtime(timestamp);
        return fm.addfb(mboard);
    }

    @Override
    public int editfb(Mboard mboard) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        mboard.setReplytime(timestamp);
        return fm.editfb(mboard);
    }


}
