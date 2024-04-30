package com.origin.mapper;

import com.origin.pojo.Comment;
import com.origin.pojo.Post;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapper {
    @Insert("INSERT INTO post values (null,#{userid}, #{title}, #{content}, #{posttime})")
    int  addpost(Post post);
    @Delete("delete from post where id = #{id}")
    int DeletePost(int id);
}
