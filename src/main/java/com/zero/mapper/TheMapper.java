package com.zero.mapper;

import com.github.pagehelper.ISelect;
import com.zero.users.User;
import com.zero.users.User_Content;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
public interface TheMapper {

    @Select("select * from usermes where id = #{userName}")
    public User findMesByUsername(User user);

    @Select("select * from usermes where email=#{email}")
    public User findMesByEmail(User user);

    @Insert("insert into usermes (id,password,email,phone) values(#{id},#{passWord},#{email},#{phone})")
    public void addUser(User user);

    @Select("select * from user_contents limit #{param1},#{param2}")
    public List<User_Content> getContent(Integer start, Integer count);

    @Select("select count(*) from user_contents")
    public int getNumOfCont();

    @Select("select * from user_contents where u_id = #{code}")
    public List<User_Content> getConentsMes(User user);

    @Select("select count(*) from user_contents where u_id = #{code}")
    public int getNumOfContById(User user);

    @Select("select * from user_contents where u_id = #{u_id}")
    public List<User_Content> catFunctionAllMes (User_Content userContent);

    @Select("select * from user_contents where u_id = #{u_id} and category = #{category}")
    public List<User_Content> catFunction (User_Content userContent);

    @Delete("delete from user_contents where c_id = #{param1}")
    public void  delConByCid(Integer cid);

    @Insert("insert into user_contents (u_id,title,category,content,up_time,img_url,author) values(#{u_id},#{title},#{category},#{content},#{up_time},#{img_url},#{author})")
    public void upCont(User_Content userContent);

    @Select("select * from user_contents where c_id = #{c_id}")
    public User_Content editFunctionByCid(User_Content content);

    @Update("update user_contents set title =#{title},category = #{category},content =#{content},up_time = #{up_time},img_url =#{img_url} where c_id=#{c_id} ")
    public void impContChange (User_Content content);
}
