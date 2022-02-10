<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- main -->
  <div class="main">

    <!-- 검색결과 -->
    <div class="result__search">
      <form action="searchResult.html" class="search__form">

        <div class="input-group">
          <div class="input-group-text">식당명</div>
          <input type="text" placeholder="ex)홍콩반점 동성로점" class="form-control">
        </div>

        <div class="input-group">
          <div class="input-group-text">날짜</div>
          <input type="date" class="form-control" />
        </div>

        <div class="input-group">
          <div class="input-group-text">인원</div>
          <select name="" id="" class="form-select">
            <option value="1">-</option>
            <option value="1">2명</option>
            <option value="1">3명</option>
            <option value="1">4명</option>
          </select>
        </div>

        <input type="submit" value="검색" class="btn btn-primary btn-lg" />
      </form>
    </div>

    <div class="search-result">

      <!-- 음식점 리스트 -->
      <div class="restaurant-list-container">
        <h4 class="fw-bold">검색결과</h4>
        <div>

          <a href="restaurantDetail.html" style="color: black; text-decoration: none;">
            <div class="list-card">
              <div class="img-container">
                image
              </div>
              <div class="list-card-body">
                <div>
                  <h5>한옥집</h5>
                  <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
                <div>
                  <a href="reserveForm.do" class="btn btn-primary">예약하기</a>
                </div>
              </div>
            </div>
          </a>

        </div>

        <!-- pagination -->
        <nav aria-label="Page navigation example" class="list-pagination">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>

      </div>

      <!-- 지도 -->
      <div id="map" class="kakao-map-container">
      </div>
    </div>

  </div>
<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18c56f99b45857f82b08e8f126a259f7"></script>
<script>
  var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
          MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
          OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
          OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
          OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
          OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
          OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
          OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
          SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
          SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
          SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
          SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

  var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
          markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
          overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
          overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
          spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

  var positions = [  // 마커의 위치
            new kakao.maps.LatLng(33.44975, 126.56967),
            new kakao.maps.LatLng(33.450579, 126.56956),
            new kakao.maps.LatLng(33.4506468, 126.5707)
          ],
          selectedMarker = null; // 클릭한 마커를 담을 변수

  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  // 지도 위에 마커를 표시합니다
  for (var i = 0, len = positions.length; i < len; i++) {
    var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
            originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
            overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
            normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
            clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
            overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표

    // 마커를 생성하고 지도위에 표시합니다
    addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
  }

  // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
  function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
            overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
            clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);

    // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
    var marker = new kakao.maps.Marker({
      map: map,
      position: position,
      image: normalImage
    });

    // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
    marker.normalImage = normalImage;

    // 마커에 mouseover 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {

      // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
      // 마커의 이미지를 오버 이미지로 변경합니다
      if (!selectedMarker || selectedMarker !== marker) {
        marker.setImage(overImage);
      }
    });

    // 마커에 mouseout 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseout', function() {

      // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
      // 마커의 이미지를 기본 이미지로 변경합니다
      if (!selectedMarker || selectedMarker !== marker) {
        marker.setImage(normalImage);
      }
    });

    // 마커에 click 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {

      // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
      // 마커의 이미지를 클릭 이미지로 변경합니다
      if (!selectedMarker || selectedMarker !== marker) {

        // 클릭된 마커 객체가 null이 아니면
        // 클릭된 마커의 이미지를 기본 이미지로 변경하고
        !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

        // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
        marker.setImage(clickImage);
      }

      // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
      selectedMarker = marker;
    });
  }

  // MakrerImage 객체를 생성하여 반환하는 함수입니다
  function createMarkerImage(markerSize, offset, spriteOrigin) {
    var markerImage = new kakao.maps.MarkerImage(
            SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
            markerSize, // 마커의 크기
            {
              offset: offset, // 마커 이미지에서의 기준 좌표
              spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
              spriteSize: spriteImageSize // 스프라이트 이미지의 크기
            }
    );

    return markerImage;
  }
</script>