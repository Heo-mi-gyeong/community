$(function(){
	$('#axloginf').click(function(){
		$.ajax({
			type:'Get',
			url:'loginf',
			success:function(resultPage){
				$('#resultArea').html(resultPage);
			},
			error:function(){
				$('#resultArea').html('에러입니당');
			}
		});
	});
// => axLogin
//    로그인 성공 or 실패에 따른 다른 처리가 필요함
//    서버로 부터 결과값을 전달받을 필요성 
//    서버의 결과는 Java 의 Data -> JS 가 이를 이용해서 코딩
//    그러므로 Java의 Data를 JS가 인식가능한 Data형식(JSON 포맷)으로 변환 해야함  	

// ** Ajax에서 input Data (Value) 처리방법
// 1) Form 의 serialize()
// => input Tag 의 name 과 id 가 같아야 함.   
// => 직렬화 : multipart 타입은 전송안됨. 
//           처리하지 못하는 값(예-> file Type) 은 스스로 제외시킴 
// => 제외컬럼 지정하기
//    var formData = $('#myForm:not(#rid)').serialize();
//    rid 만 제외시키는 경우 (보류:적용안됨)

// 2) 객체화   
// => 특정 변수 (객체형) 에 담기      
// => 특별한 자료형(fileType: UpLoadFilef) 적용안됨.   

// 3) FormData 객체 활용
// => 모든 자료형의 특성에 맞게 적용가능하여 이미지등의 file 업로드가 가능한 폼데이터 처리 객체
// => IE10부터 부분적으로 지원되며, 크롬이나 사파리, 파이어폭스같은 최신 브라우져에서는 문제 없이 동작
// => 3.1) append 메서드 또는 3.2) 생성자 매개변수 이용

// ** 관련속성   
// = > form Tag
// 		 method : 'Post'
// 		 enctype 속성: 'multipart/form-data', // 생략 가능
// => ajax 속성
//		method : 'Post'
//       enctype: 'multipart/form-data', // form Tag 에서 지정하므로 생략 가능
//       processData:false, // false로 선언시 formData를 string으로 변환하지 않음
//       contentType:false, // false로 선언시 content-type 헤더가 multipart/form-data로 전송되게 함
	$('#axlogin').click(function(){
		$.ajax({
			type:'Post',
			url:'login',
			data:{
				id:$('#id').val(),
				password:$('#password').val()
			},
			success:function(){
				$('#resultArea').html('');
				location.reload();
			},
			error:function(){
				$('#resultArea').html('에러입니당');
			}
		});
	});
	
	$('#axjoinf').click(function(){
		$.ajax({
			type:'Get',
			url:'joinf',
			success:function(resultPage){
				$('#resultArea1').html(resultPage);
			},
			error:function(){
				$('#resultArea1').html('에러입니당');
			}
		});
	});
	
	$('#axjoin').click(function(){
		//** 실습
		// form의 serialize()
		//var formData = $('#myform').serialize();
		
		//객체화
		/*var formData = new FormData();
		formData .append('id',$('#id').val());
		formData .append('password',$('#password').val());
		formData .append('name',$('#name').val());
		formData .append('lev',$('#lev').val());
		formData .append('birthd',$('#birthd').val());
		formData .append('point',$('#point').val());
		formData .append('weight',$('#weight').val());
		formData .append('rid',$('#rid').val());*/
		
		/*if($('#uploadfile')[0].files[0] != null)
		formData.append('uploadfilef',$('#uploadfilef')[0].files[0]);*/
		
		// 생성자
		//var formData = new FormData(document.getElementById('myform'));
		//var formData = new FormData($('#myform')); //->Error 인식 안됨
		var formData = new FormData($('#myform')[0]); // JS의 노드로 인식해야함
		$.ajax({
			type:'Post',
			url:'join',
			processData:false,
			contentType:false,
			data:formData,
			success:function(resultPage){
				$('#resultArea1').html(resultPage);
			},
			error:function(){
				$('#resultArea1').html('에러입니당');
			}
		});
	});
});