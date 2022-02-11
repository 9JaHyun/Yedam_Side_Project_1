<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-sm-12 col-xl-6">
		<form action="managerUpdate.do" method="post" id="updateManagerForm" name="updateManagerForm">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">내 정보</h6>

				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput"
						readonly="readonly" value="${loginManager.loginId }"> <label
						for="floatingInput">id</label>
				</div>

				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="floatingPassword"
						placeholder="Password" value="${loginManager.password }">
					<label for="floatingPassword">password</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="floatingPassword"
						placeholder="Password"> <label for="floatingPassword">Refeat
						password</label>
				</div>
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput"
						placeholder="name@example.com" value="${loginManager.email }">
					<label for="floatingInput">Email address</label>
				</div>
				<div class="form-floating mb-3">
					<input type="email" class="form-control" id="floatingInput"
						placeholder="010-0000-0000" value="${loginManager.tel }">
					<label for="floatingInput">Tel</label>
				</div>
				<div class="form-floating mb-3">
					<button type="submit" class="btn btn-outline-primary m-2">정보수정
						완료</button>
					<button onclick="location.href='main.do'" type="button" class="btn btn-outline-secondary m-2">정보수정
						취소</button>
				</div>

			</div>
	</div>
	</form>
</body>
</html>