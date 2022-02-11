<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>식당 예약</title>
	<style>
		input[type='radio'] {
			display: none;
		}
	</style>
</head>
<body>
<div class="container-fluid pt-4 px-4">
	<div class="row g-4 justify-content-lg-center">
		<%-- Input Form --%>
		<div class="col-sm-12 col-xl-6">
			<div class="bg-light rounded h-100 p-4">
				<h4 class="mb-4 fw-bold">예약 정보</h4>
				<dl class="row mb-0">
					<dt class="col-sm-2">식당명</dt>
					<dd class="col-sm-10" id="restaurantName">${reservationInfo.restaurantName}</dd>
					<dt class="col-sm-2">일정</dt>
					<dd class="col-sm-10"
						id="reservationTime">${reservationInfo.reservationTime}</dd>
					<dt class="col-sm-2">인원</dt>
					<dd class="col-sm-10" id="personnel">${reservationInfo.personnel}</dd>
				</dl>
				<hr class="my-4">
				<h5 class="mb-4 fw-bold">추가 기입 사항</h5>
				<form action='reserve.do' method='post'>
					<input type="hidden" id="restaurantId" name="restaurantId" readonly value="${param.get('restaurantId')}">
					<input type="hidden" id="date" name="date" readonly value="${reservationInfo.reservationTime}">
					<input type="hidden" id="formPersonnel" name="formPersonnel" readonly value="${reservationInfo.personnel}">
					<div class="mb-3">
						<label for="requestContent" class="form-label">요청 사항</label>
						<textarea id="requestContent" class="form-control"
								  placeholder="레스토랑에 전달할 요청사항을 입력해주세요"></textarea>
					</div>
					<%--방문자가 다른 경우--%>
					<div>
						<h2 class="accordion-header text-center" id="flush-headingOne">
							<button id="accordionExpend-Btn" class="btn btn-primary rounded-pill"
									type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
									aria-expanded="true" aria-controls="flush-collapseOne">
								+ 방문자가 다르신가요?
							</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse">
							<div class="mb-3">
								<label for="name" class="form-label">방문자</label>
								<input type="text" class="form-control" id="name" name="name"
									   placeholder="방문자 이름">
							</div>
							<div class="mb-3">
								<label for="tel" class="form-label">방문자 연락처</label>
								<input type="text" class="form-control" id="tel" name="tel"
									   placeholder="숫자만 입력하세요">
							</div>
						</div>
					</div>
					<hr class="my-4">
					<div class="row">
						<div class="col">
							<input class='w-100 btn btn-primary btn' type='submit' value='예약하기'>
						</div>
						<div class="col">
							<button class="w-100 btn btn-secondary"
									onclick='location.href="cMain.do"'>홈으로
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$('#accordionExpend-Btn').on('click', () => {
		let $accordionExpend = $('#accordionExpend-Btn');
		if ($accordionExpend.attr('class').indexOf('collapse') !== -1) {
			$accordionExpend.attr('class', 'btn btn-primary rounded-pill')
		} else {
			$accordionExpend.attr('class', 'btn btn-secondary rounded-pill')
		}
	})
</script>
</body>
</html>