<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<link href="${pageContext.request.contextPath}/css/catgDisp.css"
	rel="stylesheet">
</head>
<div class="p-b-10">
	<h3 class="ltext-103 cl5"
		style="font-weight: 900; font-size: 20px; margin: 10px; text-align: right; color: #444;">
		찜 목록</h3>
</div>
<div class="wrap-table-shopping-cart">
	<table class="table-shopping-cart">
		<tr class="table_head">
			<th class="column-1">상품</th>
			<th class="column-2"></th>
			<th class="column-3"></th>
			
			<th class="column-4" style="padding-right:30px;">가격</th>
			<th class="column-5"></th>
		</tr>
		<c:forEach var ="prod" items="${myjjimProd }">
			<tr class="table_row" style="padding:0 15px; margin:0;">
				<td class="column-1" style="padding:0 15px; margin:0;"> <img src="${prod.imgUrl }" alt="IMG" style="width: 160px;"></td>
				<td class="column-2" colspan="2" style="padding:0 15px; margin:0;">
					<a href="productDetail.do?prodId=${prod.prodId}" 
					class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">${prod.prodName }</a>
				</td>
				<td class="column-4" style="padding:0 15px; margin:0; color: #888888;">${prod.prodPrice }원</td>
				<td class="column-5" style="padding-right:60px; padding-top:20px; margin:0;">
					<div id="jjim">
						<input id="heart${prod.prodId}" type="checkbox" checked onClick="return false;" />
						<label for="heart${prod.prodId}" onclick="jjimclick(${prod.prodId})" > ❤</label>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jjim.js"></script>