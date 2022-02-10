<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<form action='addRestaurant' method='post' >
			<br>
			<div class='form-group' style='width:300px; margin:auto'>
				<label for='name' class='from-label'>식당이름</label>
				<input class='form-control' id='name' name='name'>
			</div>
			<br>
			<div class='form-group' style='width:300px; margin:auto'>
				<label for='tel' class='form-label'>식당전화번호</label>
				<input class='form-control' id='tel' name='tel1' >
			</div>
			<br>
			<div class='form-group' style='width:300px; margin:auto'>
				<label for='content' class='form-label'>매장소개</label>
				<textarea class='form-control' rows='5' id='content' name='content'></textarea>
			</div>
			<br>
			<div class='form-group' style='width:300px; margin:auto'>
			<label for='shop' class='form-label'>식당 정보</label>
			<div class='input-group'>
				<input class='form-control' type='text' id='shop' name='shop' placeholder='상점 이름 입력'>
				<button type="button" class="btn btn-primary" id='search' onclick='findRestaurant()'>검색</button>
			</div>
			</div>
			<br>
			<div class='d-flex align-items-center justify-content-center'>
				<div style="margin: 12px;">
					<label for="start-time" class="form-label">영업시간</label>
					<div class="d-flex">
					  	<input class='form-control' style='width:100px' type='time' id='start-time' name='start-time'> ~ 
						<input class='form-control' style='width:100px' type='time' id='end-time' name='end-time'>
					</div>
				</div>
				<div>
					<label for='break-start-time' class='form-label'>휴식시간</label>
					<div class="d-flex">
						<input class='form-control' style='width:100px'  type='time' id='break-start-time' name='break-start-time'> ~ 
						<input class='form-control' style='width:100px'  type='time' id='break-end-time' name='break-end-time'>
					</div>
				</div>
			</div>
			
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
						<div class="modal-body">
						<div id="map" style="width:100%;height:350px;"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss='modal'
								onclick='closeModal()'>취소</button>
								<button type="button" class="btn btn-primary" data-bs-dismiss='modal'
								onclick='closeModal()'>확인</button>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div align='center'>
				<button type='submit' class='btn btn-primary' style='width:300px; margin:auto'>추가</button>
			</div>
		</form>

</body>
</html>