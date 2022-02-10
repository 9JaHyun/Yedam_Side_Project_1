<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
    <a href="main.do" class="navbar-brand d-flex d-lg-none me-4">
        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
    </a>
    <a href="#" class="sidebar-toggler flex-shrink-0">
        <i class="fa fa-bars"></i>
    </a>
    <form class="d-none d-md-flex ms-4">
        <input class="form-control border-0" type="search" placeholder="Search">
    </form>
    <div class="navbar-nav align-items-center ms-auto">
        <div class="nav-item dropdown">
            <a href="#"  class="nav-link" data-bs-toggle="dropdown">
                <i class="fa fa-envelope me-lg-2 position-relative">
                <span id="message-badge" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    5
                </span>
                </i>
            </a>
            <div id="message" class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                <c:forEach var="message" items="messages">
                    <a href="#" class="dropdown-item">
                        <div class="d-flex align-items-center">
                            <img class="rounded-circle" src="asset/manager/img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="ms-2">
                                <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                <small>15 minutes ago</small>
                            </div>
                        </div>
                    </a>
                </c:forEach>
                <a href="#" class="dropdown-item text-center">더보기</a>
            </div>
        </div>
        <div class="nav-item dropdown">
            <a href="#" class="nav-link" data-bs-toggle="dropdown">
                <i class="fa fa-bell me-lg-2 position-relative">
                <span id="notify-badge" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                    99+
                </span>
                </i>
            </a>
            <div id="notification" class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                <c:forEach var="notification" items="notifications">
                    <a href="#" class="dropdown-item">
                        <h6 class="fw-normal mb-0">Profile updated</h6>
                        <small>15 minutes ago</small>
                    </a>
                    <hr class="dropdown-divider">
                </c:forEach>
                <a href="#" class="dropdown-item text-center">더보기</a>
            </div>
        </div>
        <div class="nav-item dropdown">
            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                <img class="rounded-circle me-lg-2" src="${manager.profileImg}" alt=""
                     style="width: 40px; height: 40px;">
                <span class="d-none d-lg-inline-flex">${manager.name}</span>
            </a>
            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                <a href="#" class="dropdown-item">마이 페이지</a>
                <a href="#" class="dropdown-item">식당 정보</a>
                <a href="#" class="dropdown-item">로그 아웃</a>
            </div>
        </div>
    </div>
</nav>

