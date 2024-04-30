package com.origin.mapper;

import com.origin.pojo.Notice;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NoticeMapper {
    @Select("SELECT * FROM notice n order by n.id desc")
    List<Notice> noclist();
    @Select("SELECT * FROM notice n where n.id=#{id} order by n.id desc")
    Notice nocmsg(int id);
    @Insert("INSERT into notice values (null,#{title},#{picture},#{msg},#{releasetime})")
    int addnoc(Notice notice);
    @Delete("delete from notice where id =#{id}")
    int delnotice(int id);
}
