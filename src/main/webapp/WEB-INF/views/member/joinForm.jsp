<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring MVC join</title>
<style>
*{border: none; text-align: center; padding: 0px;}
.home{width:120px; height:40px; text-decoration:none; color:black; background:lavender;  border-radius:10px; margin: 0px 10px; line-height: 40px;}
.home input, #idDup {background: transparent;}
#idDup:hover{color:red;}
td{width:300px; text-align: center;}
td input{ width:100%; height:40px; }
input:focus{outline-color:lightPink; }
a{ text-decoration: none; color: black;}
.home input:hover{ color:gray;}
h1{text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
table{margin-left:auto; margin-right:auto;}
td{border:1px solid; border-color:mistyrose; border-radius:5px; }
#container{display: flex; align-items: center; justify-content: center;}
.no{border: none;}
.in{border:0px;}
p{font-size: 12px; }
#p1,#p2,#p3,#p4,#p5,#p6,#p7{color:red;}
</style>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src='resources/myLib/inCheck.js'></script>
<script src='resources/myLib/axTest01.js'></script>
<script>

var iCheck=false;
var pCheck=false;
var ppCheck=false;
var nCheck=false;
var bCheck=false;

function load(){
	
	$('#id').focus();
	
	$('#id').keyup(function(e){
		iCheck=idCheck();
		if (e.which==13) {
			e.preventDefault();
			// => form 에 submit 이 있는경우
			// => enter 누르면 자동 submit 발생되므로 이를 제거함
			$('#password').focus();
		}
	}).focusout(function(){
		iCheck=idCheck();
	});
	
	$('#password').keyup(function(e){
		pCheck=paCheck();
		if (e.which==13) {
			e.preventDefault();
			$('#pw').focus();
		}
	}).focusout(function(){
		pCheck=paCheck();
		
	});
	
	$('#pw').keyup(function(e){
		ppCheck=pa2Check();
		if (e.which==13) {
			e.preventDefault();
			$('#name').focus();
		}
	}).focusout(function(){
		ppCheck=pa2Check();
	});
	
	$('#name').keyup(function(e){
		nCheck=naCheck();
		if (e.which==13) {
			e.preventDefault();
			$('#birthd').focus();
		}
	}).focusout(function(){
		nCheck=naCheck();
	});
	
	$('#birthd').keydown(function(e){
		bCheck=biCheck();
		if (e.which==13) {
			e.preventDefault();
			$('#point').focus();
		}
	}).focusout(function(){
		bCheck=biCheck();
	});

}
function inCheck() {
	// 모든 항목에 오류 없음을 확인 : switch 변수
	if ( iCheck==false ) { $('#p1').html(' id 를 확인 하세요 '); }
	if ( pCheck==false ) { $('#p2').html(' password 를 확인 하세요 '); }
	if ( ppCheck==false ) { $('#p3').html(' password2 를 확인 하세요 '); }
	if ( nCheck==false ) { $('#p4').html(' name 을 확인 하세요 '); }
	if ( bCheck==false ) { $('#p5').html(' birthday 를 확인 하세요 '); }
	
	// => 오류 없으면 submit 진행 : return true
	// => 오류 있으면 submit 중지 : return false	
	if ( iCheck && pCheck && ppCheck && 
		 nCheck && bCheck) {
		// => submit 확인
		if ( confirm(" 정말 가입 하시겠습니까 ? (Yes:확인 / No:취소)")==false ) {
			  alert(' 가입이 취소 되었습니다');
			  return false; 
		}else return true; // submit 진행 -> 404
	}else return false;
	
}

function idDupCheck(){
	if(iCheck==false) iCheck=idCheck();
	else{
		var url = 'idDupCheck?id='+$('#id').val();
		window.open(url,'_blank','toolbar=no,menubar=yes, scrollbar=yes,realizable=yes,width=400,height=300');
	}
};

</script>
</head>
<body onload="load()">
<!--  ** FileUpLoad Form **
=> form 과 table Tag 사용시 주의사항 : form 내부에 table 사용해야함
   -> form 단위작업시 인식안됨
   -> JQ 의 serialize, FormData 의 append all 등 
   
=> method="post" : 255 byte 이상 대용량 전송 가능 하므로 
=> enctype="multipart/form-data" : 화일 upload 를 가능하게 해줌 
   ** multipart/form-data는 파일업로드가 있는 입력양식요소에 사용되는 enctype 속성의 값중 하나이고, 
       multipart는 폼데이터가 여러 부분으로 나뉘어 서버로 전송되는 것을 의미
       이 폼이 제출될 때 이 형식을 서버에 알려주며, 
       multipart/form-data로 지정이 되어 있어야 서버에서 정상적으로 데이터를 처리할 수 있다.     
   -->
<h1>회원가입</h1>
<form action="join" method="post" id='myform' enctype="multipart/form-data">
<table>
<tr>
	<td  class="no"><div class="home" >
<a href="home">Home</a> </div></td>
 	<td  class="no"></td>
</tr>
<tr height=10><td class="no"></td></tr>
<tr height=40>
	<td bgcolor="MistyRose"><label for=id>I D</label></td>
 	<td><input type="text" name=id id=id></td>
 	<td class='in'><p id="p1"></p></td>
</tr>

<tr height=40>
 	<td class='in'  bgcolor="lavender"><button type="button" id="idDup" onclick="idDupCheck()">ID 중복확인(필수)</button></td>
 	<td class='in'><p id="p1" class="eMessage"></p></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=password>Password</label></td>
	<td><input type="password" name=password id=password></td>
	<td class='in'><p id="p2"></p></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=pw>Password 확인</label></td>
	<td><input type="password" name=pw id=pw></td>
	<td class='in'><p id="p3"></p></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=name>Name</label></td>
	<td><input type="text"  name=name id=name size="20"></td>
	<td class='in'><p id="p4"></p></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=lev>Level</label></td>
	<td>
	<select name=lev id=lev>
		<option value="A">관리자</option>
		<option value="B">나무</option>
		<option value="C">잎새</option>
		<option value="D">새싹</option>
	</select>
	</td>
	<td class='in'><p id="p8"></p></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=birthd>Birthday</label></td>
	<td><input type="date" name=birthd id=birthd></td>
	<td class='in'><p id="p5"></p></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=point>Point</label></td>
	<td><input type="text" name=point id=point></td>
	<td class='in'><p id="p6"></p></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=weight>Weight</label></td>
	<td><input type="text" name=weight id=weight></td>
	<td class='in'><p id="p7"></p></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=uploadfilef>Image</label></td>
	<td><img src="" class="select_img"><br>
	<input type="file" name=uploadfilef id=uploadfilef>
	<script>
	// 해당 파일의 서버상의 경로를 src로 지정하는것으로는 클라이언트 영역에서 이미지는 표시될수 없기 때문에
    // 이를 해결하기 위해 FileReader이라는 Web API를 사용
    // => 이 를 통해 url data를 얻을 수 있음.
    //    ( https://developer.mozilla.org/ko/docs/Web/API/FileReader)
    // ** FileReader
    // => 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는File
    //    혹은 Blob 객체를 이용해 파일의 내용을(혹은 raw data버퍼로) 읽고 
    //    사용자의 컴퓨터에 저장하는 것을 가능하게 해줌.   
    // => FileReader.onload 이벤트의 핸들러.
    //    읽기 동작이 성공적으로 완료 되었을 때마다 발생.
    // => e.target : 이벤트를 유발시킨 DOM 객체
    // => type='file' 은 복수개의 파일을 업로드 할 수 있도록 설계뙴
    // 그러므로 files[] 배열 형태의 속성을 가짐
      
       $('#uploadfilef').change(function(){
          if(this.files && this.files[0]) {
             var reader = new FileReader;
                 reader.onload = function(e) {
                 $(".select_img").attr("src", e.target.result)
                    .width(100).height(100); 
                 } // onload_function
                 reader.readAsDataURL(this.files[0]);
           } // if
       }); // change
	</script>
	</td>
</tr>	</table><br>
<div id="container">
<div class="home" >
<input type="submit" value="회원가입" onclick="return inCheck()">
</div>
<div class="home" >
	<input type="reset" value="취소" >
</div>
</div>
</form><br>
<c:if test="${not empty message}">
${message}<br>
</c:if>
</body>
</html>