<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
select option[value=""][disabled] {
	display: none;
}
</style>
</head>
<body>
	<div class="bg-light rounded h-100 p-4">
		<form action='addMenu.do' method='post' enctype='multipart/form-data'>
		<div class='row mb-3'>
			<label for='restaurantId' class='col-sm-2 col-form-label'></label>
			<div class='col-sm-10'>
				<select id='restaurantId' class='form-control' name='restaurantId' required>
					<option value='' disabled selected>나의 가게 목록</option>
					<c:forEach items='${list}' var='restaurant'>
						<option value='${restaurant.restaurantId}'>${restaurant.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="row mb-3">
			<label for="shop" class="col-sm-2 col-form-label">메뉴 이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="name" name='name'>
			</div>
		</div>
		<div class="row mb-3">
			<label for="tel" class="col-sm-2 col-form-label">메뉴 가격</label>
			<div class="col-sm-10">
				<input type="number" class="form-control" id="cost" name='cost'>
			</div>
		</div>
		<div class='row mb-3'>
			<label for='content' class='col-sm-2 col-form-label'>메뉴 사진</label>
			<div class='col-sm-10'>
				<input type='file' class='form-control' id='picture' name='picture'>
			</div>	
		</div>
		<button type='submit' class='btn btn-primary' style='width:150px'>추가</button>
		</form>
	</div>
</body>
</html>