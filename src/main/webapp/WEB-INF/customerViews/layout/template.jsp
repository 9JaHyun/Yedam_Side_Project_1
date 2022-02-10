<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<<<<<<< HEAD
<title>Title</title>
<link href="asset/customer/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="asset/customer/js/bootstrap.min.js"></script>

=======
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><tiles:getAsString name="title"/></title>
	<link href="asset/customer/css/style.css" rel="stylesheet">
	<link href="asset/customer/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<script src="asset/customer/js/bootstrap.bundle.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
>>>>>>> d25cb0d (docs : ajax 로그인 필터에 안걸리게 수정)
</head>
<body>
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>

</body>
</html>
