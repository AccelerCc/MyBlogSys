<%--
  Created by IntelliJ IDEA.
  User: accelerccc
  Date: 2019/10/29/0029
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="${ctx}/css/mainPage.css" rel="stylesheet">

    <title>世界</title>
</head>
<style>
    html,body{
        height: 100%;
        font-family: Arial;
    }
    #main_div{
        overflow: hidden;
    }
    .topList{
        overflow: hidden;
        background-color: darkgrey;
        height: 36px;
    }
    .allMes{
        overflow: hidden;
        background-color: dimgray;
        color: white;
        /*height: 36px;*/
        width: 200px;
        display: inline-block;
        line-height: 36px;
        padding: 0px 0px 0px 48px;
        font-weight: bolder;
        /*text-align: center;*/
    }
    .perCenter{
        color: black;
        width: 100px;
        background-color: lightgrey;
        display: inline-block;
        line-height: 36px;
        text-align: center;
    }
    .top_functions{
        position: absolute;
        display: inline-block;
        margin: 8px 40px;
    }
    .perCenter a{
        color: black;
        text-decoration: none;
        font-weight: bolder;
    }
    .perCenter a:hover{
        color: black;
        text-decoration: none;
        font-weight: bolder;
    }
    .top_functions a{
        color: white;
        text-decoration: none;
        font-weight: bold;
    }
    .top_functions a:hover{
        color: white;
        text-decoration: none;
        font-weight: bold;
    }
    .carousel-of-product{
        height: 510px;
        width:1024px;
        margin:0px auto;
    }
    .carouselImage{
        width:1000px;
    }
    .img_background{
        width: 100%;
        height: 470px;
        top: 36px;
        background-color: darkgrey;
        position: absolute;
        z-index: -1;
    }
    .function_list {
        width: 448px;
        position: relative;
        /*top: 36px;*/
        margin: 36px 0 0 0;
        background-color: dimgray;
        display: none;
    }
    .function_list a{
        color: white;
        text-decoration: none;
        font-weight: bold;
    }
    .function_list a:hover{
        color: white;
        text-decoration: none;
        font-weight: bold;
    }
    .fl_div{
        margin: 60px 55px;
        border-bottom: solid white ;
        padding-bottom: 15px;
    }
    #content_div01{
        overflow: hidden;
        display: block;
        /*position: absolute;*/
        top: 55%;
        left: 10%;
        width: 1000px;
        margin:-10px auto;
        border-radius: 15px;
        padding: 10px;
    }
    #content_div02{
        overflow: hidden;
        display: block;
        min-height: auto;
        border-radius: 15px;
        /*background-color: dimgray;*/
        padding: 10px;
        margin: 20px auto;
    }
    #content_div03{
        text-align: center;
        margin: 30px auto;
        color: black;
    }
    .author_img{
        display: inline-block;
        width: 35px;
        height: 35px;
    }
    #author{
        overflow: hidden;
    }
    #author a{
        text-decoration: none;
        color: black;
    }
    #author h4{
        display: inline-block;
    }
    #author a:hover{
        text-decoration: none;
        color: black;
    }
    #divide_div{
        overflow: hidden;
        display: block;
        border-radius: 15px;
        background-color: darkgrey;
        width: 100%;
        padding: 25px;
        margin: 25px auto;
    }
    #nav_div{
        text-align: center;
        width: 100%;
    }
    #all_div{
        top: 1000px;
        overflow: hidden;
    }
    #up_button{
        top: 70%;
        left: 95%;
        position: fixed;
    }
    #up_button a{
        text-decoration: none;
        color: black;
    }
    #up_button a:hover{
        text-decoration: none;
        color: black;
    }
    /*#back_span{*/
    /*    display: inline-block;*/
    /*    text-align: center;*/
    /*    color: white;*/
    /*    right: 3%;*/
    /*}*/
    #back_div{
        height: 36px;
        background-color: lightgrey;
        color: black;
        position: absolute;
        width: 130px;
        display: inline-block;
        right: 100px;
    }
    #back_span{
        margin: 0 0 0 15px;
        line-height: 36px;
        font-weight: bold;
    }
