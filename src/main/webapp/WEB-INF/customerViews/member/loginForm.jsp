<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {
text-decoration: none;
}

</style>
</head>
<body>
	<div align='center'>
		<c:if test="${empty redirectURL}">
		<form id="frm" action="login.do" method="post">
			</c:if>
			<c:if test="${!empty redirectURL}">
			<form id="frm" action="login.do?redirectURL=${redirectURL}" method="post">
				</c:if>
			<div>
				<h1>로그인</h1>
			</div>
			<div class='col-6'>
				아이디<br> <input class='form-control' type='text' id='id'
					name='id' placeholder='ID'>
			</div>
			<div class='col-6'>
				비밀번호<br> <input class='form-control' type='password'
					id='password' name='password' placeholder='Password'>
			</div>
			<div>
				<label><input type='radio' name='author' value='customer'>일반고객</label>
				<label><input type='radio' name='author' value='manager'>점주</label>
			</div>
			<div>
				<input class='btn btn-primary' type='submit' value='로그인'>
			</div>
		</form>
		<div>
			<a href="signupForm.do">회원가입</a>
		</div>
		<br>
		<div>
			<a href="managerSignupForm.do">점주이신가요?</a>
		</div>
	</div>
</body>
</html>