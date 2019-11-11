<%--
  Created by IntelliJ IDEA.
  User: accelerccc
  Date: 2019/11/2/0002
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <%  request.setCharacterEncoding( "utf-8");%>
    <% response.setCharacterEncoding("utf-8"); %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>

    <title>流</title>
</head>
<style>
    html,body{
        height: 100%;
        width: 100%;
        font-family: Arial;
    }
    #center_All{
        overflow: hidden;
    }
    #top{
        line-height: 36px;
        width: 100%;
        height: 36px;
        background-color: dce6e9;
    }
    #top a{
        text-decoration: none;
        font-weight: bold;
        color: 3e5f84;
    }
    #top a:hover{
        text-decoration: none;
        font-weight: bold;
        color: 3e5f84;
    }
    #info_div{
        width: 12%;
        height: 20%;
        margin: 30px;
        text-align: center;
        border:lightblue solid;
        /*background-color: dce6e9;*/
    }
    #category_div{
        top: 34%;
        left: 0;
        width: 12%;
        height: 40%;
        margin: 30px;
        position: fixed;
        color: black;
    }
    #category_div a{
        text-decoration: none;
        color: black;
    }
    #edit_div{
        display: inline-block;
        position: relative;
        top:-270px;
        left: 15%;
        width: 35%;
        min-height: 65%;
        margin: 50px;
    }
    .info_img{
        margin: 10% 0 0 0;
        width: 35%;
        height: 35%;
    }
    .info_name{
        display: block;
        margin: 5% 0 0 0;
        font-weight: bold;
        font-size: 30px;
    }
    #cont_num{
        display: block;
        margin: auto;
        font-size: 15px;
        font-weight: bold;
    }
    .cateCont_div{
        width: 100%;
        display: inline-block;
    }
    .cateSpan{
       line-height: 35px;
    }
    #category_div a:focus{
        background-color: 407bb9;
    }
    .del_button{
        width:10%;
        float: right;
        position: relative;
        margin: 0 0 0 10px;
    }
    .edit_button{
        float: right;
        width: 10%;
        position: relative;
        margin: 0 10px 0 0;
    }
    #write_div{
        float: right;
        display: inline-block;
        position: relative;
        top:-270px;
        width: 45%;
        margin: 50px 0 50px 50px;
    }
    #title_input{
        margin: 15px 30px 20px 0;
    }
    #cat_select{
        margin: 15px 30px 20px 0;
    }
    #img_input{
        margin: 15px 30px 20px 0;
    }
    #cont_text{
        margin: 15px 30px 20px 0;
        min-height: 35%;
        max-height: 55%;
    }
    #reset_a{
        float: right;
        line-height: 35px;
    }
</style>
<body >
<div id="center_All">
        <div id="top" class="navbar-fixed-to">
            <span><a style="margin: 0 30px 0 30px" href="http://localhost:8080/koi/mainpage">返回主页</a></span>
            <span class="pull-right" style="margin: 0 30px 0 30px"><a href="http://localhost:8080/koi/">退出</a></span>
        </div>


        <div id="alert_div" class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>

        <div id="info_div" class="panel panel-default">
            <img src="${user_img.img_url}" class="info_img img-circle">
            <span class="info_name">${userMes.userName}</span>
            <span id="cont_num">发表的博客： ${numofcont} 篇</span>
        </div>

        <div id="edit_div" class="panel panel-info">
            <div class="panel-heading">你的博客</div>
            <div  class="panel-body">
                <ul id="cateCont">
                    <c:forEach items="${userContent}" var="theTitle">
                        <div id="cont${theTitle.c_id}" class="cateCont_div">
                            <span  class='cateSpan'>${theTitle.title} </span>
                            <span  class="del_button"><button  class="btn btn-danger" onclick="delCont(${theTitle.c_id})">删除</button></span>
                            <span  class="edit_button"><button  class="btn btn-primary" onclick="editCont(${theTitle.c_id},'${userMes.userName}')">编辑</button></span>
                            <hr>
                        </div>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <div id="write_div" class="panel panel-success">
            <div class="panel-heading">尽情书写</div>
            <div id="edit_body" class="panel-body">
                <form action="newCont" method="post">
                    <input id="contAuthor" name="username" value="${userMes.userName}" style="display: none">
                    <input id="code" name="code" value="${userMes.code}" style="display: none">
                    <input name="upSuccess" value="success" style="display: none">
                    标题：<input id="title_input" class="form-control" name="title" placeholder="隐约雷鸣 阴霾天空 但盼风雨来 能留你在此" style="width: 40%" required="" autofocus="">
                    分类：<select id="cat_select" name="cate" class="form-control" style="width: 10%">
                        <option selected value="随笔">随笔</option>
                        <option  value="影评">影评</option>
                        <option  value="生活">生活</option>
                        <option  value="旅游">旅游</option>
                        <option  value="美食">美食</option>
                        <option  value="科技">科技</option>
                        <option  value="其他">其他</option>
                    </select>
                    图片链接：<input id="img_input" class="form-control" name="imgUrl" placeholder="言叶" style="width: 60%">
                    内容：<textarea id="cont_text" class="form-control" name="content" placeholder="隐约雷鸣 阴霾天空 即使天无雨 我亦留此地" required=""></textarea>
                    <button type="submit" class="btn btn-success" style="width: 15%">发表</button>
                </form>
            </div>
        </div>

        <div id="category_div">
            <ul class="list-group">
               <a id="all" href="javascript:void(0)" class="list-group-item"  onclick="takeAll('${userMes.userName}','全部')">全部 <span class="badge">${numofcont}</span></a>
                <c:forEach items="${categoryInfo}" var="Concategory">
