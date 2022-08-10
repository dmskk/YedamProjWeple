<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myList</title>
<style>
.pagination {
	display: inline-block;
	margin: 0 auto;
	margin-top: 20px;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
</head>
<body>
	<h3>My Review History</h3>
	<table border="1">
		
		<thead>
			<tr>
				<th>no</th>
				<th>제품명</th>
				<th>내용</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<form>
				<c:forEach var="myRevList" items="${pagingList }">
					<tr id="${myRevList.bno}" >
						<td>${myRevList.bno}</td>
						<td>${myRevList.prodName}</td>
						<td>${myRevList.boardContent}</td>		
						<td>${myRevList.writeDate}</td>
						<td><input type="button" value="삭제" name="delete" onclick="deleteConfirm(${myRevList.bno})"></td>
					</tr>
				</c:forEach>
			</form>
		
		</tbody>
	</table>
	<div class="pagination">
		<c:if test="${pageInfo.prev }">
			<a
				href="myListPaging.do?pageNum=${pageInfo.startPage - 1 }&amount=${pageInfo.cri.amount}">prev</a>
		</c:if>
		<c:forEach var="num" begin="${pageInfo.startPage }" end="${pageInfo.endPage}">
			<h2></h2>
			<a
				href="myListPaging.do?pageNum=${num}&amount=${pageInfo.cri.amount}">${num }</a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a
				href="myListPaging.do?pageNum=${pageInfo.endPage + 1 }&amount=${pageInfo.cri.amount}">next</a>
		</c:if>
	</div>

	<script language=javascript>
		
      function deleteConfirm(bno){
    	  
    	let titlebox = document.getElementById(bno);
        console.log(titlebox);
     	let del = confirm("작성한 리뷰를 진짜 삭제 하시겠습니까? 진짜?");
      
      if (del == true){
        alert("진짜 삭제하네..삭제완료!");
   		let urlParams = new URL(location.href).searchParams;
   		let pageNum = urlParams.get('pageNum');
   		let amount = urlParams.get('amount');
        
        fetch('deleteReview.do', {
    		method: 'post',
    		headers: {'Content-type': 'application/x-www-form-urlencoded'},
    		body: 'pageNum='+pageNum +'&amount='+amount +'&bno='+bno
    	})
    	.then(result => result.text())
    	.then(function(result){
    		if(result =='true') {
    			titlebox.remove();
    		} else {
    			alert('삭제를 실패했습니다.');
    		}
    	})
    	.catch(err => console.log(err))
        //location.href="deleteReview.do?bno=" + bno;
      }
    }
 
  </script>
</body>
</html>