<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<table class="table-shopping-cart" id="cartTable">
			<!-- 공동구매 -->
			<tr>
				<th colspan="5" class="table_head"
					style="padding: 12px 50px; background: #222222; color: white;">공동구매</th>
			</tr>
			<tr class="table_head">
				<th class="column-1">상품</th>
				<th class="column-2"></th>
				<th class="column-3">개별가격</th>
				<th class="column-4">수량</th>
				<th class="column-5">금액</th>
			</tr>
			<c:forEach var="cartList" items="${cartList }" >
				<c:if test="${cartList.isShare == 1}">
					<tr class="table_row">
						<td class="column-1">
							<div class="hidden" style="display: none;">${cartList.prodId }</div>
							<div class="hiddenIsShare" style="display: none;">1</div>
							<img src="${cartList.imgUrl }" alt="IMG" style="width: 60px;">
						</td>
						<td class="column-2" style="padding-right: 20px;"><a
							class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
								${cartList.prodName }</a></td>
						<td class="column-3">${cartList.prodPrice }원</td>
						<td class="column-4">
							
									${cartList.buyAmount }
						</td>
						<td class="column-5">${cartList.totalPrice }원</td>
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<th colspan="5" class="table_head"
					style="padding: 12px 50px; background: #222222; color: white;">일반구매</th>
			</tr>
			<tr class="table_head">
				<th class="column-1">상품</th>
				<th class="column-2"></th>
				<th class="column-3">개별가격</th>
				<th class="column-4">수량</th>
				<th class="column-5">금액</th>
			</tr>
			<c:forEach var="cartList" items="${cartList }">
				<c:if test="${cartList.isShare == 0}">
				<tr class="table_row">
					<td class="column-1">
						<div class="hidden" style="display: none;">${cartList.prodId }</div>
						<div class="hiddenIsShare" style="display: none;">0</div>
						<div class="how-itemcart1">
						<img src="${cartList.imgUrl }" alt="IMG" style="width: 60px;">
						</div>
					</td>
					<td class="column-2" style="padding-right: 20px;">${cartList.prodName }</td>
					<td class="column-3">${cartList.prodPrice }원</td>
					<td class="column-4">
						${cartList.buyAmount }
					</td>
					<td class="column-5">${cartList.totalPrice }원</td>
				</tr>
				</c:if>
			</c:forEach>
		<div class="orderInfo">
			<form action="insertOrder.do" role="form" method="post"
				autocomplete="off">

				<input type="radio" name="default" value="default" id="default">기본배송지

				<div class="inputArea">
					<label for="zipCode">우편번호</label> <input type="text" name="zipCode"
						id="zipCode" required="required" />
				</div>

				<div class="inputArea">
					<label for="addr">1차 주소</label> <input type="text" name="addr"
						id="addr" required="required" />
				</div>

				<div class="inputArea">
					<label for="addr2">2차 주소</label> <input type="text" name="addr2"
						id="addr2" required="required" />
				</div>

				<div class="inputArea">
					<label for="addrDetail">상세주소</label> <input type="text"
						name="addrDetail" id="addrDetail" required="required" />
				</div>

				<div class="inputArea">
					<label for="orderInfo">결제정보</label> <input type="radio"
						name="orderInfo" value="noBankbook" /> 무통장입금 <input type="radio"
						name="orderInfo" value="creditCard" /> 카드결제
				</div>

				<div class="inputArea">
					<button type="submit" class="order_btn">주문</button>
				</div>
			</form>
		</div>
		</table>
</body>
<script>
	// 기본배송지 onclick시 배송지 데이터 ajax로 받아오고(fetch then)쓰자
	// 받아온 배송지 정보 가공해서 value로 집어넣고 출력물을 보자

	// controller
	$("input[name='default']").change(function() {
			fetch('showDefaultAddr.do', {
				method: 'post',
				hearders : {'Content-type': 'application/x-www-form-urlencoded'},
				body: ''
			})
			.then(result => result.json())
			.then(result => {
				console.log(result);
				$("#zipCode").val(result.zipCode);
				$("#addr").val(result.addr);
				$("#addr2").val(result.addr2);
				$("#addrDetail").val(result.addrDetail);
			})
			.catch(err => console.log(err))
	});
	
	
</script>
</html>