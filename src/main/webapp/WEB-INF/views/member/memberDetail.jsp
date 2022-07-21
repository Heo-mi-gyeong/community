<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
*{margin:auto;}
td{width:300px; border:1px solid; border-color:pink; border-radius:5px; text-align: center;}
a{ text-decoration: none; color: black;}
a:hover { color:gray;}
h1{text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
div {width:600px; }
.home{width:120px; padding:8px; text-decoration:none; color:black; background:lavender;  border-radius:10px; text-align: center; float:left;}
.header {background:mistyrose; }
</style>
</head>
<body><br>
<h1><a href="home">게시판</a></h1><br>
<div><a href="home" class="home">Home</a></div><br><br>
<table>
	<tr height="60"><td class="header">I  D</td><td>${info.id}</td></tr>
	<tr height="60"><td class="header" >Password</td><td>${info.password}</td></tr>
	<tr height="60"><td class="header">Name</td><td>${info.name}</td></tr>
	<tr height="60"><td class="header">Birthday</td><td>${info.birthd}</td></tr>
	<tr height="60"><td class="header">Image</td><td><img src="${info.uploadfile}" width=100 height=120></td></tr>
</table>
<div>
   <c:if test="${not empty message}">
   ${message}<br>
   </c:if>
   </div>
</body>
</html>