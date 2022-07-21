<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style>
*{border: none; margin: 0;}
.data{width:90%; text-align: right; font-size: 14px; margin: 3px 0px;}
h1{text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
#container{width:90%;display: flex; align-items:center; flex-direction: column; justify-content: center; margin: 0 auto; }
#container2{width:100%; display: flex; justify-content: flex-end;}
form{width:100%;}
a{ text-decoration: none; color: black;}
a:hover,.ub:hover { color:gray;}
div{width:100%;}
.list, .ud{ width:110px; padding:6px; background:lavender;  border-radius:10px; margin: 2px;  text-align: center; margin: 5px 0; }
.ud input{background: transparent; font-size: 16px;}
#content{ width:100%; height:300px; background: AliceBlue  ; padding:10px; border: 1px solid; border-color: Silver ; line-height:50px;}
#title{ width:100%; height:50px; font-size: 20px; padding: 10px; font-weight: bold; background: AliceBlue ; border-color: gray ; line-height: 50px; border: 1px solid; border-color: Silver ;}
</style>
</head>
<body>
<h1><a href="home">게시판</a></h1>
<div id="container"><br>
<div id="container2"><div  class="ud"><a href="bList" >게시판 목록</a></div></div>
<hr>
<form action="bInsert" method="post">
<div><input type="text" name=title id=title  placeholder="제목을 입력하세요."></div>
<br>
<div style="position: relative; left: 80%;">작성자 : ${LoginId}</div>
<input type="text"  name=id id=id  value="${LoginId}" style="display: none;">
<hr>
<div><input type="text"  name=content id=content  placeholder="내용을 입력하세요."></div>
<br>
<div id="container2"><div class="ud"><input type="submit" class="ub" value="게시물 등록"></div></div>
</form></div>
</body>
</html>