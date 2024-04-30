package com.origin.service;

import com.origin.pojo.Notice;
import java.util.List;

public interface NoticeService {
    List<Notice> noclist();
    Notice nocmsg(int id);
    int addnoc(Notice notice);

    int delnotice(int id);
}
