<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
select option[value=""][disabled] {
	display: none;
}
</style>
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
			<table class='table'>
				<thead>
					<tr>
						<th>사진</th>
						<th>이름</th>
						<th>가격</th>
						<th>[수정] / [삭제]</th>
					</tr>
				</thead>
				<tbody id='menuList'>
				</tbody>
			</table>	
	</div>

	<script>
		// 메뉴 리스트 가져오는 기능
		function selectRestaurantInfo(){
			$.ajax({
				url:'myMenuList.do',
				type:'get',
				data:{'id':$('#restaurantId').val()},
				dataType:'json',
				contentType:'x-www-urlencoded; charset=utf-8',
				success:function(data){
					$('#menuList').children().remove()
					data.forEach((item) => {
						$('#menuList').append(makeTr(item))
					})
				},
				error:function(data){
					console.log(data)
				}
			})
		}
		
		function makeTr(data){
			var img = $('<img>').attr({'src':'asset/img/'+data.picture,'alt':'...'}).css({'width':'100%','height':'100%','object-fit':'cover'})
			var updB = $('<button>').text('수정').addClass('btn btn-primary').attr('onclick','updateFnc('+data.menuId+')')
			var delB = $('<button>').text('삭제').addClass('btn btn-danger').attr('onclick','deleteFnc('+data.menuId+')')
			var name = $('<input>').attr({'type':'text','id':data.menuId+'name'}).val(data.name).addClass('form-control')
			var cost = $('<input>').attr({'type':'number','id':data.menuId+'cost'}).val(data.cost).addClass('form-control')
			
			var td1 = $('<td>').css({'width':'100px','height':'100px'}).append(img)
			var td2 = $('<td>').append(name)
			var td3 = $('<td>').append(cost)
			var td4 = $('<td>').append(updB,' / ',delB)
			return $('<tr>').append(td1,td2,td3,td4).attr('id',data.menuId)
		}
		
		function updateFnc(data) {
			$.ajax({
				url:'menuUpdate.do',
				data:{
					'id':data,
					'name':$('#'+data+'name').val(),
					'cost':$('#'+data+'cost').val()
				},
				type:'post',
				success:function(data){
					if(data == 1){
						alert('수정되었습니다.')						
					} else {
						alert('수정에 실패했습니다.')
					}
				},
				error:function(data){
					console.log(data)
				}
			})
		}
		
		function deleteFnc(data) {
			$.ajax({
				url:'menuDelete.do',
				data:{'id':data},
				type:'post',
				success:function(data){
					if(data != 0){	
						$('tr#'+data).remove()					
					} else {
						alert('삭제에 실패했습니다.')
					}
				},
				error:function(data){
					console.log(data)
				}
			})
		}
	</script>
</body>
</html>