package com.origin.service;

import com.origin.pojo.Admin;
import com.origin.pojo.User;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
public interface LRService {
    boolean registerPwd(Admin admin) throws SQLException;
    User loginPwd(User user);
    User lrEmail(int verificationCode) throws SQLException;
    int sendCode(String email);
    Admin adminlogin(Admin admin);
}
