package com.zero.service;

import com.zero.users.User;
import com.zero.users.User_Content;

import java.util.List;

public interface MyService {

    public User loginCheck(User user);

    public User s_findByEmail(User user);

    public void s_AddUser(User user);

    public List<User_Content> s_GetContent(Integer start, Integer count);

    public int s_getContentNum();

    public List<User_Content> s_getContentsMes(User user);

    public int s_getNumOfContById(User user);

    public List<User_Content> sCatFuncitonAllMes(User_Content userContent);

    public List<User_Content> sCatFunciton(User_Content userContent);

    public void sDelConByCid(Integer cid);

    public void sUpCont(User_Content userContent);

    public User_Content sEditContByCid(User_Content content);

    public void sImpContChange (User_Content content);
}
