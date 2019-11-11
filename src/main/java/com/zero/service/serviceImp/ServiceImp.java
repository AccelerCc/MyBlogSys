package com.zero.service.serviceImp;

import com.zero.mapper.TheMapper;
import com.zero.service.MyService;
import com.zero.users.User;
import com.zero.users.User_Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.annotation.Annotation;
import java.util.List;

@Service
public class ServiceImp implements MyService {
    @Autowired
    private TheMapper mapper;


    @Override
    public User loginCheck(User user) {
       return mapper.findMesByUsername(user);
    }

    @Override
    public User s_findByEmail(User user) {
        return mapper.findMesByEmail(user);
    }

    @Override
    public void s_AddUser(User user) {
        mapper.addUser(user);
    }

    @Override
    public List<User_Content> s_GetContent(Integer start, Integer count) {
        return mapper.getContent(start,count);
    }

    @Override
    public int s_getContentNum() {
        return mapper.getNumOfCont();
    }

    @Override
    public List<User_Content> s_getContentsMes(User user) {
        return mapper.getConentsMes(user);
    }

    @Override
    public int s_getNumOfContById(User user) {
        return mapper.getNumOfContById(user);
    }

    @Override
    public List<User_Content> sCatFuncitonAllMes(User_Content userContent) {
        return mapper.catFunctionAllMes(userContent);
    }

    @Override
    public List<User_Content> sCatFunciton(User_Content userContent) {
        return mapper.catFunction(userContent);
    }

    @Override
    public void sDelConByCid(Integer cid) {
        mapper.delConByCid(cid);
    }

    @Override
    public void sUpCont(User_Content userContent) {
        mapper.upCont(userContent);
    }

    @Override
    public User_Content sEditContByCid(User_Content content) {
        return mapper.editFunctionByCid(content);
    }

    @Override
    public void sImpContChange(User_Content content) {
        mapper.impContChange(content);
    }
}
