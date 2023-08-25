<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/login.do"/>" method="POST">
		<span>id</span> <input type="text" name="id"/>
		<span>pwd</span> <input type="password" name="password" />
		<button>로그인</button>	
	</form>
</body>
</html>