<%--
  Created by IntelliJ IDEA.
  User: accelerccc
  Date: 2019/10/30/0030
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">

    <title>光</title>
</head>

<style>
    body{
        font-family: Arial;
    }
    .login_div{
        width: 380px;
        height: 400px;
        text-align: center;
        left: 50%;
        top: 50%;
        position: absolute;
        margin:-200px 0 0 -190px;
    }
    .loginTip{
        color: white;
        margin: 0 auto 35px auto;
    }
    .form_input{
        width: 70%;
        height: 35px;
        display: block;
        margin: 20px auto;
        outline: none;
    }
    .loginBtn{
        width: 33%;
        margin: 20px auto;
    }
    .login_a{
        margin: 0 auto 20px auto;
        font-weight: bold;
    }
    .login_p{
        font-weight: bold;
    }
    #wrongMes{
        font-weight: bold;
    }
    #successMes{
        font-weight: bold;
    }
    .rememberME{

        font-weight: bold;
    }
</style>
<body background="img/login03-3.jpg">
<div class="login_div">
    <form class="form_signin " action="login" method="post">
        <h3 class="loginTip mb-3 font-weight-normal text-white">登陆您的博客</h3>
        <input type="text" name="username" class="form_input form-control" placeholder="Username" required="" autofocus="">
        <input type="password" name="password" class="form_input form-control" placeholder="Password" required="">
        <div class="checkbox">
            <label>
                <input class="rememberME" type="checkbox"><font color="white"> 记住我</font>
            </label>
        </div>
        <button type="submit" class="loginBtn btn btn-primary">登陆</button><br>
        <div id="successMes">${success}</div><br>
        <div id="wrongMes">${wrong}</div><br>
        <a class="login_a btn btn-sm" href="http://localhost:8080/koi/regist">没有账号？点我注册</a>
        <p class="login_p mt-5 mb-3 text-white" >© 2018-2019</p>
    </form>
</div>

</body>
</html>

<script type="text/javascript">
    $("#wrongMes").attr("style","color:#ff6347");
    $("#successMes").attr("style","color:#fa8072");
</script>