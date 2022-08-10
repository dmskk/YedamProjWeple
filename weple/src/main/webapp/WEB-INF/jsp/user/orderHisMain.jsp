<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderHistoryMain</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<style>
tr, th, td {
	border: 1px solid black
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>총 가격</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="orderList" items="${orderList }">
				<tr>
					<td>${orderList.orderNum }</td>
					<td>${orderList.orderPrice }</td>
					<td>${orderList.orderDate }</td>
					<td><input type="button" class="orderDetailBtn" value="상세정보보기"
						onclick="location.href = 'selectOrderDetail.do?orderNum=${orderList.orderNum }'"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>
</script>
</html>