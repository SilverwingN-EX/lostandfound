package com.origin.service.impl;

import com.origin.mapper.AdminMapper;
import com.origin.pojo.Admin;
import com.origin.pojo.Mboard;
import com.origin.pojo.User;
import com.origin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper am;
    @Override
    public List<User> pageUserList(int page, int limit) {
        return am.pageUserList((page - 1) * limit, limit);
    }

    @Override
    public int UserListCounts() {
        return am.UserListCounts();
    }

    @Override
    public List<User> likeUserList(int page, int limit,String anumber, String nickname) {
        return am.likeUserList((page - 1) * limit, limit,anumber,nickname);
    }

    @Override
    public int UserListCountslike(String anumber, String nickname) {
        return am.UserListCountslike(anumber,nickname);
    }
    @Override
    public int deleteUser(int id){
        return am.deleteUser(id);
    }
    @Override
    public int editUser(User user){
        return am.editUser(user);
    }

    @Override
    public int editAdmin(Admin admin) {
        return am.editAdmin(admin);
    }

    @Override
    public int delboard(int id) {
        return 0;
    }

    @Override
    public List<Mboard> likeboard(String title) {
        return am.likeboard(title);
    }

}
