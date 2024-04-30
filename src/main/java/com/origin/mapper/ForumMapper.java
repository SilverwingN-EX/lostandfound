package com.origin.mapper;

import com.origin.pojo.Comment;
import com.origin.pojo.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ForumMapper {
    @Select("SELECT * FROM post p JOIN user u ON u.id =p.userid order by p.id desc")
    List<Post> postlist();
    @Select("SELECT * FROM post p JOIN user u ON u.id =p.userid where p.id=#{id} order by p.id desc")
    Post tzmsg(int id);
}
