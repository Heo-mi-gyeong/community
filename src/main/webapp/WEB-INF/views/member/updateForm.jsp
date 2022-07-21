<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
*{border: none; text-align: center; padding: 0px;}
.home{width:120px; height:40px; text-decoration:none; color:black; background:lavender;  border-radius:10px; margin: 0px 10px; line-height: 40px;}
.home input {background: transparent;}
td{width:300px; text-align: center;}
a{ text-decoration: none; color: black;}
div:hover { color:gray;}
h1{text-align: center; height:70px; border: 2px solid; border-color: lavender; line-height: 70px;}
table{margin-left:auto; margin-right:auto;}
td{border:1px solid; border-color:mistyrose; border-radius:5px; }
#container{display: flex; align-items: center; justify-content: center;}
</style>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<body>
<h1>회원정보 수정</h1>
<form action="mupdate" method="post" enctype="multipart/form-data">
<table>
<tr height=40>
	<td bgcolor="MistyRose"><label for=id>I D</label></td>
 	<td><input type="text" name=id id=id value="${info.id}" readonly></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=password>Password</label></td>
	<td><input type="password" name=password id=password value="${info.password}"></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=name>Name</label></td>
	<td><input type="text"  name=name id=name size="20" value="${info.name}"></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=birthd>Birthday</label></td>
	<td><input type="date" name=birthd id=birthd value="${info.birthd}"></td>
</tr>
<tr height=40>
	<td bgcolor="MistyRose "><label for=uploadfilef>Image</label></td>
	<td><img src="${info.uploadfile}" class="select_img" width=100 height=100>
	<input type="hidden" name="uploadfile"  value="${info.uploadfile}" ><br>
	<input type="file" name=uploadfilef  id=uploadfilef >
	<script>
       $('#uploadfilef').change(function(){
          if(this.files && this.files[0]) {
             var reader = new FileReader;
                 reader.onload = function(e) {
                 $(".select_img").attr("src", e.target.result)
                 //$("#upload").attr("value", e.target.result)
                    .width(100).height(100); 
                 } // onload_function
                 reader.readAsDataURL(this.files[0]);
           } // if
       }); // change
	</script>
	</td>
</tr>	</table>	<br>

<div id="container">
<div class="home" >
<a href="home">Home</a> 
</div>
<div class="home" >
<input type="submit" value="회원정보 수정" >
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