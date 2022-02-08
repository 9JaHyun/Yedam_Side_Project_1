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
				<h1>점주 회원가입</h1>
			</div>
			<div class='col-6'>
				아이디<br> 
				<input class='form-control' type='text' id='id' name='id' placeholder='ID'>
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
				<input class='form-control' type='text' id='name' name='name' placeholder='이름을 입력하세요'>
			</div>
			<div class='col-6'>
				이메일<br>
				<input class='form-control' type='email' id='mail' name='mail' placeholder='이메일을 입력하세요'>
			</div>
			<div class='col-6'>
				전화번호<br>
				<input class='form-control' type='text' id='tel' name='tel' placeholder='전화번호를 입력하세요'>
			</div>
			<br>
			<!-- Button trigger modal -->
			<div>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#exampleModal">Launch demo modal</button>
			</div>
			<br>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-bs-toggle='modal'>Save
								changes</button>
						</div>
					</div>
				</div>
			</div>

			<div>
				<input class='btn btn-primary' type='submit' value='회원가입'>
			</div>
		</form>
	</div>
</body>
</html>