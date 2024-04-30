package com.origin.service;

import com.origin.pojo.Admin;
import com.origin.pojo.Mboard;
import com.origin.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
public interface AdminService {
    List<User> pageUserList(int page,int limit);
    int UserListCounts();
    List<User> likeUserList(int page, int limit,String anumber, String nickname);
    int UserListCountslike(String anumber,String nickname);

    int deleteUser(int id);
    int editUser(User user);

    int editAdmin(Admin admin);
    int delboard(int id);
    List<Mboard> likeboard(String title);
}
