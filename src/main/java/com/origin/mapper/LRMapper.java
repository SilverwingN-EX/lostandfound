package com.origin.mapper;

import com.origin.pojo.Admin;
import com.origin.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@Mapper
public interface LRMapper {
	// @Insert("INSERT INTO user(anumber,pwd,nickname) VALUES (#{anumber}, #{pwd}, #{nickname})")
	// int registerPwd(User user) throws SQLException;
	@Insert("INSERT INTO user (anumber, pwd, photo, nickname, sex, phone, province, email, createtime) VALUES (#{anumber}, #{pwd}, #{photo}, #{nickname}, #{sex}, #{phone}, #{province}, #{email}, #{createtime})")
	int registerEmail(User user) throws SQLException;

	@Select("select anumber from user")
	List<String> checkAnumber();
	@Select("select max(id) from user")
	int getmaxid();
	@Select("select * FROM user where (anumber = #{anumber} OR email = #{anumber}) AND pwd = #{pwd}")
	User loginPwd(User user);
	@Select("select * from user where email=#{email}")
	User loginEmail(String email);
	@Select("select* from admin where username=#{username} and pwd =#{pwd}")
	Admin adminlogin(Admin admin);
	@Insert("insert into admin values (null,#{username},#{pwd},#{nickname},#{photo})")
	int registerPwd(Admin admin);
}