<%--                    <li class="list-group-item"><span class="badge">${Concategory.value.num}</span>--%>
<%--                        <a href="#" onclick="takeCate('${userMes.userName}',${Concategory.value.contCategory})">--%>
<%--                        ${Concategory.value.contCategory}</a>--%>
<%--                    </li>--%>
                        <a href="javascript:void(0)" class="list_a list-group-item" onclick="takeCate('${userMes.userName}','${Concategory.value.contCategory}')">
                                ${Concategory.value.contCategory}<span class="badge">${Concategory.value.num}</span></a>
                </c:forEach>
            </ul>
        </div>

        <div>
            <%@ include file="MainpageFoot.jsp" %>
        </div>
    </div>


</body>
</html>

<script>
    window.onload = function(){
        upMes('${successMes}')
    };
        function upMes(mes) {
           var theMes = mes;
            $.ajax({
                type:"POST",
                url:"http://localhost:8080/koi/upMes?upSuccess=" + theMes,
                success:function (data) {
                    if (data == "success"){
                        // $("#alert_div").text("");
                        $("#alert_div").append("发表成功");
                        $("#alert_div").attr('style','display:""');

                    }else if (data == "editSuccess"){
                        $("#alert_div").append("修改成功");
                        $("#alert_div").attr('style','display:""');
                    } else{
                        $("#alert_div").css('display','none');
                    }
                }
            })
        }

    function takeAll(name,mes) {
        var theMes = mes;
        var theName = name;
        var contName = "\"" + theName + "\"";
        $("#cateCont").text("");
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/koi/allmesget?user="+ theName +"&ctype="+ theMes,
            dataType:"json",
            success:function (data) {
                var theList = data;
                for (var i = 0 ; i , theList.length ; i ++){
                    var liMes = "<div id=cont"+ theList[i].c_id  + " class='cateCont_div'> <span class='cateSpan'>" + theList[i].title + " </span> " +
                        "<span class='del_button'><button  class='btn btn-danger' onclick='delCont(" + theList[i].c_id +" )'>删除</button></span>" +
                               " <span class='edit_button'><button  class='btn btn-primary' onclick='editCont( " + theList[i].c_id +"\,"+ contName + ")'>编辑</button></span><hr></div>";
                    $("#cateCont").append(liMes);

                }
            }
        })
    }

    function takeCate(name,mes) {
        var theMes = mes;
        var theName = name;
        var contName = "\"" + theName + "\"";
        $("#cateCont").text("");
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/koi/mesget?user="+ theName +"&ctype="+ theMes,
            dataType:"json",
            success:function (data) {
                var theList = data;
                for (var i = 0 ; i , theList.length ; i ++){
                    var liMes = "<div id=cont"+ theList[i].c_id  + " class='cateCont_div'> <span class='cateSpan'>" + theList[i].title + " </span> " +
                        "<span class='del_button'><button  class='btn btn-danger' onclick='delCont(" + theList[i].c_id +" )'>删除</button></span>" +
                        " <span class='edit_button'><button  class='btn btn-primary' onclick='editCont( " + theList[i].c_id +"\,"+ contName + ")'>编辑</button></span><hr></div>";
                    $("#cateCont").append(liMes);
                }
            }
        })
    }
    
    function delCont(c_id) {
        var contid = c_id;
        $("#cont"+contid).text("");
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/koi/cateedit?cid="+ contid,
        })
    }
    
    function editCont(c_id,username) {
        var theCid = c_id;
        var name = username;
        var contName = "\'" + name + "\'";
        $.ajax({
            type:"POST",
            url:"http://localhost:8080/koi/editCont?cid="+theCid,
            success:function (data) {
                var theCont = data;
                $("#edit_body").text("");
                var theCont = "<form action='impedit' method='post'>" +
                                    "<input id='contAuthor' name='username' value='" + name + "' style='display: none'>"+
                                     "<input id='code' name='code' value='" +theCont.u_id + "' style='display: none'>"+
                                     "<input id='cid' name='cid' value='" +theCid + "' style='display: none'>"+
                                    "<input name='upSuccess' value='success' style='display: none'>"+
                                    "标题：<input id='title_input' class='form-control' name='title' placeholder='隐约雷鸣 阴霾天空 但盼风雨来 能留你在此' style='width: 40%' required='' autofocus='' value='"+
                                       theCont.title +"' >"+
                                    "分类：<select id='cat_select' name='cate' class='form-control' style='width: 10%'>" +
                    "                        <option  selected  value='随笔'>随笔</option>" +
                    "                        <option  value='影评'>影评</option>" +
                    "                        <option  value='生活'>生活</option>" +
                    "                        <option  value='旅游'>旅游</option>" +
                    "                        <option  value='美食'>美食</option>" +
                    "                        <option  value='科技'>科技</option>" +
                    "                        <option  value='其他'>其他</option>" +
                    "                    </select>"+
                                          '图片链接：<input id="img_input" class="form-control" name="imgUrl" placeholder="言叶" style="width: 60%" value=" ' +theCont.img_url + '">'+
                                            '内容：<textarea id="cont_text" class="form-control" name="content" placeholder="隐约雷鸣 阴霾天空 即使天无雨 我亦留此地" required="" > '+theCont.content +'</textarea>'+
                                            '<button type="submit" class="btn btn-success" style="width: 15%">提交更改</button>'+
                                            '<button style="margin: 0 25px 0 25px" type="button" class="btn btn-primary" style="width: 15%" onclick="editCont('+theCid + '\,' + contName +')">撤销当前修改</button>'+
                                            '<a id="reset_a" class="login_a btn btn-sm" href="http://localhost:8080/koi/gotocenter?user=' + name + '">突然不想修改了？点我去发表新的博客</a>'+
                                "</form>"
                $("#edit_body").append(theCont);
            }
        })
    }
</script>
