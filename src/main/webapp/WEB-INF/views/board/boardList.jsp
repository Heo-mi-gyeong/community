<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용</title>
<style>
h1{text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
a{ text-decoration: none; color: black;}
a:hover { color:gray;}
.in {width:120px; padding:8px; text-decoration:none; color:black; background:lavender;  border-radius:10px; text-align: center; float: right; margin: 2px; }
.ss:hover{ background:GhostWhite ;}
a{ text-decoration: none; color:black;}
</style>
</head>
<body>
<h1><a href="home">게시판</a></h1>
<a href="contentIn" class="in">글쓰기</a><a href="home" class="in">HOME</a>
<c:if test="${not empty message}">
${message}
</c:if>
<br>
<table width="100%" >
	<tr class ="name" bgcolor="lavender" style="border-radius: 5px;">
		<th>번호</th><th>제목</th><th>아이디</th>
		<th>작성 날짜</th><th>조회수</th>
	</tr>
	<c:if test="${not empty info}">
		<c:forEach var="num" items="${info}">
		<tr class="ss">
		<td>${num.seq}</td>
		<td><a href="bdetail?seq=${num.seq}">${num.title}</a></td>
		<td>${num.id}</td>
		<td>${num.regdate}</td>
		<td>${num.cnt}</td>
		</tr>
		</c:forEach>
		</c:if>
	<c:if test="${empty info}">
		<tr><td colspan=7>출력할 데이터가 없습니다.</td></tr>
	</c:if>
	</table><br>
</body>
</html>