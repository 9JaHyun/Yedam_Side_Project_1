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
	
		// modal에 지도 그리는 기능
		function findRestaurant() {
			if(!$('#shop').val()){
				alert('상점이름을 입력해주세요');
				return;
			}
			openModal()
			$.ajax({
				url:'https://dapi.kakao.com/v2/local/search/keyword.json?query='
					+ $('#shop').val() + '&category_group_code=FD6',
				type:'GET',
				headers : {'Authorization' : 'KakaoAK 44e6578c2e00f67133b8b2c8c3f2bdc8'},
				success : function(data){
					if(data.documents.length == 1){
						$('.modal-body').text('')
						$('.modal-body').append($('<div>').attr('id','map').css({'width':'100%','height':'350px'}))
						$('#map').text('')
						setTimeout(() => {
							drawMap(data.documents[0]).then((value) => relayout())
						}, 200);
						$('#x-coordinates').val(data.documents[0].x)
						$('#y-coordinates').val(data.documents[0].y)
					} else {
						$('.modal-body').text('검색 결과 값이 없거나 너무 많습니다.')
					}
				},
				error: function(data){
					console.log(data)
				}
			})
		}
		
		async function drawMap(data){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(data.y , data.x), // 지도의 중심좌표
				level : 3 // 지도의 확대 레벨
			};
		
			map = new kakao.maps.Map(mapContainer,mapOption);
			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(data.y , data.x);
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({position : markerPosition});
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		
			var iwContent = '<div style="padding:5px;">'+data.place_name+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나  element가 가능합니다
			iwPosition = new kakao.maps.LatLng(data.y , data.x); //인포윈도우 표시 위치입니다
		
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});
			infowindow.open(map, marker); 
		}
		function relayout() {    
		    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		    map.relayout();
		   /*  map.setCenter()
		    map.setLevel() */
		    
		}
	</script>
