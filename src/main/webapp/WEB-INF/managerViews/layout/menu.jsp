<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-02-07
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="main.do" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>매장이름</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="asset/manager/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Jhon Doe</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="todayReserve.do" class="nav-item nav-link active"><i class="fas fa-chart-bar"></i>예약현황</a>
                    <a href="widget.html" class="nav-item nav-link"><i class="far fa-clipboard"></i>예약기록</a>
                    <a href="form.html" class="nav-item nav-link"><i class="fas fa-cog"></i>영업시간 설정</a>
                    <a href="table.html" class="nav-item nav-link"><i class="fas fa-cog"></i>매장정보 설정</a>
                    <a href="chart.html" class="nav-item nav-link"><i class="fas fa-cog"></i>(.....)</a>
                </div>
            </nav>
        </div>
</body>
</html>
