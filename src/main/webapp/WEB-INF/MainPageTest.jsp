<%--
  Created by IntelliJ IDEA.
  User: accelerccc
  Date: 2019/10/31/0031
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<%--    <link rel="stylesheet" href="${ctx}/css/mainPage.css">--%>

    <title>世界</title>
</head>
<style>
    body{
        height: 100%;
    }
    .allFunction{
        display: inline-block;
    }
    .top_functions{
        display: inline-block;
    }
    .perCenter{
        display: inline-block;
    }
    .carousel-of-product{
        height: 510px;
        width:1024px;
        margin:0 auto;
    }
    .carouselImage{
        width:1000px;
    }
    #head{
        overflow: hidden;
    }
    .function_list{
        width: 448px;
        position: absolute;
        top: 36px;
        background-color: dimgray;
        display: none;
    }

    #content_div01{
        overflow: hidden;
        display: block;
        /*position: absolute;*/
        top: 58%;
        left: 10%;
        width: 1000px;
        margin:0 auto;
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
</style>
<body>
    <div id="contain_All" style="background-color: chocolate">
        <div id="head">
            <div class="allFunction" >
                <span class="glyphicon glyphicon-th-list" style="margin-left:10px" onclick="toshow()" ></span>
                <span class="itmes" id="allFunction" >所有功能</span>
            </div>
            <div class="top_functions" >
                <span style="padding-right: 20px"><a href="#">图集</a> </span>
                <span style="padding-right: 20px"><a href="#">花</a> </span>
            </div>
            <div class="perCenter pull-right" >
                <span><a href="#" >个人中心</a></span>
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
        <div class="function_list pull-left" id="function_list_div">
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
        <div id="content_div01" style="background-color: chocolate">
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
    </div>
    <%@ include file="MainpageFoot.jsp" %>
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
