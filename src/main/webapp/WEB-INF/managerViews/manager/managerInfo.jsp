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
		<form action="managerUpdate.do" method="post" id="updateManagerForm"
			name="updateManagerForm">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">내 정보</h6>

				<div class="form-floating mb-3">
					<input type="test" class="form-control" id="floatingInput"
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
					<input type="test" class="form-control" id="floatingInput"
						placeholder="010-0000-0000" value="${loginManager.tel }">
					<label for="floatingInput">Tel</label>
				</div>
				<div class="form-floating mb-3">
					<button type="submit" class="btn btn-outline-primary m-2">정보수정
						완료</button>
					<button onclick="location.href='main.do'" type="button"
						class="btn btn-outline-secondary m-2">정보수정 취소</button>
				</div>

			</div>
	</div>

	<script>
		function handleUpdatePassword() {
			let pw1 = $("#newPassword1").val();
			let pw2 = $("#newPassword2").val();
			if (pw1 === pw2) {
				$.ajax({
					url : "managerUpdate.do",
					type : 'post',
					data : {
						"managerId" : $("#managerId").val(),
						"password" : pw1
					},
					success : function(data) {
						if (data === "success") {
							alert('비밀번호 변경 완료되었습니다.');
						} else {
							alert('비밀번호 변경 실패하였습니다.');
						}
					},
					error : function(data) {
						alert("서버 에러입니다. 다시 시도 해주세요");
					}
				});
			} else {
				alert('비밀번호가 일치하지 않습니다.');
			}

		}

		let form = $('#updateManagerForm');
		form.submit(function() {
			$.ajax({
				url : "managerUpdate.do?" + form.serialize(),
				type : 'post',
				contentType : "x-www-form-urlencoded; charset=utf-8",
				success : function(data) {
					if (data === "success") {
						alert('업데이트 완료되었습니다.');
						location.href = 'managerInfo.do';
					} else {
						alert('업데이트 실패하였습니다.');
						location.href = 'managerInfo.do';
					}
				},
				error : function(data) {
					alert("서버 에러입니다. 다시 시도 해주세요");
				}
			});
			return false;
		});
	</script>

	</form>
</body>
</html>