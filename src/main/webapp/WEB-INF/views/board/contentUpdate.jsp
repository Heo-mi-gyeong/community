<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
*{border: none; margin: 0;}
.data{width:90%; text-align: right; font-size: 14px; margin: 3px 0px;}
h1{text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
#container{width:90%;display: flex; align-items:center; flex-direction: column; justify-content: center; margin: 0 auto; }
#container2{width:100%; display: flex; justify-content: flex-end;}
a{ text-decoration: none; color: black;}
a:hover,.ub:hover { color:gray;}
div{width:100%;}
.list, .ud{ width:110px; padding:6px; background:lavender;  border-radius:10px; margin: 2px;  text-align: center; margin: 5px 0; }
.ud input{background: transparent; font-size: 16px;}
#content{ width:100%; height:300px; background: AliceBlue  ; padding:10px; border: 1px solid; border-color: Silver ; line-height:50px;}
#title{ width:100%; height:50px; font-size: 20px; padding: 10px; font-weight: bold; background: AliceBlue ; border-color: gray ; line-height: 50px; border: 1px solid; border-color: Silver ;}
</style>
<title>선택한 내용 보기</title>
</head>
<body>
<br>
<h1><a href="home">게시판</a></h1>
<form action="bUpdate" method="post">
<div id="container"><br>
<div id="container2"><div  class="ud"><a href="bList" >게시판 목록</a></div></div>
<div><input type="text" name=title id=title value="${info.title}"></div><br>
<div><input name="seq" id="seq" value="${info.seq}"  style="display:none"></div>
<hr>
<div class ="data">작성자 : ${info.id } 조회수 : ${info.cnt}</div>
<div class = "data">작성 날짜 : ${info.regdate} </div><br>
<div><input type="text"  name=content id=content value="${info.content}" ></div>
<br>
<div id="container2"><div class="ud"><input type="submit" value="게시물 수정"></div></div>
</div>
</form>
</body>
</html>