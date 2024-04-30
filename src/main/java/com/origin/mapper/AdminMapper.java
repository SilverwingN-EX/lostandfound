package com.origin.mapper;

import com.origin.pojo.Admin;
import com.origin.pojo.Mboard;
import com.origin.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AdminMapper {
    @Select("select * from user LIMIT #{page},#{limit}")
    List<User> pageUserList(@Param("page") int page, @Param("limit") int limit);

    @Select("select count(*) from user")
    int UserListCounts();
    @Select("SELECT * FROM user WHERE (anumber LIKE CONCAT('%', #{anumber}, '%') and nickname LIKE CONCAT('%', #{nickname}, '%'))LIMIT #{page},#{limit}")
    List<User> likeUserList(@Param("page") int page, @Param("limit") int limit,@Param("anumber")String anumber, @Param("nickname") String nickname);
    @Select("select count(*) from user WHERE (anumber LIKE CONCAT('%', #{anumber}, '%') and nickname LIKE CONCAT('%', #{nickname}, '%'))")
    int UserListCountslike(@Param("anumber")String anumber, @Param("nickname") String nickname);

    @Delete("delete from user where id =#{id}")
    int deleteUser(int id);
    @Update("update user set anumber=#{anumber},pwd=#{pwd},photo=#{photo},nickname=#{nickname},sex=#{sex},createtime=#{createtime},phone=#{phone},province=#{province},email=#{email}  where id =#{id}")
    int editUser(User user);

    @Update("update admin set username=#{username},pwd=#{pwd},nickname=#{nickname},nickname=#{nickname},photo=#{photo} where id =#{id}")
    int editAdmin(Admin admin);
    @Delete("delete from mboard where id =#{id}")
    int delboard(int id);
    @Select("select * from mboard WHERE (title LIKE CONCAT('%', #{title}, '%'))")
    List<Mboard> likeboard(String title);
}
