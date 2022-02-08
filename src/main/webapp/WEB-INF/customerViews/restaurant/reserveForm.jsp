<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type='radio'] {
display:none;
}
</style>
</head>
<body>
	<div align='center'>
		<form id='frm' action='' method='post' onsubmit='submitCheck()'>
			<h1>음식점 이름</h1>
			<div>
				예약인원<br>
				<input class='form-control' type='number' name='people' min='1' max='4' value='1'>
			</div>
			<div>
				예약시간<br> 
				<label class='radio-button btn btn-outline-primary'><input type='radio' name='time' value='07:00'>07:00</label>
				<label class='radio-button btn btn-outline-primary'><input type='radio' name='time' value='08:00'>08:00</label>							
			</div>
			<div>
				전화번호<br> <input class='form-control' type='text'
					id='tel' name='tel'
					placeholder='전화번호를 입력해주세요'>
			</div>
			<div>
				예약자 이름<br> <input class='form-control' type='text'
					id='name' name='name'
					placeholder='이름을 입력해주세요'>
			</div>
			<div>
				요청사항<br>
				<textarea class='form-control' name='area' cols='100' rows='5'></textarea>
			</div>
			<br>
			<input class='btn btn-primary' type='submit' value='예약하기'>
		</form>
	</div>
	<script>
	function submitCheck(){
		console.log(document.forms.frm.people.value)
		console.log(document.forms.frm.time.value)
		console.log(document.forms.frm.tel.value)
	}
	</script>
</body>
</html>