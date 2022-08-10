<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>

	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
	td, th{
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
			<h3 class="ltext-103 cl5" style="font-weight: 900; font-size: 26px; color: #444;">
				${notice.title }
			</h3>
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
