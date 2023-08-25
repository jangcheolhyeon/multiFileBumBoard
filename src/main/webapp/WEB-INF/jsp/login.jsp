<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title></title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=2, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/font.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/layout.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>">
    <script type="text/javascript" src="<c:url value="/js/jquery-1.12.4.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/design.js"/>"></script>
</head>
<body>


<!-- container -->
<div id="login_wrap">
    <div class="login__body">

        <h1 class="logo"><a href="<c:url value="list.do"/>">범일정보</a></h1>
        <div class="login_box">
            <div class="v_txt">
                <h2 class="txt_cover "><span class="move_point"><b>온라인 문의</b></span></h2>
            	 <p class="txt_cover ">㈜범일정보에서 제공하는 온라인 문의 게시판은 고객의 의견을 수렴하는 서비스를 제공하고 있습니다.</p>
            </div>
            <form action="<c:url value="login.do"/>" method="POST" class="login">
                <div class="form__field">
                    <label for="login__username"><i class="fas fa-user"></i><span class="hidden">Username</span></label>
                    <input id="login__username" type="text" name="id" class="form__input" placeholder="Username" required="">
                </div>
                <div class="form__field">
                    <label for="login__password"><i class="fas fa-lock"></i><span class="hidden">Password</span></label>
                    <input id="login__password" type="password" name="password" class="form__input" placeholder="Password" required="">
                </div>
                <div class="form__field">
                    <input type="submit" value="Sign In">
                </div>
            </form>
        </div>

    </div>

        <div class="inner"></div>

</div>


</body>

</html>