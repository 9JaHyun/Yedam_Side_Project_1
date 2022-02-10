<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align='center'>
		<form id='frm' action='signup.do' method='post'>
			<div>
				<h1>회원가입</h1>
			</div>
			<div class='col-6'>
				아이디<br> 
				<input class='form-control' type='text' id='loginId' name='loginId' placeholder='ID'>
			</div>
			<div class='form-group'>
				<div class='col-6'>
					비밀번호<br> 
					<input class='form-control' type='password' id='password' name='password' placeholder='Password'>
				</div>
				<div class='col-6'>
					비밀번호 확인<br> 
					<input class='form-control' type='password' id='repeatPassword' placeholder='비밀번호 재확인'>
				</div>
			</div>
			<div class='col-6'>
				이름<br>
				<input class='form-control' type='text' id='memberName' name='memberName' placeholder='이름을 입력하세요'>
			</div>
			<div class='col-6'>
				이메일<br>
				<input class='form-control' type='email' id='email' name='email' placeholder='이메일을 입력하세요'>
			</div>
			<div class='col-6'>
				전화번호<br>
				<input class='form-control' type='text' id='tel' name='tel' placeholder='전화번호를 입력하세요'>
			</div>
			<br>
			<div>
				<input class='btn btn-primary' type='submit' value='회원가입'>
			</div>
		</form>
	</div>
	<script>
	// 회원가입 필수값 입력했는지 체크
	function signupCheck(){
		if($('#idCheckButton').val() != 'YES'){
			alert('아이디 중복체크를 해주세요');
			return false;
		} else if($('#password').val() != $('#repeatPassword').val()){
			alert('비밀번호가 일치하지 않습니다.')
			return false;
		} else if(!$('#memberName').val()){
			alert('이름을 입력해주세요');
			return false;
		} else if(!$('#email').val()){
			alert('이메일을 입력해주세요');
			return false;
		} else if(!$('#tel').val()){
			alert('전화번호를 입력해주세요');
			return false;
		}
		return true;
	}
	// 아이디 중복체크
	function idCheck(){
			console.log($('#loginId').val())
		$.ajax({
			url:'memberIdCheck.do?id=' + $('#loginId').val(),
			type:'get',
			success:function(data){
				if(data == 1){
					alert($('#loginId').val()+' 사용 가능한 아이디입니다.');
					$('#idCheckButton').val('YES');
				} else if(data == 0){
					alert($('#loginId').val()+' 이미 존재하는 아이디입니다.');
					$('#loginId').val('');
					$('#loginId').focus();
				}
			},
			error:function(data){
				console.log(data)
			}
		})
	}
	</script>
</body>
</html>