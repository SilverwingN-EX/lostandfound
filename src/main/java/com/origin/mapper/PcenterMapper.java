package com.origin.mapper;

import com.origin.pojo.Comment;
import com.origin.pojo.Post;
import com.origin.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface PcenterMapper {
    @Select("select * from user where id =#{id}")
    User getinfo(int id);

    @Update("update user set pwd=#{pwd},photo=#{photo},nickname=#{nickname},sex=#{sex},phone=#{phone},province=#{province},email=#{email}  where id =#{id}")
    int updateUser(User user);
    @Select("Select * from post where userid=#{id}")
    List<Post> getpost(int id);

    @Select("SELECT * from comment where userid =#{id}")
    List<Comment> getcom(int id);
}
