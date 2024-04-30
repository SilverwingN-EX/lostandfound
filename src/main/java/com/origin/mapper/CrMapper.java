package com.origin.mapper;

import com.origin.pojo.Comment;
import com.origin.pojo.Reply;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CrMapper {

    @Select("SELECT * FROM `comment` c JOIN `user` u ON u.id = c.userid WHERE c.refid = #{id} and c.type=0 order by c.id desc")
    List<Comment> findComment(int id);
    @Select("SELECT * FROM `comment` c JOIN `user` u ON u.id = c.userid WHERE c.refid = #{id} and c.type=1 order by c.id desc")
    List<Comment> lostComment(int id);
    @Select("SELECT * FROM `comment` c JOIN `user` u ON u.id = c.userid WHERE c.refid = #{id} and c.type=2 order by c.id desc")
    List<Comment> tzComment(int id);
    @Insert("INSERT INTO comment values (null,#{userid}, #{refid}, #{content}, #{type}, #{commenttime})")
    int  addComment(Comment comment);
    @Select("SELECT MAX(id) FROM comment;")
    int getNowid();

    @Select("SELECT * FROM `reply` r JOIN `user` u ON u.id = r.userid order by r.id desc")
    List<Reply> reply();
    @Insert("INSERT INTO reply values (null,#{userid}, #{refid}, #{rep}, #{replytime})")
    int  addReply(Reply reply);
    @Delete("delete from comment where id =#{id}")
    int DeleteCom(int id);
}
