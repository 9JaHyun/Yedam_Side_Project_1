<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- main -->
  <div class="main">

    <!-- 검색결과 -->
    <div class="result__search">
      <form action="searchResult.html" class="search__form">

        <div class="input-group">
          <div class="input-group-text">지역</div>
          <select name="" id="" class="form-select">
            <option value="1">서울</option>
            <option value="1">대구</option>
            <option value="1">광주</option>
            <option value="1">부산</option>
          </select>
        </div>

        <div class="input-group">
          <div class="input-group-text">이름</div>
          <input type="text" placeholder="짜장면" class="form-control">
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
                  <a href="#" class="btn btn-primary">예약하기</a>
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
      <div class="kakao-map-container">
        지도
      </div>
    </div>

  </div>