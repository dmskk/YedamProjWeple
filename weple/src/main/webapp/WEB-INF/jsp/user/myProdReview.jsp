<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div>
	<table>
		<tr>
			<td>작성일</td>
			<td>${boardVO.writeDate }</td>
		</tr>
		<tr>
			<td>별점</td>
			<td>${boardVO.CNT }</td>
		</tr>
		<tr>
			<td>작성내용</td>
			<td>${boardVO.boardContent }</td>
		</tr>
	</table>
</div>