</style>
<body>
<div id="main_div">
    <div id="all_div">
            <div class="topList navbar-fixed-top" >
                <div class="allMes " >
                    <span class="glyphicon glyphicon-th-list" style="margin-left:10px" onclick="toshow()" ></span>
                    <span class="itmes" id="allFunction" >所有功能</span>
                </div>
                <div class="top_functions" >
                    <span style="padding-right: 20px"><a href="#">图集</a> </span>
                    <span style="padding-right: 20px"><a href="#">花</a> </span>
                </div>
                <div id="back_div">
                    <span id="back_span">欢迎回来 , ${userAllMes.id}</span>
                </div>
                <div class="perCenter pull-right" >
                    <span><a href="http://localhost:8080/koi/gotocenter?user=${userAllMes.id}" >个人中心</a></span>
                </div>
            </div>

        <div data-ride="carousel" class="carousel-of-product carousel slide" id="carousel-of-product">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
                <li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
                <li data-slide-to="2" data-target="#carousel-of-product" class=""></li>
                <li data-slide-to="3" data-target="#carousel-of-product" class=""></li>
                <li data-slide-to="4" data-target="#carousel-of-product" class=""></li>
                <li data-slide-to="5" data-target="#carousel-of-product" class=""></li>

            </ol>
            <!-- Wrapper for slides -->
            <div role="listbox" class="carousel-inner">
                <div class="item active">
                    <img src="http://w4.wallls.com/uploads/high-thumbnail/201811/28/220521.jpg" class="carouselImage">
                </div>
                <div class="item">
                    <img src="http://w4.wallls.com/uploads/high-thumbnail/201811/26/220063.jpg" class="carouselImage">
                </div>
                <div class="item">
                    <img src="http://w4.wallls.com/uploads/high-thumbnail/201811/23/219263.jpg" class="carouselImage">
                </div>
                <div class="item">
                    <img src="http://w4.wallls.com/uploads/high-thumbnail/201811/15/217422.jpg" class="carouselImage">
                </div>
                <div class="item">
                    <img src="http://w4.wallls.com/uploads/high-thumbnail/201811/14/217072.jpg" class="carouselImage">
                </div>
                <div class="item">
                    <img src="http://w4.wallls.com/uploads/high-thumbnail/201811/10/216170.jpg" class="carouselImage">
                </div>
            </div>
        </div>

        <div class="img_background" ></div>

        <%--        daohang 02    --%>
        <div class="function_list pull-left navbar-fixed-top" id="function_list_div">
            <div class="fl_div">
                <span><a href="#" >图集</a> </span>
            </div>
            <div class="fl_div">
                <span><a href="#" >文章</a> </span>
            </div>
            <div class="fl_div">
                <span><a href="#" >回忆</a> </span>
            </div>
            <div class="fl_div">
                <span><a href="#" >时光广场</a> </span>
            </div>
        </div>
        <%--            --%>
    </div>

    <div id="content_div01" >
            <div id="content_div02" >
                <c:forEach  items="${Data}"  var="theData" varStatus="i">
                    <div id="divide_div" >
                        <div id="author">
                            <a href="#"><img class="author_img img-circle"  src="${theData.img_url}"></a>
                            <a href="#" target="_blank">
                                <h4 class="author-h2" style="font-weight: bold">
                                        ${theData.author}
                                </h4>
                                <h5 class="pull-right"><span>${theData.new_time}</span></h5>
                                <h3 style="font-weight: bold">${theData.title}</h3>
                            </a>
                        </div>
                        <div id="content_div03">
                            ${theData.content}
                        </div><img src="${theData.img_url}" style="width: 700px">
                        <div></div>
                    </div>
                </c:forEach>
            </div>
    </div>

    <div id="nav_div">
    <nav id="m_nav" >
        <ul class="pagination">
            <li <c:if test="${!page.hasPreviouse}"> class="disabled"</c:if>>
                <a href="?page.start=0" >
                    <span >&laquo;</span>
                </a>
            </li>

            <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">

                <%--                    <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">--%>
                <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                    <a
                            href="?page.start=${status.index*page.count}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>
                <%--                    </c:if>--%>
            </c:forEach>

            <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
                <a href="?page.start=${page.last}" >
                    <span>&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    </div>

<%--    <div class="col-md-3" style="position:relative;top:-3000px;left: 1450px;width: 268px">--%>
<%--        <div style="background-color:white;width: 250px;height: 440px">--%>
<%--            <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=82" width="250" height="440" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="col-md-3" style="position:relative;top:-3000px;left: 1450px;width: 268px">
    <div id="weather-view-he"></div>
    </div>
    <div id="up_button">
        <button class="btn btn-outline-success"><a href="#">返回顶部</a></button>
    </div>

    <div>
        <%@ include file="MainpageFoot.jsp" %>
    </div>
</div>

</body>
</html>

<script type="text/javascript">
   $("#allFunction").mouseenter(function() {
       $("#function_list_div").fadeIn(600);
       $("#function_list_div").css('display','block');
   });
   $("#function_list_div").mouseleave(function() {
       $("#function_list_div").css('display','none');
   });
   $("#function_list_div").mouseenter(function() {
       $("#function_list_div").fadeIn(600);
       $("#function_list_div").css('display','block');
   });
</script>

<script>
    WIDGET = {ID: 'eicU7Hfs4O'};
</script>
<script type="text/javascript" src="https://apip.weatherdt.com/view/static/js/r.js?v=1111"></script>
