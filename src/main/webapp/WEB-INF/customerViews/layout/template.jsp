<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-02-07
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title>Title</title>
<link href="asset/customer/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="asset/customer/js/bootstrap.min.js"></script>
</head>
<body>
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>

</body>
</html>
