/**
 * AjaxTest 02
	=> 반복문에 이벤트 적용하기
	=> axmlist : Image(File) Download, id 별로 board 조회, 관리자 기능(delete 버튼)
	=> acblist : 상세 글보기
 */

$(function (){
// ** Ajax_MemberList axmlist
	$('#axmlist').click(function(){
		$.ajax({
			type: 'Get',
			url : 'axmlist',
			success:function(resultPage){
				$('#resultArea1').html(resultPage);
			},error:function(){
				$('#resultArea1').html("에러입니당");
				alert('에러니까 잠시 후 다시 시도해주세요');
			}
		});
	});
	
	$('#axblist').click(function(){
		$.ajax({
			type: 'Get',
			url : 'axbList',
			success:function(resultPage){
				$('#resultArea1').html(resultPage);
			},error:function(){
				$('#resultArea1').html("에러입니당");
				alert('에러니까 잠시 후 다시 시도해주세요');
			}
		});
	});
});

// ** 반복문에 이벤트 적용하기 
// => id별로 board조회
// test 1) JS function
function aidBList(id){
	$.ajax({
		type: 'Get',
		url:'aidblist',
		data:{
			id:id//$.trim($(id).val()) 
		},
		success:function(resultPage){
			$('#resultArea2').html(resultPage);
		},error:function(){
			$('#resultArea2').html('불러올 글이 없습니다.');
		}
	});
}