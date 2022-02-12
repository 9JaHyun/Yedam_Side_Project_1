<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
select option[value=""][disabled] {
	display: none;
}
</style>
<div class="bg-light rounded h-100 p-4">
	<form action='updateRestaurant.do' method='post'>
	<div class='row mb-3'>
		<div class='input-group col-sm-8'>
			<select id='restaurantId' class='form-control' name='restaurantId' required>
				<option value='' disabled selected>나의 가게 목록</option>
				<c:forEach items='${restaurants}' var='restaurant'>
					<option value='${restaurant.restaurantId}'>${restaurant.name}</option>
				</c:forEach>
			</select>
			<button style='width:150px' type='button' class='btn btn-primary' onclick='selectRestaurantInfo()'>선택</button>
		</div>
	</div>
	<div class="row mb-3">
		<label for="shop" class="col-sm-2 col-form-label">가게 이름</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="shop" name='shop'>
		</div>
	</div>
	<div class="row mb-3">
		<label for="tel" class="col-sm-2 col-form-label">가게 전화번호</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="tel" name='tel'>
		</div>
	</div>
	<div class='row mb-3'>
		<label for='content' class='col-sm-2 col-form-label'>가게 정보</label>
		<div class='col-sm-10'>
			<textarea class='form-control' id='content' name='content' rows="5"></textarea>
		</div>	
	</div>
	<fieldset class="row mb-3">
		<legend class="col-form-label col-sm-2 pt-0">영업시간</legend>
		<div class="col-sm-10">
			<div class='row mb-3'>
				<label for='start-time' class='col-sm-2 col-form-label'>오픈시간</label>
				<input style="width:150px;" class="form-control" type="time" id='start-time' name="startTime">
				&nbsp;
				<label for='end-time' class='col-sm-2 col-form-label'>마감시간</label>
				<input style="width:150px;" class="form-control" type="time" name="endTime" id="end-time">
			</div>
		</div>
	</fieldset>
	<fieldset class="row mb-3">
		<legend class="col-form-label col-sm-2 pt-0">휴식시간</legend>
		<div class="col-sm-10">
			<div class='row mb-3'>
				<label for='break-start-time' class='col-sm-2 col-form-label'>시작</label>
				<input style="width:150px;" class="form-control" type="time" id='break-start-time' name="breakStartTime">
				&nbsp;
				<label for='break-end-time' class='col-sm-2 col-form-label'>종료</label>
				<input style="width:150px;" class="form-control" type="time" id="break-end-time" name="breakEndTime" >
			</div>
		</div>
	</fieldset>
	<button type='submit' class='btn btn-primary' style='width:150px'>수정</button>
	</form>
</div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18c56f99b45857f82b08e8f126a259f7"></script>
	<script>
		// 레스토랑 값 가져오는 기능
		function selectRestaurantInfo(){
			$.ajax({
				url:'selectRestaurantInfo.do',
				type:'get',
				data:{'id':$('#restaurantId').val()},
				dataType:'json',
				contentType:'x-www-urlencoded; charset=utf-8',
				success:function(data){
					$('#shop').val(data.name);
					$('#tel').val(data.tel);
					$('#content').val(data.content);
					$('#start-time').val(data.operationTimeStart);
					$('#end-time').val(data.operationTimeEnd);
					$('#break-start-time').val(data.breakTimeStart);
					$('#break-end-time').val(data.breakTimeEnd);
				},
				error:function(data){
					console.log(data)
				}
			})
		}
	</script>
