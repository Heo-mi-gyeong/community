<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** Spring MVC2 LoginForm **</title>
</head>
<style>
*{border: none; text-align: center; padding: 0px;}
 .home{width:120px; height:40px; text-decoration:none; color:black; background:lavender;   border-radius:10px; margin: 0px 10px;line-height: 40px; } 
.home input {background: transparent; line-height: 40px;}
td{width:310px; text-align: center;}
td input{ width:100%; height:40px; }
input:focus{outline-color:lightPink; }
a,span{ text-decoration: none; color: black;}
div:hover, .home input:hover { color:gray;}
h1{text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
table{margin-left:auto; margin-right:auto;}
td{border:1px solid; border-color:mistyrose; border-radius:5px; }
#container{display: flex; align-items: center; justify-content: center;}
.in{border:0px;}
#p1,#p2{ color: red; font-size: 13px;}
.no{border: none;}
</style>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/axTest01.js"></script>
<script>
$(function(){
	$('#id').focus();
});
</script>
<body>
<h1>로그인</h1>
<br><br>
<form action="login"  method=get>
<table>
<tr>
	<td  class="no"><div class="home" >
<a href="home">Home</a> </div></td>
 	<td  class="no"></td>
</tr>
<tr height=10><td class="no"></td></tr>
<tr height=30>
	<td bgcolor="MistyRose"><label for=id>I D</label></td>
 	<td><input type="text" name=id id=id></td>
</tr>
<tr height=30>
	<td bgcolor="MistyRose"><label for=password>Password</label></td>
	<td><input type="password" name=password id=password></td>
</tr></table><br>
<div id="container">
<div class="home" >
	<input type="submit" value=로그인 id='submit' onclick='return inCheck()'>
</div>
<div class="home" >
	<input type="reset" value="취소" >
</div>
</div>
</form><hr>
   <c:if test="${not empty message}">
   ${message}
   </c:if>

</body>
</html>