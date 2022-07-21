<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<!-- <link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css"> -->
</head>
<style>
body{display: block; text-align: center; background: snow;}
a, span{ text-decoration: none; color:DimGray ;}
a:hover,span:hover{color:gray; font-size: 1.1em;}
a:active,span:active{ color:white; }
h1{color:lightpink; text-shadow:1px 1px 1px PaleVioletRed  ;}
img{float: ; width:200px; height:200px;}
hr{border: none;
    border-top: 1px solid #E3E7EB;
    overflow: visible; border-color: lightPink;}
</style>
<script src='resources/myLib/jquery-3.2.1.min.js'></script>
<script src='resources/myLib/axTest01.js'></script>
<body>
<h1>
	Hello Spring!  
</h1>
<P>  The time on the server is ${serverTime}. </P>
<hr>
<h3 >
   <c:if test="${not empty LoginId }">
   		<a href="mdetail" >내 정보</a>&nbsp;&nbsp;&nbsp;&nbsp;
   		<a href="mdetail?jcode=U">내 정보 수정</a>&nbsp;&nbsp;&nbsp;&nbsp;
   		<a href="bList">게시판 보기</a>&nbsp;&nbsp;&nbsp;&nbsp;
   		<a href="logout">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;
   		<a href="mdelete">회원탈퇴</a>&nbsp;&nbsp;&nbsp;&nbsp;
   </c:if>
      <c:if test="${empty LoginId }">
   		<a href="loginf">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;
   		<a href="joinf">Join</a>&nbsp;&nbsp;&nbsp;&nbsp;
   </c:if><br>
</h3><hr >
   <c:if test="${not empty message}" >
   <font style="color: salmon; font-weight: bold; font-size: 15pt; background: PapayaWhip ;">${message}</font>
   </c:if>
   <div id='resultArea'></div>
   <br><br>
    <c:if test="${empty LoginId}">
   <font style="font-size: 18pt; font-weight: bold; color:SlateGray ; ">로그인 후 이용해주세요</font>
   </c:if>
   <c:if test="${not empty LoginId}">
   <img src="${uploadfile}"  width="70"  height="100"><br> <br><hr  width="300px">
   <font style="color:DarkSlateGray ; font-weight: bold; font-size: 15pt;">내 아이디 : ${LoginId}</font><br><br>&nbsp;&nbsp;&nbsp;&nbsp;${LoginName} 어린이 반갑습니다
   <br>
   </c:if>
</body>
</html>
