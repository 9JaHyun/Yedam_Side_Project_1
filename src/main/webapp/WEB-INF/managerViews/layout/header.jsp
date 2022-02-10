<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Title</title>
</head>
<body>
	<nav
		class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
		<a href="main.do" class="navbar-brand d-flex d-lg-none me-4">
			<h2 class="text-primary mb-0"><i class="fa fa-hashtag">매장이름</i></h2>
		</a> <a href="#" class="sidebar-toggler flex-shrink-0"> 
		<i class="fa fa-bars"></i>
		</a>
		<c:if test="${not empty user.getLoginId()}">
		<div class="navbar-nav align-items-center ms-auto">
			<div class="nav-item dropdown">
				<a href="#" class="nav-link dropdown-toggle"
					data-bs-toggle="dropdown"> <img class="rounded-circle me-lg-2"
					src="asset/manager/img/user.jpg" alt=""
					style="width: 40px; height: 40px;"> <span
					class="d-none d-lg-inline-flex">${user.getLoginId()}</span>
				</a>
				<div
					class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
					<a href="#" class="dropdown-item">내 정보 보기</a> <a href="#"
						class="dropdown-item">설정</a> <a href="#"
						class="dropdown-item">로그아웃</a>
				</div>
			</div>
		</div>
		</c:if>
	</nav>
</body>
</html>
