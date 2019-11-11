package com.zero.controller;


import com.zero.service.MyService;
import com.zero.users.Page;
import com.zero.users.User_Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainPage {
    @Autowired
    private MyService myService;

    @RequestMapping("/mainpage")
    public String mainPage(HttpServletRequest request){
        int start = 0;
        int count = 3;

        try {
            start = Integer.parseInt(request.getParameter("page.start"));
            count = Integer.parseInt(request.getParameter("page.count"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Page page = new Page(start,count);
        List<User_Content> theRes = myService.s_GetContent(page.getStart(),page.getCount());
        int total = myService.s_getContentNum();
        page.setTotal(total);
        request.setAttribute("Data",theRes);
        request.setAttribute("page",page);
        return "MyBlogMainPage";
//        return "MainPageTest";
    }

    @RequestMapping("test")
    public String test(){
        return "MainPageTest";
    }
}
