<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderHistoryMain</title>
<style>
tr, th, td {
	border: 1px solid black
}
</style>
</head>
<body>
<h4>주문상세</h4>

<form id="orderList">
<table style="text-align: center;">
	<thead>
		<tr>
			<th colspan="5">공동구매</th>
		</tr>
	</thead>
	<tbody id="buyShare">
		<tr>
			<td>상품이름</td>
			<td>상품수량</td>
			<td>상품가격</td>
			<td>총가격</td>
			<td>리뷰달기</td>
		</tr>
		<c:forEach var="item" items="${orderHisDetailList }">
			<c:if test="${item.isShare eq 1 }">
				<tr>
					<td>${item.prodName }</td>
					<td>${item.buyAmount }</td>
					<td>${item.prodPrice}</td>
					<td>${item.totalPrice }</td>
					<c:if test="${item.isCompleted eq 1}">
					<td><input type="button" id="reviewBtn" onclick="#" value="리뷰달기"/></td>
					<!--  /reviewForm.jsp(tile로경로설정) -->
					</c:if>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>

<table style="text-align: center;">
	<thead>
		<tr>
			<th colspan="5">일반구매</th>
		</tr>
	</thead>
	<tbody id="notShare">
		<tr>
			<td>상품이름</td>
			<td>상품수량</td>
			<td>상품가격</td>
			<td>총가격</td>
			<td>리뷰달기</td>
		</tr>
		<c:forEach var="orderHisDetailList" items="${ orderHisDetailList}">
			<c:if test="${ orderHisDetailList.isShare == 0 }">
				<tr>
					<td>${orderHisDetailList.prodName }</td>
					<td>${orderHisDetailList.buyAmount }</td>
					<td>${orderHisDetailList.prodPrice}</td>
					<td>${orderHisDetailList.totalPrice }</td>
					<c:if test="${item.isCompleted eq 1}">
					<td><input type="button" id="reviewBtn" onclick="#" value="리뷰달기"/></td>
					<!--  /reviewForm.jsp(tile로경로설정) -->
					</c:if>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
</form>
</body>
</html>