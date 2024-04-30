package com.origin.mapper;

import com.origin.pojo.Mboard;
import com.origin.pojo.Post;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface FbMapper {
    @Select("SELECT * FROM mboard m JOIN user u ON u.id =m.userid order by m.id desc")
    List<Mboard> fblist();
    @Select("SELECT * FROM mboard m JOIN user u ON u.id =m.userid where m.id=#{id} order by m.id desc")
    Mboard fbmsg(int id);
    @Insert("insert into mboard(id,userid,title,msg,mpicture,type) values (null,#{userid},#{title},#{msg},#{mpicture},0)")
    int addfb(Mboard mboard);
    @Update("update mboard set reply=#{reply},type=#{type} where id = #{id}")
    int editfb(Mboard mboard);
}
