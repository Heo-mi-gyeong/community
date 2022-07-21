<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
*{ margin: 0;}
.data{width:100%; text-align: right; font-size: 14px; margin: 3px 0px;}
h1{border: none; text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
#container{width:90%;margin: 0 auto; }
img{float: left; width:50px; height:50px;}
#container2{width:100%; display: flex; align-items:flex-end; justify-content: flex-end;}
#container3{width:100%; display: flex; align-items:flex-start; justify-content: flex-start; }
.vv{display: flex; align-items:flex-start; }
a{ text-decoration: none; color: black;}
a:hover,.ub:hover { color:gray;} #aa{width:100%;} input:hover{color:gray;}
.list, .ud{ border: none; width:90px; padding:6px; background:lavender;  border-radius:10px; margin: 2px;  text-align: center; margin: 5px 0; margin-top: 13px;}
.udd{border: none; width:60px; height:15px; padding:6px; background:lavender;  border-radius:10px; margin: 2px;  text-align: center; float: right; font-size: 13px;}
#content{ width:100%; height:300px; background: AliceBlue  ; padding:10px; border: 1px solid; border-color: Silver ; line-height:50px;}
#title{ width:100%; height:50px; font-size: 20px; padding: 10px; font-weight: bold; background: AliceBlue ; border-color: gray ; line-height: 50px; border: 1px solid; border-color: Silver ;}
#com{ border: none; width:100%; height:50px; background: WhiteSmoke ; border-color: lightgray; float: left;} #comment input{width:100%;}
#com:hover{border-color: DimGray ;}
#seq,#writeid,.non{display: none;}
.mar { margin-top: 13px;}
</style>
<title>선택한 내용 보기</title>
</head>
<body><br>
<h1><a href="home">게시판</a></h1>
<div id="container">
	<div id="container2"><div  class="ud"><a href="bList">게시판 목록</a></div></div>
	<div  id=title>&nbsp;&nbsp;제목 : ${info.title}</div><br>
	<div class ="data">작성자 : ${info.id} 조회수 : ${info.cnt}</div>
	<div class = "data">작성 날짜 : ${info.regdate} </div><br>
	<div id="content">${info.content}</div>
	<c:if test="${LoginId==info.id}">
		<div id="container2">
			<div class="ud"><a href="contentUp?seq=${info.seq}" >수정</a></div>
			&nbsp;&nbsp;
			<div class="ud"><a href="delete?seq=${info.seq}">삭제</a></div>
		</div>
	</c:if><br>
	<div id="aa">댓글</div><br>
	<c:if test="${not empty message}">
		${message}<br>
	</c:if>
	<form action="cList">
		<div id="container3">
			<input type="text" id=seq name=seq  value=" ${info.seq}" >
			<input type="text" name=myid id=myid class="non" value="${info.id}" >
			<div  id=com>
				<input type="text" id=com name=com placeholder="  댓글을 작성하세요.">
			</div>
			&nbsp;&nbsp;
			<input type="submit" class="ud" value="댓글 등록">
		</div>
	</form>
	<br>
	<c:if test="${not empty comList}">
	<c:forEach var="visit" items="${comList}"  varStatus="status">
		<div class="vv">
			<div><img src="${comImg[status.index]}" ></div>&nbsp;
			<c:if test="${visit.myId==visit.logId}">
				<div><font style="color: pink;">글쓴이 </font><font style="color:gray;">${visit.date}</font>
					<c:if test="${visit.myId==LoginId}">
						<div class="udd" >
							<form action="bdetail3">
								<input type="text" id=seq name=seq class="non" value="${visit.seq }">
								<input type="text" id=mySeq name=mySeq class="non" value="${visit.mySeq }">
								<input type="submit" value="수정" class="udd" style="line-height: 3px;">
							</form>
						</div>
						&nbsp;&nbsp;
						<div class="udd">
							<a href="cdelete?myseq=${visit.mySeq}&seq=${info.seq}">삭제</a>
						</div>
						<br>
					</c:if>
					<div class="mar">&nbsp;&nbsp;&nbsp;&nbsp;${visit.com}</div>
				</div>
			</c:if>
			<c:if test="${visit.myId!=visit.logId}">
				<div><b>ID : ${visit.myId}</b>&nbsp;<font style="color:gray;">${visit.date}</font>
			<c:if test="${visit.myId==LoginId}">
			<div class="udd" >
				<form action="bdetail3">
					<input type="text" id=seq name=seq class="non" value="${visit.seq }">
					<input type="text" id=mySeq name=mySeq class="non" value="${visit.mySeq }">
					<input type="submit" value="수정" class="udd" style="line-height: 4px;" >
				</form>
			</div>
			&nbsp;&nbsp;
			<div class="udd">
				<a href="cdelete?myseq=${visit.mySeq}&seq=${info.seq}">삭제</a>
			</div><br>
			</c:if>
			<div class="mar">&nbsp;&nbsp;&nbsp;&nbsp;${visit.com}</div></div>
			</c:if>
			<br>
		</div>
		<br><hr><br>
	</c:forEach>
	</c:if>
	<c:if test="${empty comList}">
		댓글이 없습니다.
	</c:if>
</div>

</body>
</html>