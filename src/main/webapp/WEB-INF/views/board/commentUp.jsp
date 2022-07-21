<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
*{ margin: 0;}
.data{width:90%; text-align: right; font-size: 14px; margin: 3px 0px;}
h1{border: none; text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
#container{width:90%;margin: 0 auto; }
#container2{width:100%; display: flex; align-items:flex-end; justify-content: flex-end;}
#container3{width:100%; display: flex; align-items:flex-start; justify-content: flex-start; }
img{float: left; width:50px; height:50px;}
.vv{display: flex; align-items:flex-start;}
a{ text-decoration: none; color: black;}
a:hover,.ub:hover ,.ud:hover ,.udd:hover { color:gray;} #aa{width:100%;}
.idiv{width:90%;} .clin{float: right;}
.list, .ud{ border: none; width:90px; padding:6px; background:lavender;  border-radius:10px; margin: 2px;  text-align: center; margin: 5px 0; margin-top: 13px;}
#content{ width:100%; height:300px; background: AliceBlue  ; padding:10px; border: 1px solid; border-color: Silver ; line-height:50px;}
#title{ width:100%; height:50px; font-size: 20px; padding: 10px; font-weight: bold; background: AliceBlue ; border-color: gray ; line-height: 50px; border: 1px solid; border-color: Silver ;}
#comment{ border: none; width:100%; height:50px; background: WhiteSmoke ; border-color: lightgray; float: left;} #comment input{width:100%; height:100%;}
#comment:focus{outline-color: DimGray ; background: lightgray;}
.udd{border: none; width:90px; height:30px; padding:6px; background:lavender;  border-radius:10px; margin-right: 2px;  text-align: center; font-size: 13px; line-height: 20px;}
#seq,#writeid{display: none;} 
.mar { margin-top: 13px; } .mar input {padding-left: 5px; margin-left: 10px; margin-top: -15px;}
#seq,#mySeq{display: none;}
</style>
<title>선택한 내용 보기</title>
</head>
<body><br>
<h1><a href="bList">게시판</a></h1>
<div id="container">
	<div id="container2">
		<div  class="ud"><a href="bList">게시판 목록</a>
		</div>
	</div>
	<div  id=title>&nbsp;&nbsp;제목 : ${info.title}</div><br>
	<div class ="data">작성자 : ${info.id} 조회수 : ${info.cnt}</div>
	<div class = "data">작성 날짜 : ${info.regdate} </div><br>
	<div id="content">${info.content}</div>
<br>
	<div id="aa">댓글</div><br>
	<c:if test="${not empty message}">
		${message}<br>
	</c:if>
	<form action="cList">
		<div id="container3">
			<input type="text" id=seq name=seq  value=" ${info.seq}" >
			<input type="text" name=writeid id=writeid value="${info.id}" >
			<div  id=comment>
				<input type="text" id=comment name=comment placeholder="  댓글을 작성하세요.">
			</div>&nbsp;
			<input type="submit" class="ud" value="댓글 등록">
		</div>
	</form>
	<br>
	<c:if test="${not empty comList}">
		<c:forEach var="visit" items="${comList}" varStatus="status">
			<div class="vv">
			<div>
				<img src="${comImg[status.index]}" >
			</div>&nbsp;
			<c:if test="${visit.myId==visit.logId}">
				<div class="idiv">
					<font style="color: pink;">글쓴이 </font>
					<font style="color:gray;">${visit.date}</font>
					<c:if test="${visit.mySeq==mySeq}">
						<form action="cupdate">
							<div class="clin">
								<input type="submit" class="udd" value="댓글 수정">
							</div>
							<br>
							<input type="text" id=seq name=seq value="${visit.seq }">
							<input type="text" id=mySeq name=mySeq value="${visit.mySeq }">
							<div class="mar">&nbsp;
								<input type="text"  name=comment id=comment value="${visit.com}" >
							</div>
						</form>
					</c:if>
				<c:if test="${visit.mySeq!=mySeq}">
				<div class="mar">&nbsp;&nbsp;&nbsp;&nbsp;${visit.com}</div>
				</c:if>
				</div>
			</c:if>
			<c:if test="${visit.myId!=visit.logId}">
				<div class="idiv"><b>ID : ${visit.myId}</b>&nbsp;<font style="color:gray;">${visit.date}</font>
					<c:if test="${visit.mySeq==mySeq}">&nbsp;&nbsp;
						<form action="cupdate">
							<div class="clin">
								<input type="submit" class="udd" value="댓글 수정">
							</div>
							<br>
							<input type="text" id=seq name=seq value="${visit.seq }">
							<input type="text" id=mySeq name=mySeq value="${visit.mySeq }">
							<div class="mar">&nbsp;
								<input type="text"  name=comment id=comment value="${visit.com}" >
							</div>
						</form>
					</c:if>
					<c:if test="${visit.mySeq!=mySeq}">
						<div class="mar">&nbsp;&nbsp;&nbsp;&nbsp;${visit.com}</div>
					</c:if>
				</div>
			</c:if>
			<br>
			</div><br>
			<hr><br>
		</c:forEach>
	</c:if>
		<c:if test="${empty comList}">
			댓글이 없습니다.
		</c:if>
</div>
</body>
</html>