package com.origin.mapper;

import com.origin.pojo.Comment;
import com.origin.pojo.Find;
import com.origin.pojo.Lost;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FlMapper {
    @Select("SELECT * FROM find")
    List<Find> find();
    @Select("SELECT * FROM lost")
    List<Lost> lost();
    @Select("SELECT * FROM `find` f JOIN `user` u ON u.id = f.userid WHERE f.id = #{id}")
    Find findmsg(int id);
    @Select("SELECT * FROM `lost` l JOIN `user` u ON u.id = l.userid WHERE l.id = #{id}")
    Lost lostmsg(int id);
    @Insert("insert into find values (null,#{userid},#{name},#{picture},#{detail},0,#{findplace},#{findtime})")
    public int fledit1(Find find);
    @Insert("insert into lost values (null,#{userid},#{lostname},#{picture},#{type},#{lostplace},#{losttime},#{detail})")
    public int fledit2(Lost lost);


}
