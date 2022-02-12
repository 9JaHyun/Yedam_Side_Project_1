<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    // 파라미터 값 불러오기
    var name = getParameter("name");
    var date = getParameter("date");
    var personnel = getParameter("personnel");

    // input에 파라미터 값 적용
    (function () {
        $("#name").val(name);
        $("#date").val(date);
        $("#personnel").val(personnel);
    })()

    function handleSearchParameterLink(link, restaurantId) {
        const href = link + "?";
        const restaurantIdParm = "restaurantId=" + restaurantId;
        const dateParm = "&date=" + date;
        const personnelParm = "&personnel=" + personnel;
        location.href = href + restaurantIdParm + dateParm + personnelParm;
    }

    function getParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
</script>

<!-- main -->
<div class="main">

    <!-- 검색결과 -->
    <div class="result__search">
        <form action="searchRestaurant.do" method="get" class="search__form">

            <div class="input-group">
                <div class="input-group-text">식당명</div>
                <input name="name" id="name" type="text" placeholder="ex)홍콩반점 동성로점"
                       class="form-control">
            </div>

            <div class="input-group">
                <div class="input-group-text">날짜</div>
                <input name="date" id="date" type="date" class="form-control"/>
            </div>

            <div class="input-group">
                <div class="input-group-text">인원</div>
                <select name="personnel" id="personnel" class="form-select">
                    <option value="">-</option>
                    <option value="2">2명</option>
                    <option value="3">3명</option>
                    <option value="4">4명</option>
                </select>
            </div>

            <input type="submit" value="검색" class="btn btn-primary btn-lg"/>
        </form>
    </div>

    <div class="search-result">
        <!-- 음식점 리스트 -->
        <div class="restaurant-list-container">
            <h4 class="fw-bold">검색결과</h4>
            <div>
                <c:if test="${empty list}">
                    <p>${message}</p>
                </c:if>

                <c:if test="${not empty list}">

                    <c:forEach items="${list}" var="restaurant">
                        <div class="list-card">
                            <a href="#" style="color: black; text-decoration: none;"
                               onclick="handleSearchParameterLink('restaurantDetail.do', ${restaurant.restaurantId})">
                                <div class="img-container">
                                    image
                                </div>
                            </a>
                            <div class="list-card-body">
                                <div>
                                    <a href="#" style="color: black; text-decoration: none;"
                                       onclick="handleSearchParameterLink('restaurantDetail.do', ${restaurant.restaurantId})">
                                        <h5>${restaurant.name}</h5>
                                        <p>${restaurant.content}</p>
                                    </a>
                                </div>
                                <div>
                                    <button class="btn btn-primary"
                                            onclick="handleSearchParameterLink('reserveForm.do' ,${restaurant.restaurantId})">
                                        예약하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </c:if>

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

<%--kakao 지도--%>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18c56f99b45857f82b08e8f126a259f7"></script>
<script>
    var positions = [];

    <c:forEach items="${list}" var="restaurant">
    positions.push(
        {
            content: '<div class="map-mark">' +
                '<div class="map-mark-img"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path fill="#6877ff" d="M221.6 148.7C224.7 161.3 224.8 174.5 222.1 187.2C219.3 199.1 213.6 211.9 205.6 222.1C191.1 238.6 173 249.1 151.1 254.1V472C151.1 482.6 147.8 492.8 140.3 500.3C132.8 507.8 122.6 512 111.1 512C101.4 512 91.22 507.8 83.71 500.3C76.21 492.8 71.1 482.6 71.1 472V254.1C50.96 250.1 31.96 238.9 18.3 222.4C10.19 212.2 4.529 200.3 1.755 187.5C-1.019 174.7-.8315 161.5 2.303 148.8L32.51 12.45C33.36 8.598 35.61 5.197 38.82 2.9C42.02 .602 45.97-.4297 49.89 .0026C53.82 .4302 57.46 2.303 60.1 5.259C62.74 8.214 64.18 12.04 64.16 16V160H81.53L98.62 11.91C99.02 8.635 100.6 5.621 103.1 3.434C105.5 1.248 108.7 .0401 111.1 .0401C115.3 .0401 118.5 1.248 120.9 3.434C123.4 5.621 124.1 8.635 125.4 11.91L142.5 160H159.1V16C159.1 12.07 161.4 8.268 163.1 5.317C166.6 2.366 170.2 .474 174.1 .0026C178-.4262 181.1 .619 185.2 2.936C188.4 5.253 190.6 8.677 191.5 12.55L221.6 148.7zM448 472C448 482.6 443.8 492.8 436.3 500.3C428.8 507.8 418.6 512 408 512C397.4 512 387.2 507.8 379.7 500.3C372.2 492.8 368 482.6 368 472V352H351.2C342.8 352 334.4 350.3 326.6 347.1C318.9 343.8 311.8 339.1 305.8 333.1C299.9 327.1 295.2 320 291.1 312.2C288.8 304.4 287.2 296 287.2 287.6L287.1 173.8C288 136.9 299.1 100.8 319.8 70.28C340.5 39.71 369.8 16.05 404.1 2.339C408.1 .401 414.2-.3202 419.4 .2391C424.6 .7982 429.6 2.62 433.9 5.546C438.2 8.472 441.8 12.41 444.2 17.03C446.7 21.64 447.1 26.78 448 32V472z"/></svg></div>'
                +
                '<a href="restaurantDetail.do?restaurantId=${restaurant.restaurantId}">${restaurant.name}</a></div>',
            latlng: new kakao.maps.LatLng(${restaurant.location}),
        }
    );
    </c:forEach>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: positions[0].latlng, // 지도의 중심좌표
            level: 6 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var customOverlay;
    for (var i = 0; i < positions.length; i++) {
        customOverlay = new kakao.maps.CustomOverlay({
            position: positions[i].latlng,
            content: positions[i].content
        });
        customOverlay.setMap(map);
    }
</script>