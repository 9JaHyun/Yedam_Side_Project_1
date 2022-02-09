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
				아이디<br> <input class='form-control' type='text' id='id'
					name='id' placeholder='ID'>
			</div>
			<div class='form-group'>
				<div class='col-6'>
					비밀번호<br> <input class='form-control' type='password'
						id='password' name='password' placeholder='Password'>
				</div>
				<div class='col-6'>
					비밀번호 확인<br> <input class='form-control' type='password'
						id='repeatPassword' placeholder='비밀번호 재확인'>
				</div>
			</div>
			<div class='col-6'>
				이름<br> <input class='form-control' type='text' id='name'
					name='name' placeholder='이름을 입력하세요'>
			</div>
			<div class='col-6'>
				이메일<br> <input class='form-control' type='email' id='mail'
					name='mail' placeholder='이메일을 입력하세요'>
			</div>
			<div class='col-6'>
				전화번호<br> <input class='form-control' type='text' id='tel'
					name='tel' placeholder='전화번호를 입력하세요'>
			</div>
			<br>
			<!-- Button trigger modal -->
			<div class='col-6'>
				<input class='form-control' type='text' id='shop' name='shop'
					placeholder='상점 이름 입력'>
				<button type="button" class="btn btn-primary" id='search'
					 onclick='findRestaurant()'>검색</button>
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
						<div class="modal-body">
						<div id="map" style="width:100%;height:350px;"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss='modal'
								onclick='closeModal()'>Close</button>
							<button type="button" class="btn btn-primary"
								onclick='relayout()'>Save changes</button>
						</div>
					</div>
				</div>
			</div>

			<div>
				<input class='btn btn-primary' type='submit' value='회원가입'>
			</div>
		</form>
	</div>
<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18c56f99b45857f82b08e8f126a259f7"></script>
	<script>
	var map;
		function findRestaurant() {
			openModal();
			$.ajax({
				url:'https://dapi.kakao.com/v2/local/search/keyword.json?query='
					+ $('#shop').val() + '&category_group_code=FD6',
				type:'GET',
				headers : {'Authorization' : 'KakaoAK 44e6578c2e00f67133b8b2c8c3f2bdc8'},
				success : function(data){
					function sss() {
						drawMap(data.documents[0]).then((value) => relayout())
					}
					setTimeout(() => {
						sss();
					}, 200);
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

			var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,'
					+ data.y + ',' + data.x
					+ '" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,'
					+ data.y + ',' + data.x
					+ '" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나  element가 가능합니다
			iwPosition = new kakao.maps.LatLng(data.y , data.x); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});
			console.log(1111);
		}
		function relayout() {    
		    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		    map.relayout();
		   /*  map.setCenter()
		    map.setLevel() */
		    
		}
		
		function openModal() {
			$('#exampleModal').modal('show');
		}
		function closeModal() {
			$('#exampleModal').modal('hide');
		}
	</script>
</body>
	
</html>