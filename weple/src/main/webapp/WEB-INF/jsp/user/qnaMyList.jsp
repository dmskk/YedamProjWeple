<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Qna</title>
<style>
.pagination {
  display: inline-block;
  margin : 0 auto;
  margin-top : 20px;
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

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

</head>
<body>
	<table border="1">
	<cation>My QNA LIST</cation>
	<thead>
		<tr>
			<th width="80px">No
		 	<th width="80px">작성자</th>
            <th width="150px">제목</th>
            <th width="150px">날짜</th>
            <th width="40px">조회</th>
            <th width="40px">답변여부</th>
            <th>삭제</th>
		</tr>
		
		
	</thead>
	<tbody>	
		<c:forEach var="myQnaList" items="${allMyQnaList }">
			<tr id="${myQnaList.bno}">
				<td>${myQnaList.bno}</td>
				<td>${myQnaList.writer}</td>	
				<td onclick="open_box()">${myQnaList.title}</td>
				<td>${myQnaList.writeDate}</td>
				<td>${myQnaList.CNT}</td>
				<td>${myQnaList.isHandled}</td>
				<td><input type="button" value="삭제" name="delete" onclick="deleteQnaConfirm(${myQnaList.bno})"></td>
			</tr>
			<tr class="resp" style="display: none;">
				<td colspan="7">
					${myQnaList.boardContent }
				
				</td>
			</tr>
		</c:forEach>
		
	</tbody>
	</table>
	<div class="pagination">
		<c:if test="${pageInfo.prev }">
			<a
				href="myQnaListPaging.do?pageNum=${pageInfo.startPage - 1 }&amount=${pageInfo.cri.amount}">prev</a>
		</c:if>
		<c:forEach var="num" begin="${pageInfo.startPage }"
			end="${pageInfo.endPage }">
			<a
				href="myQnaListPaging.do?pageNum=${num}&amount=${pageInfo.cri.amount}">${num }</a>
		</c:forEach>
		<c:if test="${pageInfo.next }">
			<a
				href="myQnaListPaging.do?pageNum=${pageInfo.endPage + 1 }&amount=${pageInfo.cri.amount}">next</a>
		</c:if>
	</div>
	
	<script language=javascript>
		
	 function deleteQnaConfirm(bno){
			console.log(bno);
			let titlebox = document.getElementById(bno);
	        console.log(titlebox);
	     	let del = confirm("작성한 게시글을 진짜 삭제 하실껍니까!!?");
	      
	      if (del == true){
	        alert("삭제완료!");
	   		let urlParams = new URL(location.href).searchParams;
	   		let pageNum = urlParams.get('pageNum');
	   		let amount = urlParams.get('amount');
	        
	        fetch('deleteQna.do', {
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
	 function open_box() {
		   event.target.parentElement.nextElementSibling.style.display = "block";
		 	  
		}

	function close_box(bno) {
		   document.getElementById(bno).style.display = "none";
		   
		}

	</script>
</body>
</html>