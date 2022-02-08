<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-02-07
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- header -->
<header>
    <a href="main.do">
      <h2 class="fs-4">EatGo</h2>
    </a>
    <div>
        <div>
            <a href="#" class="btn btn-outline-primary me-2 btn-sm">회원가입</a>
            <a href="#" class="btn btn-primary btn-lg btn-sm">로그인</a>
        </div>
        <div class="dropdown text-end" style="display: none;">

            <!-- 로그인 전 -->
            <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
            </a>

            <!-- 로그인 후 -->
            <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
              <li><a class="dropdown-item" href="#">New project...</a></li>
              <li><a class="dropdown-item" href="#">Settings</a></li>
              <li><a class="dropdown-item" href="#">Profile</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Sign out</a></li>
            </ul>
        </div>
    </div>
</header>
