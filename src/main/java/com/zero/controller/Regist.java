package com.zero.controller;

import com.zero.service.MyService;
import com.zero.service.serviceImp.ServiceImp;
import com.zero.users.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class Regist {
    @Autowired
    private MyService myService;

    @RequestMapping("/regist")
    public String regist(){
        return "RegistPage";
    }

    @RequestMapping("/userRegist")
    public String userRegist(HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String sPhone = request.getParameter("phone");
        int phone = Integer.parseInt(sPhone);

        User newUser = new User(username,password,email,phone);
        myService.s_AddUser(newUser);
        request.setAttribute("success","注册成功，请登陆");
        return "LoginPage";
    }

    @ResponseBody
    @RequestMapping("/idCheck")
    public String idCheck(HttpServletRequest request){
        String username = request.getParameter("userid");
        if(username.equals("")){
            return "null";
        }
        User user = new User();
        user.setUserName(username);
        User UserAllMes = myService.loginCheck(user);
        if(UserAllMes == null){
            return "yes";
        }else
        return "no";
    }

    @ResponseBody
    @RequestMapping("/emailCheck")
    public String emailCheck(HttpServletRequest request){
        String useremail = request.getParameter("email");
        User user = new User();
        user.setEmail(useremail);
        User UserAllMes = myService.s_findByEmail(user);
        if(UserAllMes == null){
            return "yes";
        }else
            return "no";
    }
}
