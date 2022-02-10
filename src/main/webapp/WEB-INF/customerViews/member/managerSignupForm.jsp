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
		<form id='frm' action='managerSignup.do' method='post' style='width: 300px' onsubmit='return inputCheck()'>
			<div>
				<h1>점주 회원가입</h1>
			</div>
			<div>
				아이디<br>
				<div class='input-group'>
				<input class='form-control' type='text' id='login_id' name='login_id' placeholder='ID' required='required'>
				<button class='btn btn-primary' type='button' id='idKey' onclick='managerIdCheck()' value='NO'>중복검사</button>
				</div>
			</div>
			<br>
				<div>
					비밀번호<br> <input class='form-control' type='password'
						id='password' name='password' placeholder='Password' required='required'>
				</div>
				<br>
				<div>
					비밀번호 확인<br> <input class='form-control' type='password'
						id='repeatPassword' placeholder='비밀번호 재확인' >
				</div>
			<br>
			<div>
				이메일<br> <input class='form-control' type='email' id='email'
					name='email' required='required' placeholder='이메일을 입력하세요'>
			</div>
			<br>
			<div>
				전화번호<br> <input class='form-control' type='text' id='tel'
					name='tel' required='required' placeholder='전화번호를 입력하세요'>
			</div>
			<input type='hidden' id='x-coordinates' name='x-coordinates'>
			<input type='hidden' id='y-coordinates' name='y-coordinates'>
			<br>
			<!-- Button trigger modal -->
			<div class='input-group'>
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
								onclick='closeModal()'>취소</button>
								<button type="button" class="btn btn-primary" data-bs-dismiss='modal'
								onclick='closeModal()'>확인</button>
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
		// modal에 지도 그리는 기능
		function findRestaurant() {
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
		// 아이디 중복검사
		function managerIdCheck(){
			$.ajax({
				url : 'managerIdCheck.do',
				type : 'get',
				data : {
					id : $('#login_id').val()
				},
				contentType : 'x-www-urlencoded; charset=utf-8',
				success : function(data) {
					if (data == '1') {
						alert($('#login_id').val() + "\n 사용할 수 있는 아이디입니다.");
						$('#idKey').val('YES');
					} else {
						alert($('#login_id').val() + "\n 이미 존재하는 아이디입니다.")
						$('#login_id').val("");
						S('#login_id').focus();
					}
				},
				error : function(err) {
					console.log(err);
				}
			})
		}
		// 입력값 입력여부 확인
		function inputCheck(){
			if($('#idKey').val() != 'YES'){
				alert('아이디 중복검사를 해주세요')
				return false;
			}
			if($('#password').val() != $('#repeatPassword').val()){
				alert('비밀번호 확인이 일치하지 않습니다.');
				return false;
			}
			if(!$('#x-coordinates').val()){
				alert('확인된 점포가 없습니다.')
				return false;
			}
			return true;
		}
	</script>
</body>
	
</html>