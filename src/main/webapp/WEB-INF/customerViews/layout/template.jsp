<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-02-07
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <%--calendar--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
          rel="stylesheet">
    <link href="asset/customer/css/style.css" rel="stylesheet">
    <link href="asset/customer/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="asset/manager/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
          rel="stylesheet"/>

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <script src="asset/customer/js/bootstrap.bundle.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>



</head>
<body>
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>

<%--js for Library--%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="asset/manager/lib/tempusdominus/js/moment.min.js"></script>
<script src="asset/manager/lib/tempusdominus/js/ko.js"></script>
<script src="asset/manager/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="asset/manager/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="asset/customer/js/main.js"></script>
</body>
</html>
