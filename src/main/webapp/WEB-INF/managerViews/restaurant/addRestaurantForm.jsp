<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<form action='addRestaurant.do' method='post'>
			<br>
			<div class='form-group' style='width:300px; margin:auto'>
				<label for='name' class='from-label'>식당이름</label>
				<div class='input-group'>
				<input class='form-control' type='text' id='shop' name='shop' placeholder='상점 이름 입력'>
				<button type="button" class="btn btn-primary" id='search' onclick='findRestaurant()'>검색</button>
				<input type='hidden' id='x-coordinates' name='x-coordinates'>
				<input type='hidden' id='y-coordinates' name='y-coordinates'>
			</div>
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
			<div class='d-flex align-items-center justify-content-center'>
				<div style="margin: 12px;">
					<label for="start-time" class="form-label">영업시간</label>
					<div class="d-flex">
					  	<input class='form-control timepicker' style='width:135px' type='time' id='start-time' name='startTime'>&nbsp;-&nbsp; 
						<input class='form-control timepicker' style='width:135px' type='time' id='end-time' name='endTime'>
					</div>
				</div>
				<div>
					<label for='break-start-time' class='form-label'>휴식시간</label>
					<div class="d-flex">
						<input class='form-control timepicker' style='width:135px'  type='time' id='break-start-time' name='breakStartTime'>&nbsp;-&nbsp;
						<input class='form-control timepicker' style='width:135px'  type='time' id='break-end-time' name='breakEndTime'>
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
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18c56f99b45857f82b08e8f126a259f7"></script>
		<script>
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
			// modal창 열고 닫는 기능	
			function openModal() {
				$('#exampleModal').modal('show');
			}
			function closeModal() {
				$('#exampleModal').modal('hide');
			}
			// 입력값 입력여부 체크
			function addRestaurantCheck(){
				if(!$('#shop')){
					alert('가게이름을 입력해주세요');
					return false;
				} else if(!$('#tel').val()){
					alert('가게 전화번호를 입력해주세요');
					return false;
				} else if(!$('#start-time').val()){
					alert('가게 오픈시간을 입력해주세요');
					return false;
				} else if(!$('#end-time').val()){
					alert('가게 종료시간을 입력해주세요');
					return false;
				}
			}
	</script>
</body>
</html>