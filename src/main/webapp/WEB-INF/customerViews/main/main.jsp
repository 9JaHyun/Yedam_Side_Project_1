<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>

<!-- main -->
<div class="main">
=======
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!-- main -->
    <div class="main">


        <!-- 검색화면 -->
        <div class="main__search">
            <form action="searchRestaurant.do" method="post" class="search__form">
>>>>>>> d25cb0d (docs : ajax 로그인 필터에 안걸리게 수정)

	<!-- 검색화면 -->
	<div class="main__search">
		<form action="searchRestaurant.do" method="post" class="search__form">

			<div class="input-group">
				<div class="input-group-text">지역</div>
				<select name="area" id="area" class="form-select">
					<option value="1">서울</option>
					<option value="2">대구</option>
					<option value="3">광주</option>
					<option value="4">부산</option>
				</select>
			</div>

			<div class="input-group">
				<div class="input-group-text">식당명</div>
				<input name="name" type="text" placeholder="ex)홍콩반점"
					class="form-control">
			</div>

			<div class="input-group">
				<div class="input-group-text">날짜</div>
				<input name="date" type="date" class="form-control" />
			</div>

			<div class="input-group">
				<div class="input-group-text">인원</div>
				<select name="personnel" id="personnel" class="form-select">
					<option value="all">-</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
				</select>
			</div>

			<input type="submit" value="검색" class="btn btn-primary btn-lg" />
		</form>
	</div>

	<!-- 인기 리스트 -->
	<div class="list-container">
		<h4 class="fw-bold">인기 음식점</h4>
		<div class="grid-4">

			<div class="card">
				<div class="card-img">
					<img
						src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
						class="card-img-top" alt="...">
				</div>
				<div class="card-body">
					<h5 class="card-title fw-bold">
						<a href="restaurantDetail.do"
							style="color: black; text-decoration: none; outline: none;">한옥집</a>
					</h5>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">예약하기</a>
				</div>
			</div>

		</div>
	</div>

</div>