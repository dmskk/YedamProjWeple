<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<form action="updateComments.do" role="form" method="post" autocomplete="off">
		<span>${param.repleNum }</span>
		<label for="reple">수정할 리플</label>
		<input type="text" name="reple">
	</form>
</body>
<script>
console.log(${param.repleNum });
</script>
</html>