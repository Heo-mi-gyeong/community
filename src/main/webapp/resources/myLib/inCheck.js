// 입력값을 무결성 확인
/**
**  입력값의 무결성 확인
** member 무결성 확인사항
// ID : 길이(4이상), 영문자,숫자 로만 구성
// password : 길이(4이상), 영문,숫자,특수문자로 구성, 특수문자는 반드시 1개 이상 포함할것
// Name : 길이(2이상), 영문 또는 한글로 만 입력
// Level : select 를 이용 (X)
// BirthDay : 입력 여부 확인  ( length == 10 )
// Point : 정수의 범위  ( 숫자이면서, '.'이 없어야함 )
// Weight: 구간 (20 ~ 200)

** 작성 규칙
   => JavaScript function 으로 정의 하고 
      결과를 true or false 로 return
 */
function idCheck(){
	
	var id=$('#id').val(); // id=$(this).val()
		if(id.length<4||id.length>20){
			$('#p1').html(' ID는 4~20자로 적어주세요 ');
			$('#p1').css('color', 'red');
			$('#id').focus();
			return false;
		}else if(id.replace(/[a-z.0-9]/gi,'').length>0){
			$('#p1').html(' ID는 영문자, 숫자로만 작성해주세요 ');
			$('#p1').css('color', 'red');
			$('#id').focus();
			return false;
		}else{
			$('#p1').html(' ID가 정상적으로 입력되었습니다. ');
			$('#p1').css('color', 'CadetBlue ');
			return true;
		};
};

function paCheck(){		
	var password=$('#password').val();
		if ( password.length<4||password.length>16 ) {
			$('#p2').html('비밀번호를 4~16자 로 적어주세요 ');
			$('#p2').css('color', 'red');
			$('#password').focus();
			return false;
		}else if (password.replace(/[a-z.0-9]/gi,'').length<1||password.replace(/[a-z.!-*]/gi,'').length<1||password.replace(/[0-9.!-*]/gi,'').length<1 ) {
			$('#p2').html(' 비밀번호에 영문,숫자,특수문자를<br>1개 이상 포함해주세요');
			$('#p2').css('color', 'red');
			$('#password').focus();
			return false;
		}else {
			$('#p2').html('비밀번호가 정상적으로 입력되었습니다');
			$('#p2').css('color', 'CadetBlue ');
			return true;
		}
};

function pa2Check(){
	var password=$('#password').val();
		var pw=$('#pw').val();
		if ( password!=pw ) {
			$('#p3').html(' 비밀번호가 일치하지 않습니다');
			$('#p3').css('color', 'red');
			return false;
		}else {
			$('#p3').html('비밀번호가 일치합니다');
			$('#p3').css('color', 'CadetBlue ');
			return true;
		}
};

function naCheck(){
	var name = $('#name').val();
		if (name.length<2||name.length>4) {
			$('#p4').html('이름을 2~4자 로 적어주세요. ');
			$('#p4').css('color', 'red');
			$('#name').focus();
			return false;
		}else if (name.replace(/[a-z.가-힣]/gi,'').length > 0) {
			$('#p4').html('이름은 영문,한글만 입력 가능합니다');
			$('#p4').css('color', 'red');
			$('#name').focus();
			return false;
		}else {
			$('#p4').html('이름이 정상적으로 입력되었습니다.');
			$('#p4').css('color', 'CadetBlue ');
			return true;
		} 
};

function biCheck(){
	var birthd = $('#birthd').val();
		if ( birthd.length != 10 ) {
			$('#p5').html(' 생년월일을 정확히 입력해주세요 ');
			$('#p5').css('color', 'red');
			$('#birthd').focus();
			return false;
		}else {
			$('#p5').html('생년월일이 정상적으로 입력되었습니다.');
			$('#p5').css('color', 'CadetBlue ');
			return true;
		}  
};

function poiCheck(){
	var point = $('#point').val();
		if ( point.replace(/[0-9]/gi,'').length>0 ) {
			$('#p6').html(' 포인트는 정수로 작성해 주세요 ');
			$('#p6').css('color', 'red');
			$('#point').focus();
			return false;
		}else if (parseInt(point)<1||parseInt(point)>10000||point.length<1){
			$('#p6').html(' 포인트는 0~10000P로 입력해주세요.');
			$('#p6').css('color', 'red');
			$('#point').focus();
			return false;
		}else {
			$('#p6').html('포인트가 정상적으로 입력되었습니다.');
			$('#p6').css('color', 'CadetBlue ');
			return true;
		} 
};

function weCheck(){
	var weight = $('#weight').val();
		if ( $.isNumeric(weight)==false ) {
			$('#p7').html('몸무게는 실수로 작성해 주세요 ');
			$('#p7').css('color', 'red');
			$('#weight').focus();
			return false;
		}else if ( parseFloat(weight) < 20 || parseFloat(weight) > 200 ) {
			$('#p7').html('몸무게는 20~200kg으로 작성해주세요 ');
			$('#p7').css('color', 'red');
			$('#weight').focus();
			return false;
		}else {
			$('#p7').html('몸무게가 정상적으로 입력되었습니다');
			$('#p7').css('color', 'CadetBlue ');
			return true;
		} 
}