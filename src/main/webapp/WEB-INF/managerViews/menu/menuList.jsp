<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="bg-light rounded h-100 p-4">
		
		<div class='row mb-3'>
			<div class='input-group col-sm-8'>
				<select id='restaurantId' class='form-control' name='restaurantId' required>
					<option value='' disabled selected>나의 가게 목록</option>
					<c:forEach items='${list}' var='restaurant'>
						<option value='${restaurant.restaurantId}'>${restaurant.name}</option>
					</c:forEach>
				</select>
				<button style='width:150px' type='button' class='btn btn-primary' onclick='selectRestaurantInfo()'>선택</button>
			</div>
		</div>
		<div class="row mb-3" id='draw'>
			<table border='1'>
				<tr>
					<td>글씨</td>
				</tr>
				<tr>
					<td class='test'></td>
				</tr>
			</table>	
	</div>

	<script>
		// 레스토랑 값 가져오는 기능
		function selectRestaurantInfo(){
			$.ajax({
				url:'myMenuList.do',
				type:'get',
				data:{'id':$('#restaurantId').val()},
				dataType:'json',
				contentType:'x-www-urlencoded; charset=utf-8',
				success:function(data){
					console.log(data)
					data.forEach((item) => {
						$('.test').append($('<img>').attr({'src':'asset/img/'+item.picture,'alt':'없음'}).css('width','300px'))
					})
				},
				error:function(data){
					console.log(data)
				}
			})
		}
	</script>
</body>
</html>