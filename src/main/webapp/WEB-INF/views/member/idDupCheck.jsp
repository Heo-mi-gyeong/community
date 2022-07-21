<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
<style>
#check{width:120px; height:30px; text-decoration:none; color:black; background:lavender;  border:none; border-radius:10px; margin: 0px 10px; line-height: 30px;}
.home input {background: transparent;}
#check{float: right;}
.id{width:300px; text-align: center; }
td input{ width:100%; height:40px; }
input:focus{outline-color:lightPink; }
input:hover{ color:gray;}
h3{text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
.id{border:1px solid; border-color:mistyrose; border-radius:5px; }
.in{border:0px;}
p{font-size: 12px; }
#err{color:red; font-size: 14px;}
#ok{color:CadetBlue; font-size: 14px;}
</style>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src='resources/myLib/inCheck.js'></script>
<script type="text/javascript">
//** 사용자가 입력한 id 를 사용가능하도록 해주고, 현재(this)창은 close
//=> this 창의 id 를 부모창의 id 로
//=> 부모창의 ID중복확인 버튼은 disable & submit 은 enable
//=> 부모창의 id 는 수정불가 (readonly) , password 에 focus
//=> 현재(this)창은 close
	function idOk(){
		//opener.document.getElementById('id').value='${newId}';
		//=> <script> 에서 EL은 문자열Type 내부에서 사용 가능함.
		opener.$('#id').val('${newId}');
		//opener.document.getElementById('idDup').disabled='disabled';
		//opener.document.getElementById('submit').disabled='disabled';
		opener.$('#idDup').attr('disabled','disabled');
		opener.$('#submit').attr('disabled',null);
		opener.$('#id').attr('readonly','readonly');
		opener.$('#password').focus();
		
		this.close();
		// ** JQ 방식으로 속성 접근
		   // => attr, prop 비교
		   // => attr()는 HTML의 속성(Attribute), 기능, 입력된 값을 취급 
		   // => prop()는 JavaScript DOM 객체의 프로퍼티(Property), 실제값, property가 가지는 본연의 값
	}

</script>
</head>
<body>
<h3>ID 중복확인</h3>
<form action="idDupCheck" method="get">
	User_ID :
	<input type="text" id='id' name='id'>&nbsp;<br><br>
	<input type="submit" id='check' value='ID 중복확인' onclick='return inCheck()'><br>
	<!-- inCheck.js 의  idCheck() 의 결과에 따라 sumit 결정-->
	<p id='p1' class='eMessage'></p>
</form>
<br><hr>
<div id='msgblock'>
	<c:if test="${idUse=='T' }">
		<span id='ok'>${newId}는 사용가능한 ID입니다</span>
		<input type="button"  id='check'  value="사용하기" onclick="idOk()">
	</c:if>
	<c:if test="${idUse=='F'}">
		<span id='err'>중복되거나 탈퇴한 아이디입니다.<br>
		다시 입력해주세요</span>
		<script>
			$('#id').focus();
			opener.document.getElementById('id').value='';
		</script>
	</c:if>
</div>
</body>
</html>