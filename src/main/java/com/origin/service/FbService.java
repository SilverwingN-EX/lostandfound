package com.origin.service;

import com.origin.pojo.Mboard;
import com.origin.pojo.Post;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FbService {
    List<Mboard> fblist();
    Mboard fbmsg(int id);

    int addfb(Mboard mboard);
    int editfb(Mboard mboard);
}
