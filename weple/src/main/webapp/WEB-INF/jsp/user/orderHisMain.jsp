<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
<div class="p-b-10">
	<h3 class="ltext-103 cl5"
		style="font-weight: 900; font-size: 20px; margin: 10px; text-align: right; color: #444;">
		나의 주문 내역</h3>
</div>
<div class="wrap-table-shopping-cart">
	<table class="table-shopping-cart">
		<tr class="table_head">
			<th style="text-align: center;">주문번호</th>
			<th style="padding-left: 180px;">주문날짜</th>
			<th style="text-align: center;">총 가격</th>
			<th style="text-align: center;">상세정보</th>
		</tr>
		<c:forEach var="orderList" items="${orderList }">
			<tr style="padding:0; margin:0;">
				<td style="padding:10px; margin:0; text-align: center;">${orderList.orderNum }</td>
				<td style="padding:10px; margin:0;">${orderList.orderDate }</td>
				<td style="padding:10px; margin:0; text-align: center;">${orderList.orderPrice }원</td>
				<td style="padding:10px; margin:0; text-align: center;">
					<a class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
							href="#" onclick="location.href = 'selectOrderDetail.do?orderNum=${orderList.orderNum }'" 
							style="text-align: center;"> 상세정보보기 </a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

	<%-- <table>
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
					<td>${orderList.orderDate }</td>
					<td>${orderList.orderPrice }</td>
					<td><input type="button" class="orderDetailBtn" value="상세정보보기"
						onclick="location.href = 'selectOrderDetail.do?orderNum=${orderList.orderNum }'"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table> --%>
