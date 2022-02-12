<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-sm-6 col-xl-6">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-line fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">대기 예약 수</p>
                    <h6 class="mb-0">${fn:length(notApproved)}건</h6>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-6">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-star fa-3x text-primary"></i>
                <div class="ms-3">
                    <div class="pg-bar mb-2">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                 aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
                                 style="width: 10%;"></div>
                        </div>
                    </div>
                    <div class="ms-3">
                        <p class="mb-2">평점</p>
                        <h6 class="mb-0">${ratingAverage}</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
            <div class="col-sm-12 col-xl-6">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Worldwide Sales</h6>
                        <a href="">Show All</a>
                    </div>
                    <canvas id="worldwide-sales"></canvas>
                </div>
            </div>
            <div class="col-sm-12 col-xl-6">
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Salse & Revenue</h6>
                        <a href="">Show All</a>
                    </div>
                    <canvas id="salse-revenue"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid pt-4 px-4">
        <div class="bg-light text-center rounded p-4">
            <div class="d-flex align-items-center justify-content-between mb-4">
                <div class="d-flex align-items-center">
                    <h5 class="mb-0" style="margin: 10px">예약 요청</h5>
                </div>
                <a href="">Show All</a>
            </div>
            <div class="table-responsive">
                <table class="table text-start align-middle table-bordered table-hover mb-0 text-center">
                    <thead>
                    <tr class="text-dark">
                        <th scope="col">날짜</th>
                        <th scope="col">시간</th>
                        <th scope="col">이름</th>
                        <th scope="col">인원</th>
                        <th scope="col">상태</th>
                        <th scope="col">승인여부</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${notApproved}" var="reservation">
                        <tr>
                            <td>${reservation.reservationTime}</td>
                            <td>${reservation.reservationTime}</td>
                            <td>${reservation.alterName}</td>
                            <td>${reservation.personnel}</td>
                            <td>${reservation.status}</td>
                            <td><a class="btn btn-sm btn-primary"
                                   href="acceptReservation.do?reservationId=${reservation.reservationId}">승인</a>
                                <a class="btn btn-sm btn-danger"
                                   href="rejectReservation.do?reservationId=${reservation.reservationId}">거절</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>