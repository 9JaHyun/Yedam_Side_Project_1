<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<style>
  .makeRound {
    padding: .75rem .75rem;
  }

  .yellowIconColor {
    color: #ffd400;
  }

</style>
<!-- main -->
<div class="main">
  <div class="detail">
    <div class="detail-img">
      <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
           class="card-img-top" alt="...">
    </div>
    <br>
    <h3 id="restaurantName">${restaurant.name}</h3>
    <h4>
      ${restaurant.content}
    </h4>
    <div class="row">
      <p class="fs-3"><i class="bi bi-star-fill yellowIconColor"></i>${averageRating}
        (${reviewCount})</p>
      <button type="button" class="btn btn-primary" data-bs-toggle="modal"
              data-bs-target="#reservationModal">예약하기
      </button>

    </div>
    <hr class="my-2">
    <div class="container">
      <div class="row text-center">
        <div class="col text-center fs-5" onclick="">
          홈
        </div>
        <div class="col text-center fs-5" onclick="">
          메뉴
        </div>
        <div class="col text-center fs-5" onclick="">
          사진
        </div>
        <div class="col text-center fs-5" onclick="">
          리뷰
        </div>
      </div>
    </div>
    <hr class="my-2">
    <div class="modal fade" id="reservationModal" tabindex="-1"
         aria-labelledby="exampleModalLabel"
         aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered h-100 p-4">
        <div class="modal-content">
          <div class="modal-body">
            <%--달력--%>
            <div class="h-100 rounded p-4">
              <div id="reservationCalendar"></div>
            </div>
            <hr class="my-2">
            <%--인원--%>
            <div class="h-100 rounded p-4">
              <div class="justify-content-lg-center text-center center">
                <input type="radio" class="btn-check" name="btnradio"
                       id="personnel1" autocomplete="off"
                       checked>
                <label class="btn btn-outline-primary rounded-pill makeRound fs-5"
                       for="personnel1">1명</label>

                <input type="radio" class="btn-check " name="btnradio"
                       id="personnel2" autocomplete="off">
                <label class="btn btn-outline-primary rounded-pill makeRound fs-5"
                       for="personnel2">2명</label>

                <input type="radio" class="btn-check" name="btnradio"
                       id="personnel3" autocomplete="off">
                <label class="btn btn-outline-primary rounded-pill makeRound fs-5"
                       for="personnel3">3명</label>

                <input type="radio" class="btn-check" name="btnradio"
                       id="personnel4" autocomplete="off">
                <label class="btn btn-outline-primary rounded-pill makeRound fs-5"
                       for="personnel4">4명</label>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
              닫기
            </button>
            <button id="sendReservationInfo" type="button" class="btn btn-primary"
                    onclick="location.href=makeURL()">예약
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
