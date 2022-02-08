<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatGO</title>
</head>
<body>
	<!-- main -->
    <div class="main">

        <!-- 검색화면 -->
        <div class="main__search">
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
                    <div class="input-group-text">가게명</div>
                    <input type="text" placeholder="ex)역전우동" class="form-control">
                </div>

                <div class="input-group">
                    <div class="input-group-text">날짜</div>
                    <input type="date" class="form-control"/>
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

                <input type="submit" value="검색" class="btn btn-primary btn-lg"/>
            </form>
        </div>

        <!-- 인기 리스트 -->
        <div class="list-container">
            <h4 class="fw-bold">인기 음식점</h4>
            <div class="grid-4">
                <div class="card">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
                    <div class="card-body">
                        <h5 class="card-title fw-bold">한옥집</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">예약하기</a>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>