package com.origin.service.impl;

import com.origin.mapper.NoticeMapper;
import com.origin.pojo.Notice;
import com.origin.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper nm;
    @Override
    public List<Notice> noclist() {
        return nm.noclist();
    }

    @Override
    public Notice nocmsg(int id) {
        return nm.nocmsg(id);
    }

    @Override
    public int addnoc(Notice notice) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        notice.setReleasetime(timestamp);
        return nm.addnoc(notice);
    }

    @Override
    public int delnotice(int id) {
        return nm.delnotice(id);
    }
}
