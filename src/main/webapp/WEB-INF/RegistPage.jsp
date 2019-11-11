<%--
  Created by IntelliJ IDEA.
  User: accelerccc
  Date: 2019/10/30/0030
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">

    <title>影</title>
</head>
<style>
    #regist_div{
        top: 18%;
        height: 400px;
        width: 350px;
        position: absolute;
        right: 3%;
    }
    #form_regist{
        background-color: #EDEDED;
        padding-top: 10px;
        padding-bottom: 20px;
        padding-left: 20px;
        padding-right: 20px;
        border-radius: 15px;
        border-color:#d2d2d2;
        border-width: 5px;
        box-shadow:0 1px 0 #cfcfcf;
    }
    .regist_btn{
        margin-top: 35px;
    }
</style>
<body background="img/violet.jpg">
<div id="regist_div" class="container">
    <div class="row">
        <div id="form_regist"  style="background-color: white">
            <h2>注册并开始你的博客</h2>
            <p class="lead text-muted">填写你的信息</p>
            <div id="warnMes" ></div>
            <div id="warnMes02" ></div>
            <form class="regist_form " action="userRegist" method="post">
                <h5>用户名</h5>
                <input type="text" id="userid" class="form-control" name="username" onkeyup="checkName()" required="" autofocus="">
                <h5>密码</h5>
                <input type="password" class="form-control" name="password" required="" >
                <h5>邮箱</h5>
                <input type="text" id="email" class="form-control" name="email" onkeyup="checkEmail()" required="" >
                <h5>电话</h5>
                <input type="text" class="form-control" name="phone">
                <button type="submit" class="regist_btn btn btn-primary">提交并注册</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

<script type="text/javascript">

    function checkName() {
        var theid=$("#userid").val();
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/koi/idCheck?userid="+theid,//提交地址
            // data:"userid="+userid,//提交数据
            data:{},
            // dataType:"json",//返回json格式
            //contentType:"application/json;charset=utf-8",
            success:function(data){
                if (data == "yes") {
                    $("#warnMes").text("");
                    $("#warnMes").attr("style","color:#5f9ea0");
                    $("#warnMes").append("用户名可以使用");
                } else if (data == "no"){
                    $("#warnMes").text("");
                    $("#warnMes").attr("style","color:#5f9ea0");
                    $("#warnMes").text("用户名已被使用");
                }else if (data == "null"){
                    $("#warnMes").text("");
                }
            },
            error:function () {
                alert(theid);
            }
        });
    }


    function checkEmail() {
        var themail=$("#email").val();
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/koi/emailCheck?email="+themail,//提交地址
            // data:"userid="+userid,//提交数据
            data:{},
            // dataType:"json",//返回json格式
            //contentType:"application/json;charset=utf-8",
            success:function(data){
                if (data == "no") {
                    $("#warnMes02").text("");
                    $("#warnMes02").attr("style","color:#cd5c5c");
                    $("#warnMes02").append("该邮箱已被使用");
                } else {
                    $("#warnMes02").text("");
                    $("#warnMes02").attr("style","color:#cd5c5c");
                }
            }

        });
    }
</script>
