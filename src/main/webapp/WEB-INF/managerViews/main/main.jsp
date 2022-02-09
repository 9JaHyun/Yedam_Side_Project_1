<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-sm-6 col-xl-3">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-line fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Today Sale</p>
                    <h6 class="mb-0">$1234</h6>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Total Sale</p>
                    <h6 class="mb-0">$1234</h6>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-solid fa-heart fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">즐겨찾기</p>
                    <h6 class="mb-0">$1234</h6>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                <i class="fa fa-star fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">평점</p>
                    <h6 class="mb-0">$1234</h6>
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
                <button class="btn btn-primary" id="check-accept">선택 승인</button>
                <button class="btn btn-danger" id="check-reject">선택 거절</button>
            </div>
            <a href="">Show All</a>
        </div>
        <div class="table-responsive">
            <table class="table text-start align-middle table-bordered table-hover mb-0">
                <thead>
                <tr class="text-dark">
                    <th scope="col"><input class="form-check-input" type="checkbox"
                                           onclick="selectAll(this)"></th>
                    <th scope="col">날짜</th>
                    <th scope="col">시간</th>
                    <th scope="col">이름</th>
                    <th scope="col">인원</th>
                    <th scope="col">상태</th>
                    <th scope="col">승인여부</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="reservation" items="reservations">
                    <tr>
                        <td><input class="form-check-input" type="checkbox" name="chk"></td>
                        <td>#{reservation.}</td>
                        <td>INV-0123</td>
                        <td>Jhon Doe</td>
                        <td>$123</td>
                        <td>Paid</td>
                        <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td><input class="form-check-input" type="checkbox" name="chk"></td>
                    <td>01 Jan 2045</td>
                    <td>INV-0123</td>
                    <td>Jhon Doe</td>
                    <td>$123</td>
                    <td>Paid</td>
                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                </tr>
                <tr>
                    <td><input class="form-check-input" type="checkbox" name="chk"></td>
                    <td>01 Jan 2045</td>
                    <td>INV-0123</td>
                    <td>Jhon Doe</td>
                    <td>$123</td>
                    <td>Paid</td>
                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                </tr>
                <tr>
                    <td><input class="form-check-input" type="checkbox" name="chk"></td>
                    <td>01 Jan 2045</td>
                    <td>INV-0123</td>
                    <td>Jhon Doe</td>
                    <td>$123</td>
                    <td>Paid</td>
                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                </tr>
                <tr>
                    <td><input class="form-check-input" type="checkbox" name="chk"></td>
                    <td>01 Jan 2045</td>
                    <td>INV-0123</td>
                    <td>Jhon Doe</td>
                    <td>$123</td>
                    <td>Paid</td>
                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                </tr>
                <tr>
                    <td><input class="form-check-input" type="checkbox" name="chk"></td>
                    <td>01 Jan 2045</td>
                    <td>INV-0123</td>
                    <td>Jhon Doe</td>
                    <td>$123</td>
                    <td>Paid</td>
                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    function selectAll(selectAll) {
        const checkboxes = document.getElementsByName('chk');
        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
    }
</script>