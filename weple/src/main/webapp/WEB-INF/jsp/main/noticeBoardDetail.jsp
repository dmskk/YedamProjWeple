<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

td, th {
	padding: 10px;
}

.td-date {
	width: 80px;
}

.td-cnt {
	width: 50px;
	text-align: right;
}

.td-cnt.head {
	width: 80px;
}
</style>

<section class="bg0 p-t-23 p-b-140" style="padding-top: 150px;">
	<div class="container">
		<div class="p-b-10" style="padding-bottom: 15px;">
			<h3 class="ltext-103 cl5"
				style="font-weight: 900; font-size: 26px; color: #444;">
				${notice.title }</h3>
		</div>

		<div class="wrap-table-shopping-cart">
			<table class="table-shopping-cart">
				<tr>
					<th class="td-date">작성일자</th>
					<th>${notice.writeDate }</th>
					<th class="td-cnt head">조회수</th>
					<th class="td-cnt">${notice.CNT }</th>
				</tr>
				<tbody>
					<tr>
						<td colspan="4">${notice.boardContent }<</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>
<c:if test="${empty userId }">
	<input type="button" id="createBtn" value="댓글달기">
</c:if>
<table id="commentTable">
		<tr>
			<th>유저id</th>
			<th>작성내용</th>
			<th>작성일자</th>
		</tr>
</table>
<script>
	showAllComment();
	
	function showAllComment() {
		$.ajax({
			url : "showComments.do?bno=${notice.bno}",
			type : "GET",
			dataType : 'json',
			success : function(req) {
				console.log(req);
				let table_html = '';
				
				for(let i = 0; i < req.length; i++) {
					table_html += `<tr>`;
					table_html += `<td class="hidden" style="display: none;">` + req[i].repleNum + `</td>`;
					table_html += `<td>` + req[i].userId + `</td>`;
					
					table_html += `<td>` + req[i].reple + `</td>`;
					table_html += `<td>` + req[i].writeDate + `</td>`;
					if(req[i].userId == "${userId }") {
						table_html += `<td><input type="button" value="수정" class="updateBtn" onclick="location.href = 'sendRepleNum.do?repleNum=`;
						table_html += req[i].repleNum;
						table_html += `'"></td>`;  
						table_html += `<td><input type="button" value="삭제" class="deleteBtn"></td>`
					}
					table_html += `</tr>`;
				}
				$('#commentTable').append(table_html);
			},
			error : function(er) {
				console.log("실패 원인 : " + er);
			}
			
		})
		
		/* 삭제 버튼 */
		$(document).on("click", ".deleteBtn", function(event) {
			var deleteBtn = $(event.target);
			var repleNum = deleteBtn.parent().parent().children(".hidden").text();
			console.log(repleNum);
			
			fetch("deleteComments.do", {
				method: 'post',
				headers: {'Content-type': 'application/x-www-form-urlencoded'},
				body: 'repleNum=' + repleNum + '&bno=${notice.bno}'
				
			})
			.then(result => result.text())
			.then(console.log(${notice.bno}))
			.catch(err => console.log(err));
		
			deleteBtn.parent().parent().remove();
		})
	}
</script>
