<%@ page import="java.util.Arrays" %>
<% int[] ratingInfo = (int[]) request.getAttribute("ratingInfo"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
            <div class="bg-light rounded d-flex align-items-center p-4 justify-content-between">
                <div class="d-flex ">
                    <div>
                        <i class="fa fa-star fa-3x text-primary"></i>
                    </div>
                    <div>
                        <div class="pull-left d-flex">
                            <div class="pull-left" style="width:35px; line-height:1;">
                                <div style="height:9px; margin:5px 0;">★5 <span
                                        class="glyphicon glyphicon-star"></span></div>
                            </div>
                            <div class="pull-left " style="width:180px;">
                                <div class="progress" style="height:9px; margin:8px 0;">
                                    <div class="progress-bar progress-bar-success"
                                         role="progressbar"
                                         aria-valuenow="5" aria-valuemin="0" aria-valuemax="5"
                                         style="width: ${ratingAverageInfo[0]}%">
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right" style="margin-left:10px;">(${ratingInfo[0]})
                            </div>
                        </div>
                        <div class="pull-left d-flex">
                            <div class="pull-left" style="width:35px; line-height:1;">
                                <div style="height:9px; margin:5px 0;">★4 <span
                                        class="glyphicon glyphicon-star"></span></div>
                            </div>
                            <div class="pull-left" style="width:180px;">
                                <div class="progress" style="height:9px; margin:8px 0;">
                                    <div class="progress-bar progress-bar-primary"
                                         role="progressbar"
                                         aria-valuenow="4" aria-valuemin="0" aria-valuemax="5"
                                         style="width: ${ratingAverageInfo[1]}%">
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right" style="margin-left:10px;">(${ratingInfo[1]})
                            </div>
                        </div>
                        <div class="pull-left d-flex">
                            <div class="pull-left" style="width:35px; line-height:1;">
                                <div style="height:9px; margin:5px 0;">★3 <span
                                        class="glyphicon glyphicon-star"></span></div>
                            </div>
                            <div class="pull-left" style="width:180px;">
                                <div class="progress" style="height:9px; margin:8px 0;">
                                    <div class="progress-bar progress-bar-info" role="progressbar"
                                         aria-valuenow="3" aria-valuemin="0" aria-valuemax="5"
                                         style="width: ${ratingAverageInfo[2]}%">
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right" style="margin-left:10px;">(${ratingInfo[2]})
                            </div>
                        </div>
                        <div class="pull-left d-flex">
                            <div class="pull-left" style="width:35px; line-height:1;">
                                <div style="height:9px; margin:5px 0;">★2 <span
                                        class="glyphicon glyphicon-star"></span></div>
                            </div>
                            <div class="pull-left" style="width:180px;">
                                <div class="progress" style="height:9px; margin:8px 0;">
                                    <div class="progress-bar progress-bar-warning"
                                         role="progressbar"
                                         aria-valuenow="2" aria-valuemin="0" aria-valuemax="5"
                                         style="width: ${ratingAverageInfo[3]}%">
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right" style="margin-left:10px;">(${ratingInfo[3]})
                            </div>
                        </div>
                        <div class="pull-left d-flex">
                            <div class="pull-left" style="width:35px; line-height:1;">
                                <div style="height:9px; margin:5px 0;">★1 <span
                                        class="glyphicon glyphicon-star"></span></div>
                            </div>
                            <div class="pull-left" style="width:180px;">
                                <div class="progress" style="height:9px; margin:8px 0;">
                                    <div class="progress-bar progress-bar-danger" role="progressbar"
                                         aria-valuenow="1" aria-valuemin="0" aria-valuemax="5"
                                         style="width: ${ratingAverageInfo[4]}%">
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right" style="margin-left:10px;">(${ratingInfo[4]})
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <p class="mb-2">평점</p>
                    <h6 class="mb-0">${ratingAverage}점</h6>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid pt-4 px-4 ">
    <div class="row g-4 justify-content-center">
        <div class="col-sm-12 col-xl-8">
            <div class="bg-light text-center rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">월간 예약률</h6>
                    <a href="">Show All</a>
                </div>
                <canvas id="reservation-rate"></canvas>
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
                        <input type="text" id="reservationId" hidden readonly
                               value="${reservation.reservationId}">
                        <td>${reservation.reservationTime}</td>
                        <td>${reservation.reservationTime}</td>
                        <td>${reservation.alterName}</td>
                        <td>${reservation.personnel}</td>
                        <td>${reservation.status}</td>
                        <td>
                            <a class="btn btn-sm btn-primary"
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
<script>
</script>
