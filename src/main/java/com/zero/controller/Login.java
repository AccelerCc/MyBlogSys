package com.zero.controller;

import com.mysql.cj.Session;
import com.zero.service.MyService;
import com.zero.service.serviceImp.ServiceImp;
import com.zero.users.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class Login {
    @Autowired
    private MyService myService;

    @RequestMapping("/login")
    public String login(HttpServletRequest request,
                        HttpSession session){

        String username = request.getParameter("username");
        String password= request.getParameter("password");
        User loginUser = new User();
        loginUser.setUserName(username);
        User userAllMes = myService.loginCheck(loginUser);
        if(userAllMes != null) {
            if (userAllMes.getPassWord().equals(password)) {
                session.setAttribute("userAllMes", userAllMes);
                return "redirect:mainpage";
            } else {
                request.setAttribute("wrong", "用户名或密码错误，请重新输入");
                return "LoginPage";
            }
        }else {
            request.setAttribute("wrong", "用户名或密码错误，请重新输入");
            return "LoginPage";
        }
    }
}
