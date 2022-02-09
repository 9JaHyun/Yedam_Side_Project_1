<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="container-fluid pt-4 px-4">
		<div class="bg-light text-center rounded p-4">
			<div class="d-flex align-items-center justify-content-between mb-4">
				<h6 class="mb-0">예약 현황</h6>
			</div>
			<div class="table-responsive">
				<table
					class="table text-start align-middle table-bordered table-hover mb-0">
					<tbody>
						<c:forEach var="reserve" items="${reserves }" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${reserve.tel}</td>
								<td>${reserve.orderCount}명</td>
								<td>
								<fmt:formatDate value='${reserve.orderTime }' pattern='yyyy년MM월dd일 hh:mm'/> 
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