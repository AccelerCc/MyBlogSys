package com.zero.controller;

import com.zero.service.MyService;
import com.zero.users.ContentsCategory;
import com.zero.users.Page;
import com.zero.users.User;
import com.zero.users.User_Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class PersonCenter {

    @Autowired
    private MyService myService;

    @RequestMapping("/gotocenter")
    public String goToCenter(HttpServletRequest request,
    HttpSession session ){
        String name = request.getParameter("user");
        User user = new User();
        user.setUserName(name);
        User getUser = myService.loginCheck(user);
        List<User_Content> contents = myService.s_getContentsMes(getUser);
        int numOfCont = myService.s_getNumOfContById(getUser);
        Map<String,ContentsCategory> contCat = new HashMap<>();
        for(User_Content u : contents){
            if(! contCat.containsKey(u.getCategory()) ){
                ContentsCategory theCat = new ContentsCategory();
                theCat.setContCategory(u.getCategory());
                theCat.setNum();
                contCat.put(u.getCategory(),theCat);
            }else {
                contCat.get(u.getCategory()).setNum();
            }
        }

        session.setAttribute("successMes","false");
        session.setAttribute("numofcont",numOfCont);
        session.setAttribute("userMes",getUser);
        session.setAttribute("user_img",contents.get(0));
        session.setAttribute("userContent",contents);
        session.setAttribute("categoryInfo",contCat);
        return "personCenter";
    }

    @ResponseBody
    @RequestMapping("/allmesget")
    public List<User_Content> allmesget(HttpServletRequest request){
        String mes = request.getParameter("ctype");
        String username = request.getParameter("user");
        User user = new User();
        user.setUserName(username);
        User userMes =  myService.loginCheck(user);
        User_Content userContent = new User_Content();
        userContent.setU_id(userMes.getCode());
        userContent.setCategory(mes);
        List<User_Content> catFun = myService.sCatFuncitonAllMes(userContent);
        return catFun;
    }

    @ResponseBody
    @RequestMapping("/mesget")
    public List<User_Content> mesget(HttpServletRequest request){
        String mes = request.getParameter("ctype");
        String username = request.getParameter("user");
        User user = new User();
        user.setUserName(username);
        User userMes =  myService.loginCheck(user);
        User_Content userContent = new User_Content();
        userContent.setU_id(userMes.getCode());
        userContent.setCategory(mes);
        List<User_Content> catFun = myService.sCatFunciton(userContent);
        return catFun;
    }

    @RequestMapping("/cateedit")
    public void catEdit(HttpServletRequest request){
        int cId =Integer.parseInt(request.getParameter("cid"));
        myService.sDelConByCid(cId);
    }

    @RequestMapping("/newCont")
    public String newCont(HttpServletRequest request,
    HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        SimpleDateFormat toFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String username = request.getParameter("username");
        int u_id = Integer.parseInt(request.getParameter("code"));
        String title = request.getParameter("title");
        String category = request.getParameter("cate");
        String url = request.getParameter("imgUrl");
        String content = request.getParameter("content");
        String upMes = request.getParameter("upSuccess");
        User_Content userContent = new User_Content();
        userContent.setU_id(u_id);
        userContent.setTitle(title);
        userContent.setCategory(category);
        userContent.setImg_url(url);
        userContent.setContent(content);
        userContent.setAuthor(username);
        Date upTime = new Date();
        userContent.setUp_time(upTime);
        myService.sUpCont(userContent);


        User user = new User();
        user.setUserName(username);
        User getUser = myService.loginCheck(user);
        List<User_Content> contents = myService.s_getContentsMes(getUser);
        int numOfCont = myService.s_getNumOfContById(getUser);
        Map<String,ContentsCategory> contCat = new HashMap<>();
        for(User_Content u : contents){
            if(! contCat.containsKey(u.getCategory()) ){
                ContentsCategory theCat = new ContentsCategory();
                theCat.setContCategory(u.getCategory());
                theCat.setNum();
                contCat.put(u.getCategory(),theCat);
            }else {
                contCat.get(u.getCategory()).setNum();
            }
        }
        if (upMes.equals("success")) {
            session.setAttribute("successMes","success");
        }else{
            session.setAttribute("successMes","false");
        }

        session.setAttribute("numofcont",numOfCont);
        session.setAttribute("userMes",getUser);
        session.setAttribute("user_img",contents.get(0));
        session.setAttribute("userContent",contents);
        session.setAttribute("categoryInfo",contCat);
        return "personCenter";
    }

    @ResponseBody
    @RequestMapping("/upMes")
    public String upMes(HttpServletRequest request,
    HttpSession session) {
        String upMes = request.getParameter("upSuccess");
        if (upMes.equals("success")) {
            return "success";
        }else if(upMes.equals("editSuccess")) {
            return "editSuccess";
        } else {
            return "false";
        }
    }

    @ResponseBody
    @RequestMapping("/editCont")
    public User_Content editCont(HttpServletRequest request){
        int theCid = Integer.parseInt(request.getParameter("cid"));
        User_Content content = new User_Content();
        content.setC_id(theCid);
        User_Content theCont = myService.sEditContByCid(content);
        return  theCont;
    }

    @RequestMapping("/impedit")
    public String impEdit(HttpServletRequest request,
                        HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        SimpleDateFormat toFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String username = request.getParameter("username");
        int u_id = Integer.parseInt(request.getParameter("code"));
        int c_id = Integer.parseInt(request.getParameter("cid"));
        String title = request.getParameter("title");
        String category = request.getParameter("cate");
        String url = request.getParameter("imgUrl");
        String content = request.getParameter("content");
        String upMes = request.getParameter("upSuccess");
        User_Content userContent = new User_Content();
        userContent.setU_id(u_id);
        userContent.setC_id(c_id);
        userContent.setTitle(title);
        userContent.setCategory(category);
        userContent.setImg_url(url);
        userContent.setContent(content);
        userContent.setAuthor(username);
        Date upTime = new Date();
        userContent.setUp_time(upTime);
        myService.sImpContChange(userContent);


        User user = new User();
        user.setUserName(username);
        User getUser = myService.loginCheck(user);
        List<User_Content> contents = myService.s_getContentsMes(getUser);
        int numOfCont = myService.s_getNumOfContById(getUser);
        Map<String,ContentsCategory> contCat = new HashMap<>();
        for(User_Content u : contents){
            if(! contCat.containsKey(u.getCategory()) ){
                ContentsCategory theCat = new ContentsCategory();
                theCat.setContCategory(u.getCategory());
                theCat.setNum();
                contCat.put(u.getCategory(),theCat);
            }else {
                contCat.get(u.getCategory()).setNum();
            }
        }
        if (upMes.equals("success")) {
            session.setAttribute("successMes","editSuccess");
        }else{
            session.setAttribute("successMes","false");
        }

        session.setAttribute("numofcont",numOfCont);
        session.setAttribute("userMes",getUser);
        session.setAttribute("user_img",contents.get(0));
        session.setAttribute("userContent",contents);
        session.setAttribute("categoryInfo",contCat);
        return "personCenter";

    }
}
