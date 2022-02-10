<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<<<<<< HEAD
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- header -->
<header>
    <a href="cMain.do">
      <h2 class="fs-4">EatGo</h2>
    </a>
    <div>
    	<!-- 로그인 전 -->
    	<c:if test='${empty loginMember}'>
        <div>
            <a href="signupForm.do" class="btn btn-outline-primary me-2 btn-sm">회원가입</a>
            <a href="loginForm.do" class="btn btn-primary btn-lg btn-sm">로그인</a>
        </div>
        </c:if>
        <!-- 로그인 후 -->
        <c:if test='${not empty loginMember}'>
        <div class="dropdown text-end">
	        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
	          <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
	        </a>
	        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
	          <li><a class="dropdown-item" href="#">Profile</a></li>
	          <li><hr class="dropdown-divider"></li>
	          <li><a class="dropdown-item" href="#">Sign out</a></li>
	          <li>${loginMember}</li>
	        </ul>
        </div>
        </c:if>
    </div>
</header>
>>>>>>> d25cb0d (docs : ajax 로그인 필터에 안걸리게 수정)
