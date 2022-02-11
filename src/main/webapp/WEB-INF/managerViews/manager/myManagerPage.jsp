<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid pt-4 px-4">
		<div class="bg-light rounded h-100 p-4">
			<h6 class="mb-4">마이페이지</h6>
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="pills-home-tab"
						data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
						role="tab" aria-controls="pills-home" aria-selected="true">내
						정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-profile-tab"
						data-bs-toggle="pill" data-bs-target="#pills-profile"
						type="button" role="tab" aria-controls="pills-profile"
						aria-selected="false">정보 수정</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-contact-tab"
						data-bs-toggle="pill" data-bs-target="#pills-contact"
						type="button" role="tab" aria-controls="pills-contact"
						aria-selected="false">비밀번호 변경</button>
				</li>
			</ul>
			
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-home"
					role="tabpanel" aria-labelledby="pills-home-tab">
					<div class="bg-light rounded h-100 p-4">
                            <dl class="row mb-0">
                                <dt class="col-sm-4">ID</dt>
                                <dd class="col-sm-8">${loginManager.loginId }</dd>

                                <dt class="col-sm-4">Email</dt>
                                <dd class="col-sm-8">${loginManager.email }</dd>

                                <dt class="col-sm-4">Tel</dt>
                                <dd class="col-sm-8">${loginManager.tel }</dd>
                            </dl>
                        </div>
				</div>
				<div class="tab-pane fade" id="pills-profile" role="tabpanel"
					aria-labelledby="pills-profile-tab">
					<form action="managerUpdate.do" method="post"
						id="updateManagerForm" name="updateManagerForm">
						<div class="bg-light rounded h-100 p-4">
							<h6 class="mb-4">수정정보</h6>

							<div class="form-floating mb-3">
								<input type="test" class="form-control" id="floatingInput"
									readonly="readonly" value="${loginManager.loginId }"> <label
									for="floatingInput">id</label>
							</div>

							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password"
									value="${loginManager.password }"> <label
									for="floatingPassword">password</label>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="password1"
									name="password1" placeholder="Password"> <label
									for="floatingPassword">Refeat password</label>
							</div>
							<!-- floating password -->
							<!-- floating input -->
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="email" name="email"
									placeholder="name@example.com" value="${loginManager.email }">
								<label for="floatingInput">Email address</label>
							</div>
							<div class="form-floating mb-3">
								<input type="test" class="form-control" id="tel" name="tel"
									placeholder="010-0000-0000" value="${loginManager.tel }">
								<label for="floatingInput">Tel</label>
							</div>
							<div class="form-floating mb-3">
								<button type="submit" class="btn btn-outline-primary m-2">정보수정완료</button>
								<button onclick="location.href='main.do'" type="button"
									class="btn btn-outline-secondary m-2">정보수정 취소</button>
							</div>
						</div>
					</form>
				</div>
				<div class="tab-pane fade" id="pills-contact" role="tabpanel"
					aria-labelledby="pills-contact-tab">비밀번호 변경</div>
			</div>
		</div>
	</div>
	</div>
	</div>



	<script>
		function handleUpdatePassword() {
			let pw1 = $("#password").val();
			let pw2 = $("#password1").val();
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