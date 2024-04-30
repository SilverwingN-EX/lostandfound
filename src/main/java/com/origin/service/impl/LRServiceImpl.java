package com.origin.service.impl;

import com.origin.mapper.LRMapper;
import com.origin.pojo.Admin;
import com.origin.pojo.User;
import com.origin.service.LRService;
import com.origin.util.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

@Service
public class LRServiceImpl implements LRService {
    @Autowired
    private LRMapper lr;
    private String Email = "";

    @Override
    public boolean registerPwd(Admin admin) throws SQLException {
        return lr.registerPwd(admin) > 0;
    }



    @Override
    public User loginPwd(User user) {
        return lr.loginPwd(user);
    }

    @Override
    public User lrEmail(int verificationCode) throws SQLException {
        if (verificationCode == MailUtils.getVFT()) {
            User u =null;
            u=lr.loginEmail(Email);
            System.out.println("U"+u);
            if (u!=null) {
                return u;
            } else {
                Timestamp timestamp =new Timestamp(new Date().getTime());
                String anumber = "lr"+lr.getmaxid()+1;
                User user= new User();
                user.setAnumber(anumber);
                user.setEmail(Email);
                user.setCreatetime(timestamp);
                System.out.println(user);
                int i = lr.registerEmail(user);
                if(i>0){
                   return lr.loginEmail(Email);
                }
                return null;
            }
        }
        return null;
    }

    @Override
    public int sendCode(String email) {
        Email = email;
        return MailUtils.sendMail(email)?1:0;
    }

    @Override
    public Admin adminlogin(Admin admin) {
        return lr.adminlogin(admin);
    }
}
